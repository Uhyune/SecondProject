package com.servlet.project.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.project.mybatis.DBService;
import com.servlet.project.vo.PjCommentVO;
import com.servlet.project.vo.PjNoticeVO;
import org.apache.ibatis.session.SqlSession;


public class DAO {

    //게시글 전체 건수
    public static int getTotalCount() {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        int totalCount = ss.selectOne("totalCount");
        ss.close();
        return totalCount;
    }

    //페이지에 해당하는 글목록 가져오기
    public static List<PjNoticeVO> getList(int begin, int end) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("begin", begin);
        map.put("end", end);
        List<PjNoticeVO> list = ss.selectList("list", map);
        ss.close();
        return list;
    }

    //댓글 불러오기
    public static List<PjCommentVO> getCommList(int pj_idx) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        List<PjCommentVO> list = ss.selectList("pjnotice.commList", pj_idx);
        ss.close();
        return list;
    }

    public static List<PjNoticeVO> getListWithKeyword(String field, String query) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        Map<String, Object> fieldAndKeyword = new HashMap<>();
        fieldAndKeyword.put("field", field);
        fieldAndKeyword.put("query", query);

        List<PjNoticeVO> list = ss.selectList("pjnotice.getListWithKeyword", fieldAndKeyword);
        ss.close();
        return list;
    }

    //댓글 개수
    public static int update_com_count(int pj_idx) {
        SqlSession ss = DBService.getFactory()
                                 .openSession(true);
        int comcount = ss.update("pjnotice.update_com_count", pj_idx);
        ss.close();
        return comcount;
    }

    //조회수+1
    public static int getUpdateHit(int pj_idx) {
        SqlSession ss = DBService.getFactory()
                                 .openSession(true);
        int hitup = ss.update("pjnotice.hitup", pj_idx);
        ss.close();
        return hitup;
    }

    //작성자 아이디로 검색
    public static List<PjNoticeVO> getwriterList(String writer, String field, String query) {
        SqlSession ss = DBService.getFactory()
                                 .openSession();
        List<PjNoticeVO> list = ss.selectList("pjnotice.writerList", writer);
        ss.close();
        return list;
    }

}
