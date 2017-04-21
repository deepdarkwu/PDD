package serverlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by wzf on 2017/4/20.
 */
@WebServlet(name = "Logout")
public class Logout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        pw.print("get");
        Cookie[] cookies=request.getCookies();

        for(Cookie cookie: cookies){

            cookie.setMaxAge(0);

            cookie.setPath("/");

            response.addCookie(cookie);

        }
        HttpSession session=request.getSession();//返回与当前request相关联的session，如果没有则在服务器端创建一个;
        session.removeAttribute("user");
        response.sendRedirect("login.jsp");
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        pw.print("post");
        Cookie[] cookies=request.getCookies();

        for(Cookie cookie: cookies){

            cookie.setMaxAge(0);

            cookie.setPath("/");

            response.addCookie(cookie);

        }
        HttpSession session=request.getSession();//返回与当前request相关联的session，如果没有则在服务器端创建一个;
        session.removeAttribute("user");
        response.sendRedirect("login.jsp");
        return;
    }
}
