
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DEVBA SAREES - Inventory Management</title>

   

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family:  'Cinzel', serif;
            height: 100vh;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            color: #333;
        }

       
        .background-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('sareehome.jpg') no-repeat center center/cover;
            filter: blur(8px);
            z-index: -1;
        }

        .header {
            text-align: center;
            padding: 30px 20px 10px;
            font-family: 'Lora', serif;;
            font-size: 56px;
            color: black;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.2);
        }

        .center-box {
            background: rgba(255, 255, 255, 0.85);
            margin: auto;
            padding: 50px 35px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0px 12px 25px rgba(0, 0, 0, 0.2);
            width: 350px;
            z-index: 1;
            position: relative;
        }

        .center-box h2 {
            margin-bottom: 30px;
            font-size: 26px;
            color: #333;
            font-weight: 700;
        }

        .btn {
            display: inline-block;
            margin: 10px 15px;
            padding: 14px 28px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #8E44AD, #6C3483);
            color: #fff;
            font-size: 16px;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
        }

        .btn:hover {
            background: linear-gradient(135deg, #6C3483, #5B2C6F);
            transform: translateY(-2px);
        }

        .footer {
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 15px;
            text-align: center;
            font-size: 14px;
            letter-spacing: 1px;
            z-index: 1;
            position: relative;
        }
    </style>
</head>
<body>
    

   
    <div class="background-image"></div>

    <div class="header">
        DEVBA SAREES
    </div>

    <div class="center-box">
        <h2>Welcome to Saree Inventory</h2>
        <a href="login.jsp" class="btn">Login</a>
        <a href="register.jsp" class="btn">Register</a>
    </div>

    <div class="footer">
        DEVBA SAREES,Near Petrol Bunk, Koti, Hyderabad, 484440
    </div>

</body>
</html>
