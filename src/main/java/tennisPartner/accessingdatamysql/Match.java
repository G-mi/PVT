package tennisPartner.accessingdatamysql;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Date;
import java.time.OffsetDateTime;

@Entity
public class Match {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)

    private Long id;
    private Integer minSkillLevel;
    private Integer maxSkillLevel;
    private Integer numberOfPlayers;
    private OffsetDateTime startTime;
    private OffsetDateTime endTime;



    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
    }
}
