package tennisPartner.accessingdatamysql.security;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class SignupRequest {


        @NotBlank
        @Size(min = 3, max = 20)
        private String username;

        @NotBlank
        @Size(max = 50)
        @Email
        private String email;


        @NotBlank
        private String password;
        private String firstname;
        private String lastname;
        private int age;
        private String gender;
        private int skillLevel;

    public String getAboutInfo() {
        return aboutInfo;
    }

    public void setAboutInfo(String aboutInfo) {
        this.aboutInfo = aboutInfo;
    }

    private String aboutInfo;



        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
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

        public int getSkillLevel() {return skillLevel; }

    public void setSkillLevel(int skillevel) { this.skillLevel = skillevel;    }

    public int getAge() {  return age;    }

    public void setAge(int age) {  this.age = age;    }

    public String getLastname() { return lastname;    }

    public void setLastname(String lastname) { this.lastname = lastname;  }

    public String getFirstname() { return firstname;    }

    public void setFirstname(String firstname) { this.firstname = firstname;  }

    public String getGender() { return gender;    }

    public void setGender(String gender) { this.gender = gender;    }
}
