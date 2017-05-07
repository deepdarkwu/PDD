package serverlet;

import tool.JdbcConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by wzf on 2017/5/7.
 */
@WebServlet(name = "Servlet3")
public class UpHomework extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String subject = request.getParameter("subject");
        String date = request.getParameter("date");
        JdbcConn jdbc = new JdbcConn();
        try {
            jdbc.addhomework(subject,date);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("adminsucceed.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
