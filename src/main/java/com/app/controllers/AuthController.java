package com.app.controllers;

import com.app.controllers.dtos.users.UserDetailsDTO;
import com.app.services.UserService;
import com.app.utils.mappings.users.UserDetailsMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;

    @GetMapping("/login")
    public UserDetailsDTO login(@RequestParam String username, @RequestParam String password) {
        if (userService.existsByUsername(username)) {
            return userService.findByUsernameAndPassword(username, password)
                    .map(UserDetailsMapping::mapToDTO)
                    .orElse(null);
        }
        return null;
    }
}
