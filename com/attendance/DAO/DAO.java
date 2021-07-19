package com.servlet.attendance.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.servlet.attendance.mybatis.DBService;
import com.servlet.attendance.vo.AttVO;


public class DAO {

    //게시글의 전체 건수 조회
    public static int getTotalCount() {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        int totalCount = ss.selectOne("attendance.totalCount");
        ss.close();
        return totalCount;
    }

    //게시글 전체 보기 mybatis 버전
    public static List<AttVO> getList(Map<String, Integer> map) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        List<AttVO> list = ss.selectList("attendance.list", map);
        ss.close();
        return list;
    }

    //페이징 포함한 게시글 전체보기
    public static List<AttVO> getList(int begin, int end) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("begin", begin);
        map.put("end", end);
        List<AttVO> list = ss.selectList("attendance.list", map);
        ss.close();
        return list;
    }

    //게시글 1개 조회
    public static AttVO selectOne(String a_idx) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        AttVO vo = ss.selectOne("attendance.one", a_idx);
        ss.close();
        return vo;
    }

    //게시글 수정
    public static int update(int a_idx) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        int vo = ss.update("attendance.update", a_idx);
        ss.close();
        return vo;
    }

    //게시글 삭제
    public static int delete(int a_idx) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        int vo = ss.delete("attendance.delete", a_idx);
        ss.close();
        return vo;
    }

    //제목으로 검색
    public static List<AttVO> getListByTitle(String a_title) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        List<AttVO> list = ss.selectList("attendance.titleSearch", a_title);
        ss.close();
        return list;
    }

    //내용으로 검색
    public static List<AttVO> getListByContent(String a_content) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        List<AttVO> list = ss.selectList("attendance.contentSearch", a_content);
        ss.close();
        return list;
    }

    //작성자으로 검색
    public static List<AttVO> getListByWriter(String a_writer) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        List<AttVO> list = ss.selectList("attendance.writerSearch", a_writer);
        ss.close();
        return list;
    }

    //분류로 검색
    public static List<AttVO> getListByType(String a_type) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        List<AttVO> list = ss.selectList("attendance.typeSearch", a_type);
        ss.close();
        return list;
    }

    //월별로 검색
    public static List<AttVO> getListByMonth(int month) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        List<AttVO> list = ss.selectList("attendance.monthSearch", month);
        ss.close();
        return list;
    }
}
