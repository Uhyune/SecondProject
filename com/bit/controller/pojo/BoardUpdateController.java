package com.servlet.bit.controller.pojo;

import com.servlet.bit.controller.BoardController;
import com.servlet.bit.domain.DataBoardDAO;
import com.servlet.bit.domain.DataBoardVO;

import javax.servlet.annotation.MultipartConfig;
import java.util.Map;

@MultipartConfig(
        fileSizeThreshold = 1024*1024,
        maxFileSize = 1024*1024*50,
        maxRequestSize = 1024*1024*50*5
)
public class BoardUpdateController implements BoardController {

    private DataBoardDAO dataBoardDAO = DataBoardDAO.getInstance();

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {

        long post_no = Long.parseLong(paramMap.get("post_no"));
        DataBoardVO listByNo = dataBoardDAO.getListByNo(post_no);

        if(paramMap.get("p") != null) {
            model.put("p", paramMap.get("p"));
            model.put("f", paramMap.get("f"));
            model.put("k", paramMap.get("k"));
        }

        model.put("list", listByNo);
        return "update";
    }
}
