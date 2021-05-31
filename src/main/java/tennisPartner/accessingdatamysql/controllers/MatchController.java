package tennisPartner.accessingdatamysql.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tennisPartner.accessingdatamysql.Matches;
import tennisPartner.accessingdatamysql.User;
import tennisPartner.accessingdatamysql.repository.MatchesRepository;
import tennisPartner.accessingdatamysql.repository.UserRepository;
import tennisPartner.accessingdatamysql.security.MessageResponse;

import javax.validation.Valid;
import java.util.ArrayList;


@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/match")
public class MatchController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    MatchesRepository matchesRepository;

    @PostMapping("/add")
    public ResponseEntity<?> addMatch(@Valid AddMatchRequest addMatchRequest) {
        User user = userRepository.findByName(addMatchRequest.getUsername());

        Matches matches = new Matches(addMatchRequest.getMinSkillLevel(), addMatchRequest.getMaxSkillLevel(),
                addMatchRequest.getNumberOfPlayers(), addMatchRequest.getStartTime(), addMatchRequest.getEndTime(),
                addMatchRequest.getDate(), addMatchRequest.getPosition(), user );

        matchesRepository.save(matches);
        return ResponseEntity.ok(new MessageResponse("Request to play added successfully!"));
    }

    @GetMapping(path = "/all")
    public @ResponseBody
    Iterable<Matches> getAllMatches() {
        return matchesRepository.findAll();
    }


    @GetMapping("/allbyuser")
    public ArrayList findByUser(@RequestBody String userName) {
        User user = userRepository.findByName(userName);
        return (ArrayList) matchesRepository.findAllByUser(user);
    }
}


/*
    @GetMapping("/genderfilter")
    //todo:: fix
    public @ResponseBody Iterable<Match> getByGender(String gender) {
        return (Iterable<Match>) matchRepository.findAllByUser_Gender(gender);
    }
}
     */