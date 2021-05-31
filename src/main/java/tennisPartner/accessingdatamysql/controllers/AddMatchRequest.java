package tennisPartner.accessingdatamysql.controllers;


public class AddMatchRequest {

    private Integer minSkillLevel;
    private Integer maxSkillLevel;
    private Integer numberOfPlayers;
    private String startTime; //not sure if this is the correct time format
    private String endTime;
    private String date;
    //private String tennisCourt;
    private String position;
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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



    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
