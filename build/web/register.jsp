<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register - Devba Sarees</title>

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #c2e9fb, #e2e2e2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .home-icon {
            position: absolute;
            top: 20px;
            right: 30px;
            font-size: 28px;
            color: #333;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .home-icon:hover {
            color: #00c6ff;
        }

        .registration-container {
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 90%;
            text-align: center;
        }

        .registration-container h2 {
            margin-bottom: 20px;
            font-weight: 700;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        input, select {
            margin: 10px 0;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            color: #333;
            background-color: #f9f9f9;
        }

        input:focus, select:focus {
            border-color: #66afe9;
            outline: none;
            background-color: #fff;
        }

        .btn-submit {
            margin-top: 20px;
            background: linear-gradient(90deg, #4facfe, #00f2fe);
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-submit:hover {
            background: linear-gradient(90deg, #00c6ff, #0072ff);
        }

        .rules {
            text-align: left;
            font-size: 13px;
            color: #555;
            margin-top: 5px;
        }

        .rules ul {
            padding-left: 20px;
            margin-top: 5px;
        }
        .footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background: rgba(0, 0, 0, 0.7);
    color:white;
    text-align: center;
    padding: 10px 0;
    font-size: 14px;
    z-index: 10;
}
    </style>
</head>
<body>


<a href="index.jsp" class="home-icon" title="Go to Home">
    <i class="fas fa-home"></i>
</a>

<div class="registration-container">
    <h2>Register New Staff</h2>
    <form action="RegisterServlet" method="post">
        <input type="text" name="staff_id" maxlength="8" placeholder="Staff ID" required>
        <input type="text" name="name" placeholder="Name" required>
        <input type="number" name="age" placeholder="Age" min="18" required>
        <input type="text" name="location" placeholder="Location">
        <input type="password" name="password" placeholder="Password" required>

        <div class="rules">
            <strong>Password must contain:</strong>
            <ul>
                <li>At least 8 characters</li>
                <li>Letters (A-Z or a-z)</li>
                <li>At least 2 digits (0-9)</li>
            </ul>
            <strong>Age must be above 18.</strong>
        </div>

        <select name="role" required>
            <option value="">Select Role</option>
            <option value="admin">Admin</option>
            <option value="employee">Employee</option>
        </select>

        <button type="submit" class="btn-submit">Register</button>
    </form>
</div>
<div class="footer">
       DEVBA SAREES, Near Petrol Bunk, Koti, Hyderabad, 484440
    </div>
</body>
</html>
