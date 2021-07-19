package com.servlet.bit.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class DataBoardVOView extends DataBoardVO{

    private int reply_cnt;

    public DataBoardVOView(String post_title, String post_content, String writer_name, String attached_file) {
        super(post_title, post_content, writer_name, attached_file);
    }

    public DataBoardVOView(String post_title, String post_content, String writer_name, String attached_file, int reply_cnt) {
        super(post_title, post_content, writer_name, attached_file);
        this.reply_cnt = reply_cnt;
    }
}
