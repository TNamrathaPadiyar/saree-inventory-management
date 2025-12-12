package servlets;

import db.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffId = request.getParameter("staff_id");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM staff_login WHERE staff_id = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, staffId);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role"); 
                HttpSession session = request.getSession();
                session.setAttribute("staff_id", staffId);
                session.setAttribute("role", role);

                
                if ("Admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("admin.jsp");
                } else if ("Employee".equalsIgnoreCase(role)) {
                    response.sendRedirect("general.jsp");
                } else {
                    response.setContentType("text/html");
                    response.getWriter().println("Unknown role.");
                }
            } else {
                
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid staff ID or password.');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }

            con.close();
        } catch (Exception e) {
            response.setContentType("text/html");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}


