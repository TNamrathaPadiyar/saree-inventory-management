# Inventory Management System

A lightweight, JSP-based Inventory Management System designed to manage product entries, update stock details, and maintain supplier information. This project follows a clean MVC structure using JSP, Servlets, and MySQL, making it easy to understand, modify, and deploy.

---

## Features
- Add, update, view, and delete inventory items  
- Manage product type, price, quantity, supplier name, and description  
- Gradient UI with hover effects for tables  
- Inline editing for updates  
- Centralized Admin Dashboard  
- MySQL database integration  
- Clean and structured JSP + Servlet architecture  

---

## Tech Stack
- **Frontend:** HTML, CSS, JavaScript, JSP  
- **Backend:** Java Servlets  
- **Database:** MySQL  
- **Server:** Apache Tomcat  
- **IDE:** NetBeans  

---

---

## ⚙️ How It Works
1. **general.jsp** handles adding new saree/inventory items  
2. **AdminServlet** performs CRUD operations based on request parameters  
3. **admin.jsp** displays tables with update/delete buttons  
4. Insert buttons redirect to data entry pages  
5. All data is stored and managed in MySQL tables  

---

## Database Tables
### **inventory**
- `id`  
- `saree_type`  
- `price`  
- `quantity`  
- `supplier_name`  
- `description`  

### **staff_login**
- `id`  
- `name`  
- `email`  
- `password`  

---

## Running the Project
1. Import the project into **NetBeans**  
2. Create the database using `inventory.sql`  
3. Update DB credentials in AdminServlet  
4. Deploy on **Apache Tomcat**  
5. Access via:  http://localhost:8080/Inventory-Management/


---

## Future Enhancements
- Add authentication roles  
- Implement pagination  
- Add charts for inventory insights  
- Export inventory details as PDF  

---



