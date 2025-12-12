<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login - Devba Sarees</title>

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
            position: relative;
        }

        .home-icon {
            position: absolute;
            top: 20px;
            right: 30px;
            font-size: 28px;
            color: white;
            cursor: pointer;
            transition: color 0.3s ease;
            z-index: 999;
        }

        .home-icon:hover {
            color: #00f2fe;
        }

        .login-container {
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 380px;
            max-width: 90%;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-weight: 700;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        input {
            margin: 10px 0;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            color: #333;
            background-color: #f9f9f9;
        }

        input:focus {
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

        .forgot-password {
            margin-top: 10px;
            font-size: 13px;
        }

        .forgot-password a {
            color: #2575fc;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
            z-index: 10;
        }
    </style>

    <script>
        function forgotPassword() {
            alert("Please email ADMIN for password changes.");
            window.location.href = "mailto:admin@devbasarees.com?subject=Password%20Reset%20Request&body=Dear%20Admin,%0D%0A%0D%0AI%20forgot%20my%20password.%20Please%20help%20me%20reset%20it.%0D%0A%0D%0AThank%20you.";
        }
    </script>

</head>
<body>


<a href="index.jsp" class="home-icon" title="Go to Home">
    <i class="fas fa-home"></i>
</a>

<div class="login-container">
    <h2>Staff Login</h2>
    <form action="LoginServlet" method="post">
        <input type="text" name="staff_id" maxlength="8" placeholder="Staff ID" required>
        <input type="password" name="password" placeholder="Password" required>

        <div class="forgot-password">
            <a href="#" onclick="forgotPassword()">Forgot Password?</a>
        </div>

        <button type="submit" class="btn-submit">Login</button>
    </form>
</div>

<div class="footer">
    DEVBA SAREES, Near Petrol Bunk, Koti, Hyderabad, 484440
</div>

</body>
</html>
