package gr.grig.exemple.repository;

import gr.grig.exemple.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsername(String username);

    User findByEmail(String email);

    User findByActivationCode(String code);

    User findById(long id);
}
