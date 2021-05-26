package tennisPartner.accessingdatamysql;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.time.DateTimeException;
import java.time.OffsetDateTime;
//import com.google.maps.model.LatLng;

@Entity
public class Match {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)

    private Long id;
    private Integer minSkillLevel;
    private Integer maxSkillLevel;
    private Integer numberOfPlayers;
    private java.sql.Time startTime; //not sure if this is the correct time format
    private java.sql.Time endTime;
    private java.sql.Date date;
    private String tennisCourt;
    @ManyToOne
    private User user; //not sure this is correct
    //private LatLng position;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setMaxSkillLevel(Integer maxSkillLevel) {
        this.maxSkillLevel = maxSkillLevel;
    }

    public Integer getNumberOfPlayers() {
        return numberOfPlayers;
    }

    public void setNumberOfPlayers(Integer numberOfPlayers) {
        this.numberOfPlayers = numberOfPlayers;
    }


    public String getTennisCourt() {
        return tennisCourt;
    }

    public void setTennisCourt(String tennisCourt) {
        this.tennisCourt = tennisCourt;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getMinSkillLevel() {
        return minSkillLevel;
    }

    public void setMinSkillLevel(Integer minSkillLevel) {
        this.minSkillLevel = minSkillLevel;
    }

    public Integer getMaxSkillLevel() {
        return maxSkillLevel;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
    }
}
