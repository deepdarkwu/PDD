package serverlet;

import tool.JdbcConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by wzf on 2017/5/18.
 */
@WebServlet(name = "Servlet6")
public class DeleteMess extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        JdbcConn jdbc = new JdbcConn();
        jdbc.deletemess(request.getParameter("id"));
        response.sendRedirect("adminsucceed.html");

    }
}
