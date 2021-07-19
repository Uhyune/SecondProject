package com.servlet.calendar.model.vo;


import lombok.*;

@Data
public class CalendarVO {
    private String project_id;
    private String title;
    private String detail;
    private String start_date;
    private String end_date;
    private String time;
    private String writer_id;
    private String id;
    private String color;
    private String text_color;
}
