package com.servlet.bit.controller.pojo;

import com.servlet.bit.controller.BoardController;
import com.servlet.bit.domain.DataBoardDAO;
import com.servlet.bit.domain.DataBoardVO;

import java.util.Map;

public class BoardDetailController implements BoardController {

    private DataBoardDAO dataBoardDAO = DataBoardDAO.getInstance();

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {

        long post_no = Long.parseLong(paramMap.get("post_no"));
        dataBoardDAO.updateHit(post_no);

        DataBoardVO listByNo = dataBoardDAO.getListByNo(post_no);
        model.put("list", listByNo);

        return "detail";
    }
}
