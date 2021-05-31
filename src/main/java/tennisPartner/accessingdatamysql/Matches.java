package tennisPartner.accessingdatamysql;

import javax.persistence.*;
import java.io.Serializable;


@Entity
public class Matches implements Serializable {

        @Id
        @GeneratedValue(strategy= GenerationType.AUTO)
        private Long id;
        private Integer minSkillLevel;
        private Integer maxSkillLevel;
        private Integer numberOfPlayers;
        private String startTime; //not sure if this is the correct time format
        private String endTime;
        private String date;
        private String tennisCourt;
        private String position;

      @ManyToOne()
       private User user;

    public Matches(Integer minSkillLevel, Integer maxSkillLevel, Integer numberOfPlayers, String startTime, String endTime, String date, String position, User user) {
        this.minSkillLevel = minSkillLevel;
        this.maxSkillLevel = maxSkillLevel;
        this.numberOfPlayers = numberOfPlayers;
        //should be in timeformat
        this.startTime = startTime;
        this.endTime = endTime;
        //should be date format to be able to search by date
        this.date = date;
        this.position = position;
        this.user = user;
    }


    public Matches() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public void setMaxSkillLevel(Integer maxSkillLevel) {
        this.maxSkillLevel = maxSkillLevel;
    }

    public Integer getNumberOfPlayers() {
        return numberOfPlayers;
    }

    public void setNumberOfPlayers(Integer numberOfPlayers) {
        this.numberOfPlayers = numberOfPlayers;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTennisCourt() {
        return tennisCourt;
    }

    public void setTennisCourt(String tennisCourt) {
        this.tennisCourt = tennisCourt;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }





}


