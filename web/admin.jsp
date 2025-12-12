
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Admin Dashboard - Devba Sarees</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('sareehome.jpg') no-repeat center center/cover;
        }
        .overlay {
            background-color: rgba(255, 255, 255, 0.95);
            position: absolute;
            inset: 0;
            z-index: 0;
        }
        .header-icons {
            position: absolute;
            top: 20px;
            right: 30px;
            z-index: 3;
        }

        .header-icons a {
            margin-left: 20px;
            font-size: 26px;
            color: purple;
            transition: color 0.3s ease;
        }

        .header-icons a:hover {
            color: #00f2fe;
        }
        .container {
            position: relative;
            z-index: 2;
            padding: 80px 30px 120px 30px;
            text-align: center;
        }
        .table-buttons {
            margin: 30px;
        }
        .table-buttons button {
            padding: 12px 24px;
            margin: 10px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            background: linear-gradient(90deg, #4facfe, #00f2fe);
            color: white;
            cursor: pointer;
        }
        table {
            width: 90%;
            margin: 0 auto 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        .footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 16px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .action-btn {
            padding: 6px 12px;
            margin: 2px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }
        .delete-btn {
            background-color: #e74c3c;
        }
        .update-btn {
            background-color: #f39c12;
        }
        .insert-btn {
            background-color: #27ae60;
            color: white;
            padding: 8px 16px;
            margin-top: 10px;
            font-weight: bold;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
        .no-records {
            font-style: italic;
            color: #777;
            margin-top: 10px;
        }
    </style>

    <script>
        function showTable(type) {
            document.location.href = 'AdminServlet?table=' + type;
        }

        function enableEdit(button) {
            const row = button.closest("tr");
            const inputs = row.querySelectorAll("input[type='text']");
            inputs.forEach(input => {
                input.removeAttribute("readonly");
                input.style.backgroundColor = "#fffde7";
                input.style.border = "1px solid #ccc";
            });

            button.style.display = "none";
            row.querySelector("button[value='update']").style.display = "inline-block";
        }
    </script>
</head>
<body>
<div class="overlay"></div>
<div class="header-icons">
    <a href="index.jsp" title="Home"><i class="fas fa-home"></i></a>
    <a href="login.jsp" title="Logout"><i class="fas fa-sign-out-alt"></i></a>
</div>




<div class="container">
    <h1>Admin Dashboard</h1>
    <div class="table-buttons">
        <button onclick="showTable('staff_login')">View Staff Table</button>
        <button onclick="showTable('inventory')">View Saree Inventory</button>
    </div>

    <%
        String tableType = (String) request.getAttribute("tableType");
        List<Map<String, String>> records = (List<Map<String, String>>) request.getAttribute("records");
        String errorMessage = (String) request.getAttribute("errorMessage");

        if (errorMessage != null && !errorMessage.isEmpty()) {
            out.println("<div class='error-message'>" + errorMessage + "</div>");
        }

        if (records != null && !records.isEmpty()) {
            out.println("<table>");
            out.println("<tr>");
            for (String key : records.get(0).keySet()) {
                out.println("<th>" + key + "</th>");
            }
            out.println("<th>Actions</th>");
            out.println("</tr>");

            for (Map<String, String> row : records) {
                String id = "";
                if ("staff_login".equals(tableType)) {
                    id = row.get("staff_id");
                } else if ("inventory".equals(tableType)) {
                    id = row.get("item_id");
                }

                out.println("<tr onmouseover=\"this.style.background='#e0f7fa'\" onmouseout=\"this.style.background='white'\">");
                out.println("<form method='post' action='AdminServlet'>");

                for (Map.Entry<String, String> entry : row.entrySet()) {
                    String column = entry.getKey();
                    String value = entry.getValue();
                    out.println("<td><input type='text' name='" + column + "' value='" + value + "' style='border:none; background:transparent; text-align:center;' readonly></td>");
                }

                out.println("<td>");
                out.println("<button type='submit' name='action' value='delete' class='action-btn delete-btn'>Delete</button>");
                out.println("<button type='button' onclick='enableEdit(this)' class='action-btn update-btn'>Edit</button>");
                out.println("<button type='submit' name='action' value='update' class='action-btn update-btn' style='display:none;'>Submit</button>");
                out.println("<input type='hidden' name='" + ("staff_login".equals(tableType) ? "id" : "item_id") + "' value='" + id + "'>");
                out.println("<input type='hidden' name='table' value='" + tableType + "'>");
                out.println("</td>");

                out.println("</form>");
                out.println("</tr>");
            }

            out.println("</table>");
        } else if (tableType != null) {
            out.println("<p class='no-records'>No records found in the " + tableType + " table.</p>");
        }

        // Show insert button regardless of whether records are present (if a table is selected)
        if (tableType != null) {
            if ("staff_login".equals(tableType)) {
                out.println("<a href='register.jsp'><button class='insert-btn'>Insert Staff</button></a>");
            } else if ("inventory".equals(tableType)) {
                out.println("<a href='general.jsp'><button class='insert-btn'>Insert Saree</button></a>");
            }
        }
    %>
</div>

<div class="footer">
    <p>DEVBA SAREES, Near Petrol Bunk, Koti, Hyderabad, 484440</p>
</div>
</body>
</html>