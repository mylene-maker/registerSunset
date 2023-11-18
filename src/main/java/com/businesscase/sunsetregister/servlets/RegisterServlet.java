package com.businesscase.sunsetregister.servlets;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.businesscase.sunsetregister.enums.Country;
import com.businesscase.sunsetregister.models.User;
import com.businesscase.sunsetregister.services.RoleService;
import com.businesscase.sunsetregister.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.validation.*;

@WebServlet(name = "register", value = "")
public class RegisterServlet extends HttpServlet {

    private Validator validator;

    private UserService userService;

    private RoleService roleService;

    public void init() {
        ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
        validator = validatorFactory.getValidator();
        this.userService = new UserService();
        this.roleService = new RoleService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("countries", Country.values());
        request.getRequestDispatcher("register.jsp").forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        User user = new User(lastname, firstname, email, country, password, confirmPassword);

        List<String> errorMessages = new ArrayList<>();

//        Verifie que l'email n'existe pas deja en base de donnée

        if(!this.userService.getUserByEmail(user.getEmail()).isEmpty()){
            errorMessages.add("Cet email existe déjà !");
        }

//        Validation des champs password et confirmPassword

        if(!user.getPassword().equals(user.getConfirmPassword())) {
            errorMessages.add("Les mots de passes saisient ne sont pas identiques !");
        }

//        Validation des erreurs hibernate sur le formulaire
        Set<ConstraintViolation<User>> errors = this.validator.validate(user);

//        Si le formulaire est rempli correctement et que les mdp sont identique
        if (errors.isEmpty() && errorMessages.isEmpty()){
            this.userService.registerUser(user);

            response.sendRedirect("http://localhost:8080/login?registersuccess");

        }else { // sinon afficher les erreurs
            request.setAttribute("errorsHibernate", errors);
            request.setAttribute("errors", errorMessages);
            request.setAttribute("saisie", user); // garder les saisie des users
//          et rediriger vers la page d'inscription
            request.getRequestDispatcher("register.jsp").forward(request, response);

        }

    }

    public void destroy() {
    }
}