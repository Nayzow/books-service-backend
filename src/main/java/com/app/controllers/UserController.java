package com.app.controllers;

import com.app.controllers.dtos.borrowings.BorrowingDTO;
import com.app.controllers.dtos.users.UserDTO;
import com.app.controllers.dtos.users.UserDetailsDTO;
import com.app.models.User;
import com.app.services.BorrowingService;
import com.app.services.UserService;
import com.app.utils.mappings.borrowings.BorrowingMapping;
import com.app.utils.mappings.users.UserDetailsMapping;
import com.app.utils.mappings.users.UserMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final BorrowingService borrowingService;

    @GetMapping
    public List<UserDTO> findAll() {
        return userService.findAll()
                .stream()
                .map(UserMapping::mapToDTO)
                .toList();
    }

    @GetMapping("/{id}")
    public UserDetailsDTO findById(@PathVariable Long id) {
        return userService.findById(id)
                .map(UserDetailsMapping::mapToDTO)
                .orElse(null);
    }

    @PostMapping
    public void createUser(@RequestBody User user) {
        if (!userService.existsByEmail(user.getEmail()) && !userService.existsByUsername(user.getUsername())) {
            userService.createUser(user);
        }
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        userService.deleteById(id);
    }

    @GetMapping("/{id}/borrowings")
    public List<BorrowingDTO> findAllBorrowingsByUserId(@PathVariable Long id) {
        return borrowingService.findAllByUserId(id)
                .stream()
                .map(BorrowingMapping::mapToDTO)
                .toList();
    }
}
