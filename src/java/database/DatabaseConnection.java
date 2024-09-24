package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // กำหนดค่าการเชื่อมต่อฐานข้อมูล
    private static final String URL = "jdbc:mysql://localhost:3306/manga_rental";
    private static final String USER = "root"; // แก้ไขตามชื่อผู้ใช้ MySQL ของคุณ
    private static final String PASSWORD = "zee1"; // แก้ไขตามรหัสผ่านของคุณ

    // สร้าง Connection ให้ใช้ได้ในหลายๆ ไฟล์
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // โหลด MySQL JDBC Driver
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
    }
}
