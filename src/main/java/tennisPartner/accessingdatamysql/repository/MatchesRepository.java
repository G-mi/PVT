package tennisPartner.accessingdatamysql.repository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import tennisPartner.accessingdatamysql.Matches;
import tennisPartner.accessingdatamysql.User;
import java.util.Date;
import java.util.List;

public interface MatchesRepository extends CrudRepository<Matches, Integer> {



    Matches findByTennisCourtAndDateIsAfter(@Param("tennisCourt") String tennisCourt, Date now);

    List<Matches> findAllByUser(User user);
}
