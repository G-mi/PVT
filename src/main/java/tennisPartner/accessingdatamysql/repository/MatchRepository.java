package tennisPartner.accessingdatamysql.repository;
import com.fasterxml.jackson.databind.deser.DataFormatReaders;
import org.springframework.data.repository.CrudRepository;
import tennisPartner.accessingdatamysql.Match;
import tennisPartner.accessingdatamysql.User;

public interface MatchRepository extends CrudRepository<Match, Integer> {

    /*
    Match findAllByUser(User user);

    Match findAllByUserNotIn(User user);

    Match findAllByUser_Gender(String gender);

    Match findAllByMaxSkillLevelAndMinSkillLevel(int min, int max);

    Match findAllByTennisCourt(String tennisCourt);

    Match findByUserAge(int age);
*/








}
