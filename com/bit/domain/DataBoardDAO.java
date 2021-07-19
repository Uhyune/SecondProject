package com.servlet.bit.domain;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public class DataBoardDAO {

    private static DataBoardDAO dataBoardDAO = new DataBoardDAO();
    private static SqlSessionFactory factory;

    public static DataBoardDAO getInstance() {
        return dataBoardDAO;
    }

    private DataBoardDAO() {}

    // SqlSessionFactory static 초기화
    // mybatis/config.xml 위치는 resources 하위에 있음
    static {
        String resource = "mybatis/config.xml";
        try {
            factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader(resource));
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("SqlSessionFactory Exception");
        }
    }

    public List<DataBoardVOView> getList() {
        List<DataBoardVOView> list = getList("post_title", "", 1);
        return list;
    }

    public List<DataBoardVOView> getList(int page) {
        List<DataBoardVOView> list = getList("post_title", "", page);
        return list;
    }

    public List<DataBoardVOView> getList(String field, String keyword, int page) {
        SqlSession session = factory.openSession();

        HashMap<String, Object> filedAndKeyword = new HashMap<>();
        filedAndKeyword.put("field", field);
        filedAndKeyword.put("keyword", keyword);
        filedAndKeyword.put("page", page);

        List<DataBoardVOView> list = session.selectList("getListWithPage", filedAndKeyword);
        session.close();
        return list;
    }

    public DataBoardVO getListByNo(Long post_no) {
        SqlSession session = factory.openSession();
        DataBoardVO list = session.selectOne("read", post_no);
        session.close();
        return list;
    }

    public DataBoardVO writePost(DataBoardVO dataBoardVO) {
        SqlSession session = factory.openSession();

        DataBoardVO insert = null;
        if(dataBoardVO.getAttached_file() != null) {
            insert = session.selectOne("insert", dataBoardVO);
        } else {
            insert = session.selectOne("insertWithOutFile", dataBoardVO);
        }

        session.commit();
        session.close();
        return insert;
    }

    public boolean updatePost(DataBoardVO dataBoardVO) {
        SqlSession session = factory.openSession();

        int isUpdate = 0;
        if(dataBoardVO.getAttached_file() != null) {
            isUpdate = session.update("update", dataBoardVO);
        } else {
            isUpdate = session.update("updateWithOutFile", dataBoardVO);
        }

        session.commit();
        session.close();
        return isUpdate != 0;
    }

    public boolean deletePost(Long post_no) {
        SqlSession session = factory.openSession();
        int isDelete = session.delete("delete", post_no);
        session.commit();
        session.close();

        // 삭제 됐으면 true, 아니면 false
        return isDelete != 0;
    }

    public boolean updateHit(Long post_no) {
        SqlSession session = factory.openSession();
        int isUpdate = session.update("update_hit", post_no);
        session.commit();
        session.close();

        return isUpdate != 0;
    }

    public int getTotalCount() {
        SqlSession session = factory.openSession();
        int totalCount = session.selectOne("getTotalCount");
        session.close();

        return totalCount;
    }

    public int getConditionalCount(String field, String keyword) {
        SqlSession session = factory.openSession();

        HashMap<String, Object> filedAndKeyword = new HashMap<>();
        filedAndKeyword.put("field", field);
        filedAndKeyword.put("keyword", keyword);

        int conditionalCount = session.selectOne("getConditionalCount", filedAndKeyword);
        session.close();

        return conditionalCount;
    }
}
