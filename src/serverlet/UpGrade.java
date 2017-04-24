package serverlet;

import bean.User;
import tool.JdbcConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by wzf on 2017/4/22.
 */
@WebServlet(name = "Servlet")
public class UpGrade extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.print(request.getParameter("subject")+" "+request.getParameter("score"));
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("user");
        JdbcConn jdbc = new JdbcConn();
        try {
            jdbc.addpgrade(u,request.getParameter("subject"),Integer.parseInt(request.getParameter("score")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("succeed.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
