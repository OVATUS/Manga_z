package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import database.DatabaseConnection;

@WebServlet(name = "OrderServletM", urlPatterns = {"/OrderServletM"})
public class OrderServletM extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // รับข้อมูลจากฟอร์ม
        String customerName = request.getParameter("customerName");
        String[] selectedManga = request.getParameterValues("mangaTitle");
        String membership = request.getParameter("membership");
        String employee = request.getParameter("employee");

        // คำนวณราคา
        double pricePerManga = 50.0;
        double totalPrice = selectedManga.length * pricePerManga;

        // ตรวจสอบการเป็นสมาชิกเพื่อใช้ส่วนลด
        if ("yes".equals(membership)) {
            totalPrice *= 0.95; // ลด 5%
        }

        // เก็บข้อมูลใน session
        HttpSession session = request.getSession();
        session.setAttribute("customerName", customerName);
        session.setAttribute("selectedManga", selectedManga);
        session.setAttribute("membership", membership);
        session.setAttribute("employee", employee);
        session.setAttribute("totalPrice", totalPrice);

        // เชื่อมต่อฐานข้อมูลและแทรกข้อมูล
        try (Connection conn = DatabaseConnection.getConnection()) {
            // สร้าง SQL statement สำหรับแทรกข้อมูล
            String sql = "INSERT INTO rental_orders (customer_name, selected_manga, membership_status, employee_name, total_price) VALUES (?, ?, ?, ?, ?)";

            // เตรียม statement และใส่ค่าจากฟอร์ม
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, customerName);
                stmt.setString(2, String.join(",", selectedManga)); // แปลง array ของ selectedManga ให้เป็น String
                stmt.setString(3, membership);
                stmt.setString(4, employee);
                stmt.setDouble(5, totalPrice);

                // ดำเนินการแทรกข้อมูล
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }

        // ส่งไปยัง Display.jsp
        response.sendRedirect("Display.jsp");
    }
}
