package tennisPartner.accessingdatamysql;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity // This tells Hibernate to make a table out of this class
public class User implements Serializable{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    private String name;
    private String email;
    private String password;
    private String firstname;
    private String lastname;
    private int age;
    private String gender;
    private int skillevel;
    private boolean isEnabled;



    public User() {
    }

    public User(String username, String email, String password, String firstname, String lastname, int age, String gender, int skillevel) {
        this.name = username;
        this.email = email;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.age = age;
        this.gender = gender;
        this.skillevel = skillevel;
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

    public String getFirstname() { return firstname; }

    public void setFirstname(String firstname) {this.firstname = firstname; }

    public String getLastname() { return lastname; }

    public void setLastname(String lastname) { this.lastname = lastname; }

    public int getAge() {  return age;  }

    public void setAge(int age) { this.age = age; }

    public String getGender() {  return gender;  }

    public void setGender(String gender) { this.gender = gender; }

    public int getSkillevel() { return skillevel; }

    public void setSkillevel(int skillevel) { this.skillevel = skillevel; }

    public boolean isEnabled() {
        return isEnabled;
    }
}
