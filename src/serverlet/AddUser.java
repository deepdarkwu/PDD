package serverlet;

import tool.JdbcConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by wzf on 2017/5/9.
 */
@WebServlet(name = "Servlet4")
public class AddUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        System.out.println(request.getParameter("name"));
        JdbcConn jdbc = new JdbcConn();
        jdbc.add(request.getParameter("id"),request.getParameter("name"),request.getParameter("id"),request.getParameter("phone"),request.getParameter("qq"),request.getParameter("mail"),Integer.parseInt(request.getParameter("level")));
        response.sendRedirect("adminsucceed.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
