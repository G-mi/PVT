package tennisPartner.accessingdatamysql.repository;
import org.springframework.data.repository.CrudRepository;
import tennisPartner.accessingdatamysql.User;

public interface MatchReository extends CrudRepository<User, Integer> {

}
