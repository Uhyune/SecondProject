package com.servlet.hansol.bit.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BITVO {
    private String b_idx, subject, writer, content, file_name, ori_name, pwd, write_date, ip, hit;
}