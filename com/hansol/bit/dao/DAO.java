package com.servlet.hansol.bit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.servlet.hansol.bit.mybatis.DBService;
import com.servlet.hansol.bit.vo.BITVO;
import org.apache.ibatis.session.SqlSession;


public class DAO {

    //게시글의 전체 건수 조회
    public static int getTotalCount() {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        int totalCount = ss.selectOne("BIT.totalCount");
        ss.close();
        return totalCount;
    }

    //페이지에 해당하는 글목록(게시글)가져오기
    public static List<BITVO> getList(int begin, int end) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("begin", begin);
        map.put("end", end);
        List<BITVO> list = ss.selectList("list", map);
        ss.close();
        return list;
    }

    //게시글 데이터 1개 조회
    public static BITVO selectOne(int b_idx) {
        System.out.println("selectOne() b_idx : " + b_idx);
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        BITVO vo = ss.selectOne("BIT.one", b_idx);
        ss.close();
        return vo;
    }

    //조회수 1증가 처리
    public static int getUpdateHit(int b_idx) {
        SqlSession ss = DBService.getFactory()
                                 .openSession(true);
        int plusReadCount = ss.update("BIT.plusReadCount", b_idx);
        ss.close();
        return plusReadCount;
    }

    //검색
    public static List<BITVO> getListWithKeyword(String field, String query) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Object> fieldAndKeyword = new HashMap<>();
        fieldAndKeyword.put("field", field);
        fieldAndKeyword.put("query", query);

        List<BITVO> list = ss.selectList("BIT.getListWithKeyword", fieldAndKeyword);
        ss.close();
        return list;
    }
}