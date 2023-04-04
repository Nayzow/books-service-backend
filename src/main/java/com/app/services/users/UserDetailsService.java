package com.app.services.users;

import com.app.models.users.User;
import com.app.models.users.UserDetails;
import com.app.repositories.users.UserDetailsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserDetailsService {
    private final UserDetailsRepository userDetailsRepository;

    public List<UserDetails> findAll() {
        return userDetailsRepository.findAll();
    }
    public void createUser(UserDetails user) {
        userDetailsRepository.save(user);
    }

    public void deleteById(Long id) {
        userDetailsRepository.deleteById(id);
    }

    public Optional<UserDetails> findById(Long id) {
        return userDetailsRepository.findById(id);
    }
}
