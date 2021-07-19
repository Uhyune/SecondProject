package com.servlet.bit.controller.pojo;

import com.servlet.bit.controller.BoardController;
import com.servlet.bit.domain.DataBoardDAO;
import com.servlet.bit.domain.DataBoardVOView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardListController implements BoardController {

    private DataBoardDAO dataBoardDAO = DataBoardDAO.getInstance();

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {

        String field_ = paramMap.get("f");
        String keyword_ = paramMap.get("k");
        String page_ = paramMap.get("p");

        String field = "post_title";
        String keyword = "";
        int page = 1;
        int count = 1;

        List<DataBoardVOView> list = new ArrayList<>();

        if (field_ != null && !field_.equals(""))
            field = field_;

        if (page_ != null && !page_.equals(""))
            page = Integer.parseInt(page_);

        if (keyword_ != null && !keyword_.equals("")) {
            keyword = keyword_;
            list = dataBoardDAO.getList(field, keyword, page);
            count = dataBoardDAO.getConditionalCount(field, keyword);
        } else {
            list = dataBoardDAO.getList(page);
            count = dataBoardDAO.getTotalCount();
        }

        model.put("list", list);
        model.put("count", count);

        return "list";
    }
}
