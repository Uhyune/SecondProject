package com.servlet.calendar.model;

import java.util.HashMap;
import java.util.List;

import com.servlet.calendar.model.vo.CalendarVO;
import com.servlet.calendar.mybatis.DBService;
import org.apache.ibatis.session.SqlSession;


public class DAO {

    //일정 조회
    public static List<CalendarVO> getEvent() {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        List<CalendarVO> list = ss.selectList("bitcamp.allEvent");
        ss.close();

        return list;

    }

    public static CalendarVO getOneEvent(String id) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        CalendarVO vo = ss.selectOne("bitcamp.oneEvent", id);

        ss.close();
        return vo;

    }

    //일정 수정
    public static void updateEvent(String title, String start_date, String end_date, String detail, String color, String text_color, String id) {
        SqlSession ss = DBService.getFactory()
                                 .openSession(true);
        System.out.println("IN DAO");
        HashMap<String, String> hsMap = new HashMap<String, String>();
        hsMap.put("start_date", start_date);
        hsMap.put("end_date", end_date);
        hsMap.put("title", title);
        hsMap.put("id", id);
        hsMap.put("detail", detail);
        hsMap.put("color", color);
        hsMap.put("text_color", text_color);
        ss.update("bitcamp.updateEvent", hsMap);

        ss.close();
    }

    //일정 추가
    public static void addEvent(String title, String start_date, String end_date, String detail, String color, String text_color) {
        SqlSession ss = DBService.getFactory()
                                 .openSession(true);
        HashMap<String, String> hsMap = new HashMap<String, String>();
        hsMap.put("title", title);
        hsMap.put("start_date", start_date);
        hsMap.put("end_date", end_date);
        hsMap.put("detail", detail);
        hsMap.put("color", color);
        hsMap.put("text_color", text_color);

        ss.insert("bitcamp.addEvent", hsMap);
        ss.close();
    }

    public static void deleteEvent(String id) {
        SqlSession ss = DBService.getFactory()
                                 .openSession(true);
        ss.selectList("bitcamp.deleteEvent", id);
        ss.close();
    }

}
