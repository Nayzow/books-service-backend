package com.app.services;

import com.app.models.Borrowing;
import com.app.repositories.BorrowingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BorrowingService {
    private final BorrowingRepository borrowingRepository;

    public List<Borrowing> findAll() {
        return borrowingRepository.findAll();
    }

    public Optional<Borrowing> findById(Long id) {
        return borrowingRepository.findById(id);
    }

    public void createBorrowing(Borrowing borrowing) {
        borrowingRepository.save(borrowing);
    }

    public void deleteById(Long id) {
        borrowingRepository.deleteById(id);
    }

    public List<Borrowing> findAllByUserId(Long id) {
        return borrowingRepository.findAllByUserId(id);
    }
}
