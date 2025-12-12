package servlets;

import db.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class GeneralServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String sareeType = request.getParameter("saree_type");
        String price = request.getParameter("price");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierName = request.getParameter("supplier_name");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO inventory (saree_type, price, quantity, supplier_name) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sareeType);
            ps.setString(2, price);
            ps.setInt(3, quantity);
            ps.setString(4, supplierName);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.getWriter().println("<script>alert('Saree inserted successfully!');window.location='general.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Failed to insert saree.');window.location='general.jsp';</script>");
            }

            con.close();
        } catch (Exception e) {
            response.setContentType("text/html");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
