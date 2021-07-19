package com.servlet.bit.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.servlet.bit.controller.pojo.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 50,
                 maxRequestSize = 1024 * 1024 * 50 * 5)
@WebServlet(name = "frontControllerServlet",
            urlPatterns = "/data-board/*")
public class BoardFrontController extends HttpServlet {

    private Map<String, BoardController> controllerMap = new HashMap<>();

    public BoardFrontController() {
        controllerMap.put("/data-board/write", new BoardWriteController());
        controllerMap.put("/data-board/list", new BoardListController());
        controllerMap.put("/data-board/detail", new BoardDetailController());
        controllerMap.put("/data-board/save", new BoardSaveController());
        controllerMap.put("/data-board/update", new BoardUpdateController());
        controllerMap.put("/data-board/delete", new BoardDeleteController());
        controllerMap.put("/data-board/updateSave", new BoardUpdateSaveController());
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String requestURI = request.getRequestURI();
        BoardController controller = controllerMap.get(requestURI);

        if (controller == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        Map<String, String> paramMap = new HashMap<>();
        Map<String, Object> model = new HashMap<>();

        // 파일명 null 체크
        if (controller instanceof BoardSaveController || controller instanceof BoardUpdateSaveController) {
            paramMap = createParamMapWithFile(request);
        } else {
            paramMap = createParamMap(request);
        }

        String viewName = controller.process(paramMap, model);

        if (viewName.startsWith("redirect:")) {
            response.sendRedirect(viewName.substring(viewName.indexOf(":") + 1));
        } else {
            MyView view = viewResolver(viewName);
            view.render(model, request, response);
        }
    }

    private MyView viewResolver(String viewName) {
        return new MyView("/WEB-INF/views/bit/data-board/" + viewName + ".jsp");
    }

    private Map<String, String> createParamMap(HttpServletRequest request) {
        Map<String, String> paramMap = new HashMap<>();

        request.getParameterNames()
               .asIterator()
               .forEachRemaining(paramName -> paramMap.put(paramName, request
                       .getParameter(paramName)));

        return paramMap;
    }

    private Map<String, String> createParamMapWithFile(HttpServletRequest request) {
        Map<String, String> paramMap = new HashMap<>();

        String path = request.getRealPath("upload");
        int size = 1024 * 1024 * 50;

        try {
            MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            multi.getParameterNames()
                 .asIterator()
                 .forEachRemaining(paramName -> paramMap.put((String) paramName, multi
                         .getParameter((String) paramName)));

//            paramMap.put("fileName", new String(multi.getFilesystemName("attached_file").getBytes(StandardCharsets.UTF_8), "EUC-KR"));
//            paramMap.put("originalFileName", new String(multi.getOriginalFileName("attached_file").getBytes(StandardCharsets.UTF_8), "EUC-KR"));

            paramMap.put("fileName", multi.getFilesystemName("attached_file"));
            paramMap.put("originalFileName", multi.getOriginalFileName("attached_file"));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return paramMap;
    }
}
