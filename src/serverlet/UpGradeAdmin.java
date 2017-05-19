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
 * Created by wzf on 2017/5/19.
 */
@WebServlet(name = "Servlet7")
public class UpGradeAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("utf-8");
            String subject = request.getParameter("subject");
            JdbcConn jdbc = new JdbcConn();
            try {
                jdbc.upgrade(subject);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect("adminsucceed.html");
        }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
