package com.servlet.project.vo;

public class PjCommentVO {

	private String c_idx, writer, content, pwd, write_date, pj_idx;

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getPj_idx() {
		return pj_idx;
	}

	public void setPj_idx(String pj_idx) {
		this.pj_idx = pj_idx;
	}

	@Override
	public String toString() {
		return "PjCommentVO [c_idx=" + c_idx + ", writer=" + writer + ", content=" + content + ", pwd=" + pwd
				+ ", write_date=" + write_date + ", pj_idx=" + pj_idx + "]";
	} 

}
