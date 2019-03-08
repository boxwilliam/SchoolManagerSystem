package com.school.filter; /*
 ClassName:com.book.filter
 Description:
 User: myischenxiaohua@163.com
 Date: 2019-01-03
 Time: 21:30
 */

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void destroy() {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hRequest = (HttpServletRequest)request;
        HttpSession session = hRequest.getSession();
        String uid = (String)session.getAttribute("user");
        HttpServletRequest req = (HttpServletRequest)request;
        String status = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/")+1);
        if("login".equals(status) || uid != null){//用户登录操作、用户已经登录可以通过
            chain.doFilter(request, response);
        } else {
            request.setAttribute("msg", "还未登陆，请先登录后操作。");
            request.setAttribute("url", "login.jsp");
            request.getRequestDispatcher("/forward.jsp").forward(request, response);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {}
}
