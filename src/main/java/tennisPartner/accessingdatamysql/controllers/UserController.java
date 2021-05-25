package tennisPartner.accessingdatamysql.controllers;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import tennisPartner.accessingdatamysql.security.MessageResponse;
import tennisPartner.accessingdatamysql.User;
import tennisPartner.accessingdatamysql.repository.UserRepository;
import tennisPartner.accessingdatamysql.security.*;

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

    @CrossOrigin(origins = "http://localhost:60134")
    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@Valid LoginRequest loginRequest) {

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

        //todo: send correct info
        return ResponseEntity.ok(new JwtResponse(jwt,
                userDetails.getUsername(),
                userDetails.getEmail()

                ));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {
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
                encoder.encode(signUpRequest.getPassword()), signUpRequest.getFirstname(), signUpRequest.getLastname(), signUpRequest.getAge(), signUpRequest.getGender(), signUpRequest.getAge());

        userRepository.save(user);

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

    @GetMapping("/userdata")
    public ResponseEntity<?> getUserDataByEmail(@RequestParam String email) {

        if (!userRepository.existsByEmail(email)) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: No such user"));
        } else {
            User user = userRepository.findByEmail(email);
            //todo: return user info
           return ResponseEntity.ok(user.getName());
        }
    }


    @GetMapping("/userinfo")
    public ResponseEntity<?> getUserDataByName(@RequestParam String name) {

        if (!userRepository.existsByName(name)) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: No such user"));
        } else {
            User user = userRepository.findByName(name);
            //todo: return user info
            return ResponseEntity.ok(user);
        }
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
}



