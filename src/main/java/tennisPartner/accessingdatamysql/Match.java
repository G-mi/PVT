package tennisPartner.accessingdatamysql;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Match {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)

    private Long id;
    private int minSkillLevel;
    private int maxSkillLevel;
    private int numberOfPlayers;



    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
    }
}
