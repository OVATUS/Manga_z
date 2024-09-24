<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manga  Summary</title>
    </head>
    <body>
        <h1>Manga  Summary</h1>

        <%
            // รับข้อมูลจาก session
            String customerName = (String) session.getAttribute("customerName");
            String[] selectedManga = (String[]) session.getAttribute("selectedManga");
            String membership = (String) session.getAttribute("membership");
            String employee = (String) session.getAttribute("employee");
            Double totalPrice = (Double) session.getAttribute("totalPrice");
        %>

        <h2>Customer Name: <%= customerName%></h2>

        <h3>Selected Manga:</h3>
        <ul>
            <%
                if (selectedManga != null) {
                    for (String manga : selectedManga) {
            %>
            <li><%= manga%></li>
                <%
                        }
                    }
                %>
        </ul>

        <h3>Membership Status: <%= "yes".equals(membership) ? "Member (5% discount)" : "Non-member"%></h3>
        <h3>Employee: <%= employee%></h3>
        <h3>Total Price: <%= totalPrice%> Baht</h3>

        <!-- ปุ่มเพื่อเชื่อมไปแก้ไขข้อมูล -->
        <form action="editPage.jsp" method="get">
            <button type="submit">Edit Information</button>
        </form>
    </body>
</html>
