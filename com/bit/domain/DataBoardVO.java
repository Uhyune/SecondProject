package com.servlet.bit.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DataBoardVO {

    private Long post_no;
    private String writer_name;
    private Date reg_date;
    private Long hit;
    private String post_title;
    private String post_content;
    private String attached_file;

    public DataBoardVO(String post_title, String post_content, String writer_name, String attached_file) {
        this.post_title = post_title;
        this.post_content = post_content;
        this.writer_name = writer_name;
        this.attached_file = attached_file;
    }
}
