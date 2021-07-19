package com.servlet.bit.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class MyView {

    private String viewPath;

    public MyView(String viewPath) {
        this.viewPath = viewPath;
    }

    public void render(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
        dispatcher.forward(request, response);
    }

    public void render(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        modelToRequestAttribute(model, request);
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
        dispatcher.forward(request, response);
    }

    private void modelToRequestAttribute(Map<String, Object> model, HttpServletRequest request) {
        model.forEach((key, value) -> request.setAttribute(key, value));
    }
}


/*
FrontController
들어오는 모든 url 을 받고, 세부 url 로 보내는 역할 담당
기능 추가는 controllerMap 에 새로운 기능을 가진 일반 (pojo) 클래스들을 넣으면 된다

controller 가 선택되지 않는 경우엔 404 오류를 띄우게 설정해 두고 그냥 return 시킴
createParamMap() 메서드를 통해 request 로 들어오는 parameter 들을 Map 형태로 만들어
controller 로 넘기고 얘는 받아서 수행,

controller 의 로직 결과로 반환되는 문자열은 viewResolver 에 의해 jsp 위치 경로를 가르키게 되고
MyView 인스턴스를 만들어 render 메서드를 이용해 로직 과정 중 발생한 model 을 Map 형태로 넘겨
화면을 그릴때 사용할 수 있게 한다
 */