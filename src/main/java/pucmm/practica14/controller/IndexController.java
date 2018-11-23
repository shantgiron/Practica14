package pucmm.practica14.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pucmm.practica14.model.*;
import pucmm.practica14.service.*;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.*;

@Controller
public class IndexController {

    @Autowired
    private UsuarioServiceImpl usuarioService;
    @Autowired
    private RolServiceImpl rolService;

    @Autowired
    private MessageSource messageSource;



    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginPOST(
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "password", required = false) String password
    ) {

        System.out.println("HOLA");
        if(usuarioService.findByUsername(username) != null) {
            usuarioService.autoLogin(username, password);
        }
        else{
            usuarioService.autoLogin(usuarioService.findByEmail(username).getUsername(),password);
        }

        return "redirect:/";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(
            @RequestParam(value = "username2", required = false) String username,
            @RequestParam(value = "password2", required = false) String password,
            @RequestParam(value = "name2", required = false) String name,
            @RequestParam(value = "email2", required = false) String email
    ) {
        Usuario u = new Usuario();
        u.setEmail(email);
        u.setNombre(name);
        u.setPassword(password);
        u.setActive(1);
        u.setUsername(username);
        u.setRol(rolService.findByNombreRol("ESTUDIANTE"));
        usuarioService.crearUsuario(u);
        return "redirect:/";
    }

}
