package serverlet;

import bean.Admin;
import bean.User;
import tool.JdbcConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

/**
 * Created by wzf on 2017/4/18.
 */
@WebServlet(name = "Login")
public class AdminLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        JdbcConn jdbc = new JdbcConn();
        ArrayList<Admin> users = jdbc.adminlist();
        System.out.println(users.size());
        int flag=0;
        PrintWriter out = response.getWriter();
        out.println(request.getParameter("id")+" "+request.getParameter("password"));
        out.println(users.size());
        for(Admin u:users){
            out.println(u.getId()+" "+u.getPassword());
            if(u.getId().equals(request.getParameter("id"))){
                out.println("*");
                if(u.getPassword().equals(request.getParameter("password"))){
                    out.println("**");
                    request.setAttribute("user", u);
                    HttpSession session=request.getSession();//返回与当前request相关联的session，如果没有则在服务器端创建一个;
                    session.setMaxInactiveInterval(18000);
                    session.setAttribute("admin",u);

                    flag=2;
                    break;
                }
                flag=1;
            }

        }
        if(flag==2){
            response.setHeader("content-type","text/html;charset=UTF-8");
            RequestDispatcher view = request.getRequestDispatcher("admin.jsp");
            view.forward(request, response);
        }else if(flag==1){

            response.sendRedirect("adminlogin.jsp?flag=1");
        }else{
            response.sendRedirect("adminlogin.jsp?flag=0");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
