<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Insert Saree - Devba Sarees</title>

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('sareehome.jpg') no-repeat center center/cover;
        }

        .overlay {
            background-color: rgba(255,255,255,0.95);
            position: absolute;
            inset: 0;
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 2;
            padding: 60px 20px;
            text-align: center;
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

        .saree-options {
            display: flex;
            justify-content: center;
            gap: 40px;
            margin-bottom: 30px;
        }

        .saree-option {
            text-align: center;
        }

        .saree-option img {
            width: 130px;
            height: 130px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        .saree-option button {
            margin-top: 10px;
            background: linear-gradient(90deg, #4facfe, #00f2fe);
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .form-section {
            display: none;
            margin-top: 30px;
            background: linear-gradient(to right, #fbc2eb, #a6c1ee);
            padding: 30px;
            border-radius: 12px;
            width: 500px;
            margin-left: auto;
            margin-right: auto;
        }

        .form-section input, .form-section select {
            padding: 10px;
            width: 90%;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .form-section button {
            padding: 12px 20px;
            background: #2575fc;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
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
        function showForm(type, price) {
            document.getElementById("formContainer").style.display = "block";
            document.getElementById("saree_type").value = type;
            document.getElementById("price").value = price;
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
    <div class="saree-options">
        <div class="saree-option">
            <img src="KanjivaranSareelogo.png" alt="Kanjivaram Silk">
            <button onclick="showForm('KANJIVARAM SILK', '12,000-50,000')">KANJIVARAM SILK</button>
        </div>
        <div class="saree-option">
            <img src="MysoreSareelogo.png" alt="Mysore Silk">
            <button onclick="showForm('MYSORE SILK', '8,000-30,000')">MYSORE SILK</button>
        </div>
        <div class="saree-option">
            <img src="BandhaniSareelogo.png" alt="Bandhani">
            <button onclick="showForm('BANDHANI', '500-20,000')">BANDHANI</button>
        </div>
    </div>

    <div id="formContainer" class="form-section">
        <form method="post" action="GeneralServlet">
            <input type="text" id="saree_type" name="saree_type" readonly required>
            <input type="text" id="price" name="price" readonly required>
            <input type="number" name="quantity" min="1" value="1" required>
            <select name="supplier_name" required>
                <option value="">Select Supplier</option>
                <option value="J K Supplier">J K Supplier</option>
                <option value="Saroj Supplier">Saroj Supplier</option>
                <option value="Ahmed and Sons Group">Ahmed and Sons Group</option>
            </select>
            <button type="submit">Submit</button>
        </form>
    </div>
</div>

<div class="footer">
    DEVBA SAREES, Near Petrol Bunk, Koti, Hyderabad, 484440
</div>

</body>
</html>
