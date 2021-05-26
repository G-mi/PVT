package tennisPartner.accessingdatamysql.repository;

import org.springframework.data.repository.CrudRepository;
import tennisPartner.accessingdatamysql.User;

import java.util.Optional;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface UserRepository extends CrudRepository<User, Integer> {
    User findByEmail(String email);

    User findByName(String name);


    boolean existsByName(String username);

    boolean existsByEmail(String email);
}