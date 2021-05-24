package tennisPartner.accessingdatamysql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tennisPartner.accessingdatamysql.repository.UserRepository;

@RestController // This means that this class is a Controller
// path="/demo" was the default here
@RequestMapping(path="/tennisPartner") // This means URL's start with /demo (after Application path)
public class MainController  {



    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private UserRepository userRepository;


    //there is a method to add new user in usercontroller that needs to be updated with correct info.
    @PostMapping(path="/add") // Map ONLY POST Requests
    public @ResponseBody String addNewUser (@RequestParam String name, String email, String password) {      // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        User n = new User();
        n.setName(name);
        n.setEmail(email);
        userRepository.save(n);
        return "Saved";
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<User> getAllUsers() {
        // This returns a JSON or XML with the users
        return userRepository.findAll();
    }





    @GetMapping("/controller")
    public String helloCon(@RequestParam(value = "name", defaultValue = "controller") String name) {
        return String.format("Hello %s" , name);
    }

    @GetMapping("/helloController")
    public String hello(@RequestParam (value = "hi", defaultValue = "Wow") String name) {

        return String.format("Hi %s", name);
    }
}