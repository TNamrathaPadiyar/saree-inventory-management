
package servlets;

import db.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class AdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String table = request.getParameter("table");
        if (table == null || table.isEmpty()) {
            request.getRequestDispatcher("admin.jsp").forward(request, response);
            return;
        }
        List<Map<String, String>> records = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM " + table;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            int columnCount = meta.getColumnCount();

            while (rs.next()) {
                Map<String, String> row = new LinkedHashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.put(meta.getColumnName(i), rs.getString(i));
                }
                records.add(row);
            }

            request.setAttribute("records", records);
            request.setAttribute("tableType", table);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error fetching data for table: " + table);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred during data fetching.");
        }

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String table = request.getParameter("table");
        String id = request.getParameter("id");

        try (Connection con = DBConnection.getConnection()) {
            if ("delete".equals(action)) {
                String keyColumn = "";
                if ("staff_login".equals(table)) {
                    keyColumn = "staff_id";
                } else if ("inventory".equals(table)) {
                    keyColumn = "item_id";
                    id = request.getParameter("item_id");
                }

                if (!keyColumn.isEmpty() && id != null && !id.isEmpty()) {
                    String sql = "DELETE FROM " + table + " WHERE " + keyColumn + " = ?";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, id);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        System.out.println("Record with " + keyColumn + " = " + id + " deleted from " + table);
                    } else {
                        System.out.println("Failed to delete record with " + keyColumn + " = " + id + " from " + table);
                    }
                } else {
                    System.out.println("Error: Could not determine the key column or ID for deletion on table: " + table);
                }
            } else if ("update".equals(action)) {
                Map<String, String[]> paramMap = request.getParameterMap();
                String keyColumn = "";
                String updateId = "";

                if ("staff_login".equals(table)) {
                    keyColumn = "staff_id";
                    updateId = request.getParameter("id");
                } else if ("inventory".equals(table)) {
                    keyColumn = "item_id";
                    updateId = request.getParameter("item_id");
                }

                if (!keyColumn.isEmpty() && updateId != null && !updateId.isEmpty()) {
                    StringBuilder sql = new StringBuilder("UPDATE " + table + " SET ");
                    List<String> columns = new ArrayList<>();
                    List<String> values = new ArrayList<>();

                    for (String column : paramMap.keySet()) {
                        if (!column.equals("action") && !column.equals("id") && !column.equals("table") && !column.equals("item_id")) {
                            String value = request.getParameter(column);
                            if (value != null) {
                                sql.append(column).append(" = ?, ");
                                values.add(value);
                                columns.add(column);
                            }
                        }
                    }

                    if (!columns.isEmpty()) {
                        sql.setLength(sql.length() - 2);
                        sql.append(" WHERE ").append(keyColumn).append(" = ?");
                        PreparedStatement ps = con.prepareStatement(sql.toString());

                        for (int i = 0; i < values.size(); i++) {
                            ps.setString(i + 1, values.get(i));
                        }
                        ps.setString(values.size() + 1, updateId);
                        int rowsAffected = ps.executeUpdate();
                        if (rowsAffected > 0) {
                            System.out.println("Record with " + keyColumn + " = " + updateId + " updated in " + table);
                        } else {
                            System.out.println("Failed to update record with " + keyColumn + " = " + updateId + " in " + table);
                        }
                    } else {
                        System.out.println("No fields to update for record with " + keyColumn + " = " + updateId + " in " + table);
                    }
                } else {
                    System.out.println("Error: Could not determine the key column or ID for update on table: " + table);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error during " + action + " operation: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred during " + action + " operation: " + e.getMessage());
        }

        response.sendRedirect("AdminServlet?table=" + table);
    }
}