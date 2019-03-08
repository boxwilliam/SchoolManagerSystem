package com.school.servlet;

import com.school.entity.Admin;
import com.school.service.impl.AdminServiceImpl;
import com.school.tools.MD5Code;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class AdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
        switch (status){
            case "login":try {
                login(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
                break;
            case "logout":logout(request,response); break;
            case "register":
                try {
                    register(request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "index" :
                try {
                    index(request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "edit" :
                try {
                    edit(request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "del":del(request,response);break;
        }
    }
    /*
    *
    *
    *
    *
    * */
    private void login(HttpServletRequest request, HttpServletResponse response) throws Exception{

        JSONObject jsonObject=new JSONObject();//创建返回的josn对象
        int loginFlag=0;//登录标志,默认0,登录失败,验证用户名密码成功之后设为1
        String userName=request.getParameter("user");
        String userPassword=new MD5Code().getMD5ofStr(request.getParameter("password"));
        Admin admin=new Admin();
        admin.setName(userName);
        admin.setPassword(userPassword);;
        String cheackCode=request.getParameter("code");
        String code=(String) request.getSession().getAttribute("code");
            if(cheackCode.equals(code)) {
                if (new AdminServiceImpl().login(admin)){
                    loginFlag=1;
                    request.getSession().setAttribute("user",userName);
                    request.getSession().setAttribute("userId", admin.getId());
                    request.getSession().setAttribute("lastdate", admin.getLastDate());
                    jsonObject.put("url","/SchoolManagerSystem/admin/base/index.jsp");
                }else{
                    jsonObject.put("msg", "用户名或者密码错误");
                }
            }else {
                jsonObject.put("msg", "验证码错误");
            }
            jsonObject.put("flag",loginFlag);
            response.getWriter().print(jsonObject.toString());
    }


    public void logout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String msg = "已经成功退出系统，请重新登录！";
        String url = "login.jsp";

        request.getSession().invalidate();//表示session失效

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);

        request.getRequestDispatcher("/forward.jsp").forward(request,response);

    }

    public void register(HttpServletRequest request,HttpServletResponse response) throws Exception {
        JSONObject jsonObject=new JSONObject();//创建返回的josn对象
        int registerFlag=0;//登录标志,默认0,登录失败,验证用户名密码成功之后设为1
        String userName=request.getParameter("user");
        String userPassword=new MD5Code().getMD5ofStr(request.getParameter("password"));
        String userPhone=request.getParameter("phone");
        String userType=request.getParameter("type");
        String userStatus=request.getParameter("status");
        System.out.print(userType);
        Admin admin=new Admin();
        admin.setName(userName);
        admin.setPassword(userPassword);;
        admin.setPhone(userPhone);
        admin.setType(Short.parseShort(userType));
        admin.setStatus(Short.parseShort(userStatus));
        String cheackCode=request.getParameter("code");
        String code=(String) request.getSession().getAttribute("code");
            if(cheackCode.equals(code)) {
                if (new AdminServiceImpl().insert(admin)){
                    registerFlag=1;
                    request.getSession().setAttribute("user",userName);
                    jsonObject.put("url","/SchoolManagerSystem/login.jsp");
                }else{
                    jsonObject.put("msg", "注册失败,未按要求填写");
                }
            }else {
                jsonObject.put("msg", "验证码错误");
            }
            jsonObject.put("flag",registerFlag);
            response.getWriter().print(jsonObject.toString());
    }

    private void index(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Integer currentPage = Integer.parseInt(request.getParameter("cp") == null ? "1" : request.getParameter("cp"));
        Integer lineSize = Integer.parseInt(request.getParameter("ls") == null ? "5" : request.getParameter("ls"));
        String keyWord = request.getParameter("key")==null?"":request.getParameter("key");
        String column = request.getParameter("col")==null?"name":request.getParameter("col");
        Map<String,Object> map = new AdminServiceImpl().listBySplit(column, keyWord, currentPage, lineSize);
        request.setAttribute("admins", map.get("admins"));
        request.setAttribute("allRecorders", map.get("recordSize"));
        request.setAttribute("url", "admin/AdminServlet/index");
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("lineSize", lineSize);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("keyWord", keyWord);
        request.getRequestDispatcher("/admin/adminUser/index.jsp").forward(request,response);
    }

    public void edit(HttpServletRequest request,HttpServletResponse response) throws Exception{
        JSONObject jsonObject=new JSONObject();
        int status=0;
        Admin admin=new Admin();
        Integer id=Integer.parseInt(request.getParameter("id"));
        admin.setId(id);
        admin.setName(request.getParameter("user"));
        admin.setPassword(new MD5Code().getMD5ofStr(request.getParameter("password")));
        admin.setPhone(request.getParameter("phone"));
        admin.setType(Short.parseShort(request.getParameter("type")));
        admin.setStatus(Short.parseShort(request.getParameter("status")));
        if(new AdminServiceImpl().edit(admin)){
            jsonObject.put("url","/SchoolManagerSystem/admin/AdminServlet/index");
            jsonObject.put("msg","编辑成功");
            status=1;
        }else {
            jsonObject.put("msg","编辑失败");
        }
        jsonObject.put("status",status);
        System.out.println(status);
        response.getWriter().print(jsonObject.toString());
    }

    public void del(HttpServletRequest request,HttpServletResponse response){
        int status=0;
        Integer id=Integer.parseInt(request.getParameter("id"));
        JSONObject jsonObject=new JSONObject();
        try {
            if(new AdminServiceImpl().delById(id)){
                jsonObject.put("url","/SchoolManagerSystem/admin/news/index.jsp");
                jsonObject.put("msg","删除成功");
                status=1;
            }else {
                jsonObject.put("msg","删除失败");
            }
            jsonObject.put("status",status);
            System.out.println(status);
            response.getWriter().print(jsonObject.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
