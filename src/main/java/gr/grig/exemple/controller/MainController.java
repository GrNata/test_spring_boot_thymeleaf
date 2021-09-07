package gr.grig.exemple.controller;

import gr.grig.exemple.model.Message;
import gr.grig.exemple.model.User;
import gr.grig.exemple.repository.MessageRepository;
import gr.grig.exemple.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
public class MainController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private MessageRepository messageRepository;

//    @Autowired
//    private UserRepository userRepository;

    @GetMapping("/")
    public String mainPage(Model model) {

        System.out.println("GET mainController /");

        return "home";
    }

    @GetMapping("/hello")
    public String hello(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model) {
            Iterable<Message> messages;
            if (filter != null && !filter.isEmpty()) {
                messages = messageRepository.findByTag(filter);
            } else {
                messages = messageRepository.findAll();
            }
            model.addAttribute("messages", messages);
            model.addAttribute("filter", filter);
        return "hello";
    }

    @PostMapping("/hello")
    public String addMessage(
            @AuthenticationPrincipal User user,
//            @RequestParam String text,
//            @RequestParam String tag,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
            ) throws IOException {

//        Message message = new Message(text, tag, user);
            message.setAuthor(user);

            if (bindingResult.hasErrors()) {
//                Collector<FieldError, ?, Map<String, String>> collectorEr = Collectors.toMap(
//                        fieldError -> fieldError.getField() + "Error",
//                        FieldError::getDefaultMessage
//                );
                Map<String, String> errorMap = ControllerUtils.getErrors(bindingResult);

                model.mergeAttributes(errorMap);
                model.addAttribute("message", message);
            } else {

                if (file != null && !file.getOriginalFilename().isEmpty()) {
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    String uuidFile = UUID.randomUUID().toString();
                    String resultFilename = uuidFile + "." + file.getOriginalFilename();
                    file.transferTo(new File("/" + uploadPath + "/" + resultFilename));
                    message.setFilename(resultFilename);
                }
                model.addAttribute("message", null);

                messageRepository.save(message);
            }

        Iterable<Message> messages = messageRepository.findAll();
        model.addAttribute("messages", messages);

        return "hello";
    }


//    @GetMapping("/userlist")
//    public String userList(Model model) {
//        Iterable<User> users = userRepository.findAll();
//        model.addAttribute("users", users);
//        return "userlist";
//    }
}
