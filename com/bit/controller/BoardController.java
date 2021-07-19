package com.servlet.bit.controller;

import java.util.Map;

public interface BoardController {

    /**
     *
     * @param paramMap
     * @param model
     * @return viewName
     */
    String process(Map<String, String> paramMap, Map<String, Object> model);
}
