package pucmm.practica14.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pucmm.practica14.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Usuario findByUsername(String username);
    Usuario findByEmail(String email);

}
