package tennisPartner.accessingdatamysql.controllers;

import javax.validation.Valid;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import tennisPartner.accessingdatamysql.security.MessageResponse;
import tennisPartner.accessingdatamysql.User;
import tennisPartner.accessingdatamysql.repository.UserRepository;
import tennisPartner.accessingdatamysql.security.*;

import java.util.Map;
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    UserRepository userRepository;
    @Autowired
    PasswordEncoder encoder;
    @Autowired
    JwtUtils jwtUtils;
   @Autowired
    ObjectMapper mapper;


    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@RequestParam Map loginRequest) {
        String username = (String) loginRequest.get("username");
        String password = (String) loginRequest.get("password");

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

        //todo: send correct info
        return ResponseEntity.ok(new JwtResponse(jwt,
                userDetails.getUsername(),
                userDetails.getEmail()
                ));
    }

    @PostMapping(path ="/signup")

    public ResponseEntity<?> registerUser(@Valid SignupRequest signUpRequest) {
        if (userRepository.existsByName(signUpRequest.getUsername())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Username is already taken!"));
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Email is already in use!"));
        }

        User user = new User(signUpRequest.getUsername(),
                signUpRequest.getEmail(),
                encoder.encode(signUpRequest.getPassword()), signUpRequest.getFirstname(), signUpRequest.getLastname(), signUpRequest.getAge(),
                signUpRequest.getGender(), signUpRequest.getSkillLevel(), signUpRequest.getAboutInfo());

        userRepository.save(user);

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }



    @GetMapping(path = "/currentuserinfo")
    public ResponseEntity<?> getUserDataByName(@RequestParam Map nameMap) {

            String username = (String) nameMap.get("name");

        if (!userRepository.existsByName(username)) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: No such user"));
        } else {
            User user = userRepository.findByName(username);
            //todo: return user info
            return ResponseEntity.ok(user);
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> updateUserInfo(@RequestParam Map userInfo){
        String userName = (String) userInfo.get("name");
        String email = (String) userInfo.get("email");
        String firstName = (String) userInfo.get("firstName");
        String lastName = (String) userInfo.get("lastName");
        int skillLevel = (Integer) userInfo.get("skillLevel");
        String aboutInfo = (String) userInfo.get("aboutInfo");

        User user = userRepository.findByName(userName);

        user.setName(userName);
        user.setAboutInfo(aboutInfo);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setSkillLevel(skillLevel);

        return ResponseEntity.ok("Saved updated info");
    }

    @DeleteMapping("/deleteuser")
        public ResponseEntity<?> deleteUser(@RequestParam String name) {
        User user = userRepository.findByName(name);
        userRepository.delete(user);

        return ResponseEntity.ok().body(new MessageResponse("User deleted"));

    }
    //to clean up all test users.
    @DeleteMapping("/deleteAll")
    public String deleteUsers() {
        userRepository.deleteAll();
        return "Deleted";
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<User> getAllUsers() {
        // This returns a JSON or XML with the users
        return userRepository.findAll();
    }



}




