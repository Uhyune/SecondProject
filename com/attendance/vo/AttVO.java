package com.servlet.attendance.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttVO {
    private String a_idx, available, status, a_title, a_content, a_type, a_writer, user_id, write_date, mod_date, ori_name, file_name;
}
