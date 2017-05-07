package serverlet;

import tool.JdbcConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by wzf on 2017/5/7.
 */
@WebServlet(name = "Sendmes")
public class Sendmes extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        String mes = request.getParameter("mes");
        String url = request.getParameter("url");
        String level = request.getParameter("level");
        JdbcConn jdbc = new JdbcConn();
        jdbc.addmes(title,mes,url,Integer.parseInt(level));
        response.sendRedirect("succeed.html");
        //System.out.println(title+mes+url+level);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
