package tennisPartner.accessingdatamysql.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tennisPartner.accessingdatamysql.User;
import tennisPartner.accessingdatamysql.repository.MatchRepository;
import tennisPartner.accessingdatamysql.repository.UserRepository;
import tennisPartner.accessingdatamysql.security.MessageResponse;

import java.util.Map;



@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/match")
public class MatchController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    MatchRepository matchRepository;

    @PostMapping("/add")
    public ResponseEntity<?> addMatch(@RequestParam Map match){
        String username = (String) match.get("username");
        User user = userRepository.findByName(username);
        int minskill = (int) match.get("minSkillLevel");
        int maxskill = (int) match.get("maxSkillLevel");


        return ResponseEntity.ok(new MessageResponse("Request to play added successfully!"));

    }






}
