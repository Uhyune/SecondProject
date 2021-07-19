package com.servlet.u.model.command;

import com.servlet.u.model.MemberDAO;
import com.servlet.u.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateCommand implements Command {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("login");
        System.out.println("id = " + id);

        MemberDAO memberDAO = new MemberDAO();
        MemberVO list = memberDAO.getInfo(id);
        list.setId(id);
        list.setPassword(request.getParameter("password"));
        System.out.println(request.getParameter("password"));
        list.setName(request.getParameter("name"));
        list.setPhone(request.getParameter("phone"));
        list.setEmail(request.getParameter("email"));

        memberDAO.updateMember(list);
        System.out.println("list = " + list);

        session.setAttribute("loginList", list);
        request.setAttribute("loginList", list);
//        return "http://localhost:8080/u/mypage.jsp";
        return "mypage.jsp";
    }
}
