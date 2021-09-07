package gr.grig.exemple.controller;

import gr.grig.exemple.model.Role;
import gr.grig.exemple.model.User;
import gr.grig.exemple.repository.UserRepository;
import gr.grig.exemple.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {

//    @Autowired
//    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @GetMapping("login")
    public String loginGet() {
        return "login";
    }


    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid User user, BindingResult bindingResult, Model model) {

        if (user.getPassword() != null && !user.getPassword().equals(user.getPassword2())) {
            model.addAttribute("passwordError", "Пароли различны");
        }

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            return "registration";
        }

        if (userService.addUser(user)) {
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }
        return "redirect:/login";
    }
//    public String addUser(@RequestParam(value = "username", required = false) String username,
//                          @RequestParam(value = "email", required = false) String email,
//                          @RequestParam(value = "password", required = false) String password,
//                          Model model) {
//
//        User userDb = userRepository.findByUsername(username);
//
//        if (userDb != null) {
//            model.addAttribute("message", "Такой пользователь уже существует!");
//            return "registration";
//        }

//        if (userDb != null) {
//            model.addAttribute("bool", true);
//            model.addAttribute("message", "Пользователь с таким именем существует.");
//            return "registration";
//        }
//        if (email.isEmpty() || email == null) {
//            model.addAttribute("bool", true);
//            model.addAttribute("message", "Не заполнено поле Email");
//            return "registration";
//        }
//        if (password.isEmpty() || password == null) {
//            model.addAttribute("bool", true);
//            model.addAttribute("message", "Не введен пароль");
//            return "registration";
//        }
//        userDb = userRepository.findByEmail(email);
//        if (userDb != null) {
//            model.addAttribute("bool", true);
//            model.addAttribute("message", "Пользователь с таким email существует.");
//            return "registration";
//        }
//        if (password.length() < 6) {
//            model.addAttribute("bool", true);
//            model.addAttribute("message","Пароль должен быть больше 5 знаков");
//            return "registration";
//        }
//
//        model.addAttribute("bool", false);

//        User user = new User(username, password, email, Role.ROLE_USER);
//
//        System.out.println("SAVE: "+user);
//
//        userRepository.save(user);
////        return "redirect:/login";
//        return "hello";
//    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfuly activated (mail)");
        } else {
            model.addAttribute("message", "Activation code is not found (mail)");
        }

        return "login";
    }

}
