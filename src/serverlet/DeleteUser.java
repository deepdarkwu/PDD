package serverlet;

import tool.JdbcConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by wzf on 2017/5/9.
 */
@WebServlet(name = "Servlet5")
public class DeleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        JdbcConn jdbc = new JdbcConn();
        jdbc.delete(request.getParameter("id"));
        jdbc.deletegh(request.getParameter("id"),"grade");
        jdbc.deletegh(request.getParameter("id"),"uphomework");
        response.sendRedirect("adminsucceed.html");
    }
}
