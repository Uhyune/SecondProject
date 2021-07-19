<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.servlet.project.mybatis.DBService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="PjNoticeVO" class="com.servlet.project.vo.PjNoticeVO"/>
<jsp:setProperty property="*" name="PjNoticeVO"/>
<%
    System.out.println("> PjNoticeVO: " + PjNoticeVO);

    SqlSession ss = DBService.getFactory().openSession(true);
%>
<%--빈칸 있는 경우 --%>
<c:if test="${PjNoticeVO.title == null || PjNoticeVO.content == null 
					|| PjNoticeVO.title.equals(' ') || PjNoticeVO.content.equals(' ')}">
    <script>
        alert("입력이 안 된 항목이 있습니다.");
        history.back();
    </script>
</c:if>


<%
    try {
        ss.insert("pjnotice.insert", PjNoticeVO);
%>

<%
} catch (Exception e) {
    e.printStackTrace();
%>

<%
    } finally {
        ss.close();
    }
%>

<%--빈칸 없는 경우 --%>
<c:if test="${PjNoticeVO.title != null && PjNoticeVO.content != null}">
    <script>
        alert("정상적으로 입력되었습니다.");
        location.href = "../pjnotice";
    </script>
</c:if>

<script>
    alert("[예외 발생]\n이전페이지로 이동합니다.");
    location.href = "../pjnotice";
    <%--예외발생하면 목록페이지로 이동--%>
</script>