package com.app.controllers.dtos.borrowings;

import com.app.controllers.dtos.bookStatement.BookStatementDTO;
import com.app.controllers.dtos.users.UserDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BorrowingDTO {
    private Long id;
    private String duration;
    private UserDTO user;
    private BookStatementDTO bookStatement;
}
