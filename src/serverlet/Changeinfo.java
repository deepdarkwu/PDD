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
import java.sql.SQLException;

/**
 * Created by wzf on 2017/4/26.
 */
@WebServlet(name = "Servlet2")
public class Changeinfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("user");
        JdbcConn jdbc = new JdbcConn();
        try {
            jdbc.changeinfo(u.getId(),request.getParameter("password"),request.getParameter("phone"),request.getParameter("qq"),request.getParameter("mail"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        session.removeAttribute("user");
        u.setPassword(request.getParameter("password"));
        u.setPhone(request.getParameter("phone"));
        u.setQq(request.getParameter("qq"));
        u.setMail(request.getParameter("mail"));
        session.setAttribute("user",u);
        response.sendRedirect("succeed.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
