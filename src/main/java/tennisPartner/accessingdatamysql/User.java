package tennisPartner.accessingdatamysql;
import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity // This tells Hibernate to make a table out of this class
public class User implements Serializable{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    private String name;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private int age;
    private String gender;
    private int skillLevel;
    private String aboutInfo;


    @OneToMany(cascade=CascadeType.ALL,fetch= FetchType.LAZY,mappedBy = "user")
    private List<Match> plannedMatches;
    private boolean isEnabled; //remove from database

    public String getAboutInfo() {
        return aboutInfo;
    }

    public void setAboutInfo(String aboutInfo) {
        this.aboutInfo = aboutInfo;
    }

    public User() {
    }

    public User(String username, String email, String password, String firstname, String lastname, int age, String gender, int skillLevel, String aboutInfo) {
        this.name = username;
        this.email = email;
        this.password = password;
        this.firstName = firstname;
        this.lastName = lastname;
        this.age = age;
        this.gender = gender;
        this.skillLevel = skillLevel;
        this.aboutInfo = aboutInfo;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() { return firstName; }

    public void setFirstName(String firstname) {this.firstName = firstname; }

    public String getLastName() { return lastName; }

    public void setLastName(String lastname) { this.lastName = lastname; }

    public int getAge() {  return age;  }

    public void setAge(int age) { this.age = age; }

    public String getGender() {  return gender;  }

    public void setGender(String gender) { this.gender = gender; }

    public int getSkillLevel() { return skillLevel; }

    public void setSkillLevel(int skillevel) { this.skillLevel = skillevel; }

    public boolean isEnabled() {
        return isEnabled;
    }
}
