package tennisPartner.accessingdatamysql.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tennisPartner.accessingdatamysql.Match;
import tennisPartner.accessingdatamysql.User;
import tennisPartner.accessingdatamysql.repository.MatchRepository;
import tennisPartner.accessingdatamysql.repository.UserRepository;
import tennisPartner.accessingdatamysql.security.MessageResponse;


@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/match")
public class MatchController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    MatchRepository matchRepository;

    @PostMapping("/add")
    public ResponseEntity<?> addMatch(@RequestBody Match match){
        //add constructor
       matchRepository.save(match);
        return ResponseEntity.ok(new MessageResponse("Request to play added successfully!"));

    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<Match> getAllMatches() {
        return matchRepository.findAll();
    }

    //todo:: fix
    @GetMapping(path="/allnotuser")
    public @ResponseBody Iterable<Match> getAllMatches(User user) {
        return (Iterable<Match>) matchRepository.findAllByUserNotIn(user);
    }

    //todo:: fix
    @GetMapping(path="/allbyuser")
    public @ResponseBody Iterable<Match> getAllByUser(User user) {
        return (Iterable<Match>) matchRepository.findAllByUser(user);
    }




    @GetMapping("/genderfilter")
    //todo:: fix
    public @ResponseBody Iterable<Match> getByGender(String gender) {

        return (Iterable<Match>) matchRepository.findAllByUser_Gender(gender);
    }






}
