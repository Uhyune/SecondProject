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
public class BoardUpdateSaveController implements BoardController {

    private DataBoardDAO dataBoardDAO = DataBoardDAO.getInstance();

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {

        long post_no = Long.parseLong(paramMap.get("post_no"));
        String post_title = paramMap.get("post_title");
        String post_content = paramMap.get("post_content");

        String attached_file = null;
        if(paramMap.get("originalFileName") != null)
            attached_file = paramMap.get("originalFileName");

        DataBoardVO list = dataBoardDAO.getListByNo(post_no);

        list.setPost_title(post_title);
        list.setPost_content(post_content);
        list.setAttached_file(attached_file);

        dataBoardDAO.updatePost(list);
        model.put("list", list);

        return "redirect:http://localhost:8080/data-board/detail?post_no=" + post_no;
    }
}
