package servlets;

import db.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffId = request.getParameter("staff_id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String location = request.getParameter("location");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO staff_login (staff_id, name, age, location, password, role) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, staffId);
            ps.setString(2, name);
            ps.setInt(3, Integer.parseInt(age));
            ps.setString(4, location);
            ps.setString(5, password);
            ps.setString(6, role);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("Registration failed.");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
