package com.servlet.bit.controller.pojo;

import com.servlet.bit.controller.BoardController;
import com.servlet.bit.domain.DataBoardDAO;
import com.servlet.bit.domain.DataBoardVO;
import com.servlet.bit.domain.DataBoardVOView;

import javax.servlet.annotation.MultipartConfig;
import java.util.List;
import java.util.Map;

@MultipartConfig(
        fileSizeThreshold = 1024*1024,
        maxFileSize = 1024*1024*50,
        maxRequestSize = 1024*1024*50*5
)
public class BoardSaveController implements BoardController {

    private DataBoardDAO dataBoardDAO = DataBoardDAO.getInstance();

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {

        String post_title = paramMap.get("post_title");
        String post_content = paramMap.get("post_content");
        String writer_name = paramMap.get("writer_name");
        String attached_file = null;

        if(paramMap.get("originalFileName") != null)
            attached_file = paramMap.get("originalFileName");

        DataBoardVO dataBoardVO = new DataBoardVO(post_title, post_content, writer_name, attached_file);
        dataBoardDAO.writePost(dataBoardVO);

        List<DataBoardVOView> list = dataBoardDAO.getList();
        model.put("list", list);

        return "redirect:http://localhost:8080/data-board/list";
    }
}
