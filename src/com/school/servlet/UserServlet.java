package com.school.servlet;

import com.school.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class UserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String action=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
        switch (action){
            case "index":
                index(request,response);
            break;
        }
    }

    private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Integer currentPage = Integer.parseInt(request.getParameter("cp") == null ? "1" : request.getParameter("cp"));
        Integer lineSize = Integer.parseInt(request.getParameter("ls") == null ? "5" : request.getParameter("ls"));
        String keyWord = request.getParameter("key")==null?"":request.getParameter("key");
        String column = request.getParameter("col")==null?"name":request.getParameter("col");
        Map<String,Object> map = null;
        try {
            map = new UserServiceImpl().listBySplit(column, keyWord, currentPage, lineSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("readers", map.get("readers"));
        request.setAttribute("allRecorders", map.get("recordSize"));
        request.setAttribute("url", "admin/UserServlet/index");
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("lineSize", lineSize);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("keyWord", keyWord);
        request.getRequestDispatcher("/admin/user/index.jsp").forward(request,response);
    }

}
