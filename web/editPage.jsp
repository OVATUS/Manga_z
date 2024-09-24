<%-- 
    Document   : editPage
    Created on : Aug 20, 2024, 5:12:14 PM
    Author     : oversit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Manga  Information</title>
    </head>
    <body>
        <h1>Edit Manga  Information</h1>

        <%
            // รับข้อมูลจาก session
            String customerName = (String) session.getAttribute("customerName");
            String[] selectedManga = (String[]) session.getAttribute("selectedManga");
            String membership = (String) session.getAttribute("membership");
            String employee = (String) session.getAttribute("employee");
        %>

        <!-- แสดงข้อมูลที่รับมาจาก session -->
        <h3>Current Information:</h3>
        <p><strong>Customer Name:</strong> <%= customerName != null ? customerName : "N/A"%></p>
        <p><strong>Selected Manga:</strong>
            <%
                if (selectedManga != null && selectedManga.length > 0) {
                    for (String manga : selectedManga) {
                        out.print(manga + " ");
                    }
                } else {
                    out.print("None selected");
                }
            %>
        </p>
        <p><strong>Membership Status:</strong> <%= membership != null ? membership : "N/A"%></p>
        <p><strong>Employee:</strong> <%= employee != null ? employee : "N/A"%></p>
        <br>

        <!-- ฟอร์มแก้ไขข้อมูล -->
        <form action="OrderServletM" method="post">
            <!-- 1. Customer Name -->
            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" value="<%= customerName%>" required>
            <br><br>

            <!-- 2. Manga Titles (Checkboxes) -->
            <h3>Select Manga Titles (50 Baht each):</h3>
            <label><input type="checkbox" name="mangaTitle" value="Naruto" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("Naruto")) ? "checked" : ""%>> Naruto</label><br>
            <label><input type="checkbox" name="mangaTitle" value="One Piece" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("One Piece")) ? "checked" : ""%>> One Piece</label><br>
            <label><input type="checkbox" name="mangaTitle" value="Dragon Ball" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("Dragon Ball")) ? "checked" : ""%>> Dragon Ball</label><br>
            <label><input type="checkbox" name="mangaTitle" value="Attack on Titan" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("Attack on Titan")) ? "checked" : ""%>> Attack on Titan</label><br>
            <label><input type="checkbox" name="mangaTitle" value="My Hero Academia" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("My Hero Academia")) ? "checked" : ""%>> My Hero Academia</label><br>
            <label><input type="checkbox" name="mangaTitle" value="Death Note" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("Death Note")) ? "checked" : ""%>> Death Note</label><br>
            <label><input type="checkbox" name="mangaTitle" value="Bleach" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("Bleach")) ? "checked" : ""%>> Bleach</label><br>
            <label><input type="checkbox" name="mangaTitle" value="Tokyo Ghoul" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("Tokyo Ghoul")) ? "checked" : ""%>> Tokyo Ghoul</label><br>
            <label><input type="checkbox" name="mangaTitle" value="Demon Slayer" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("Demon Slayer")) ? "checked" : ""%>> Demon Slayer</label><br>
            <label><input type="checkbox" name="mangaTitle" value="One Punch Man" <%= (selectedManga != null && java.util.Arrays.asList(selectedManga).contains("One Punch Man")) ? "checked" : ""%>> One Punch Man</label><br>
            <br>

            <!-- 3. Membership (Radio Buttons) -->
            <h3>Are you a member?</h3>
            <label><input type="radio" name="membership" value="yes" <%= "yes".equals(membership) ? "checked" : ""%>> Yes (5% discount)</label><br>
            <label><input type="radio" name="membership" value="no" <%= "no".equals(membership) ? "checked" : ""%>> No</label><br>
            <br>

            <!-- 4. Employee Selection (ComboBox) -->
            <label for="employee">Employee:</label>
            <select id="employee" name="employee" required>
                <option value="Zee" <%= "Zee".equals(employee) ? "selected" : ""%>>Zee</option>
                <option value="Fern" <%= "Fern".equals(employee) ? "selected" : ""%>>Fern</option>
                <option value="Maifa" <%= "Maifa".equals(employee) ? "selected" : ""%>>Maifa</option>
            </select>
            <br><br>

            <!-- Submit Button -->
            <input type="submit" value="Update Information">
        </form>
    </body>
</html>
