package tennisPartner.accessingdatamysql;

import javax.persistence.*;
import java.sql.Date;
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
    private OffsetDateTime startTime; //not sure if this is the correct time format
    private OffsetDateTime endTime;
    private String tennisCourt;
    @ManyToOne
    private User user;
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

    public OffsetDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(OffsetDateTime endTime) {
        this.endTime = endTime;
    }

    public String getTennisCourt() {
        return tennisCourt;
    }

    public void setTennisCourt(String tennisCourt) {
        this.tennisCourt = tennisCourt;
    }

    public OffsetDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(OffsetDateTime startTime) {
        this.startTime = startTime;
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
