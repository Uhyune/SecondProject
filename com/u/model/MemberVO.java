package com.servlet.u.model;

import lombok.*;

@Data
@NoArgsConstructor
@Getter @Setter
public class MemberVO {
    private String id, password, name, email, phone;
}
