package com.servlet.project.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter @Setter @ToString
public class PjNoticeVO {
	private String pj_idx, writer, pwd, hit, title, content, file_name, com_count;
	private Date regdate, editdate;
}
