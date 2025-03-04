/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.EmployeeDAO;
import Models.Employee;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

/**
 *
 * @author NguyenPVT-CE181835
 */
@WebServlet(name = "AddEmployeeServlet", urlPatterns = {"/AddEmployee"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            EmployeeDAO empDAO = new EmployeeDAO();
            int roleId = Integer.parseInt(request.getParameter("txtRoleId"));
            String name = request.getParameter("txtName");
            String password = request.getParameter("txtPass");
            java.sql.Date birthday = java.sql.Date.valueOf(request.getParameter("txtBirthday"));
            String phone = request.getParameter("txtPhoneNumber");
            String email = request.getParameter("txtEmail");
            String gender = request.getParameter("txtGender");
            java.sql.Date createdDate = java.sql.Date.valueOf(request.getParameter("txtCreatedDate"));
            int status = Integer.parseInt(request.getParameter("txtStatus"));
            String avatar = request.getParameter("currentAvatar");
            Part part = request.getPart("txtAvatar");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            

            // **1. Kiểm tra email đã tồn tại chưa**
            if (empDAO.isEmailExists(email)) {
                request.setAttribute("errorMsg", "Email đã tồn tại! Vui lòng chọn email khác.");
                request.setAttribute("txtRoleId", roleId);
                request.setAttribute("txtName", name);
                request.setAttribute("txtPass", password);
                request.setAttribute("txtBirthday", birthday);
                request.setAttribute("txtPhoneNumber", phone);
                request.setAttribute("txtEmail", email);
                request.setAttribute("txtGender", gender);
                request.setAttribute("txtCreatedDate", createdDate);
                request.setAttribute("txtStatus", status);
                request.setAttribute("currentAvatar", avatar);
                request.getRequestDispatcher("AddEmployeeView.jsp").forward(request, response);
                return;
            }

            // **2. Kiểm tra mật khẩu có hợp lệ không**
            if (!isValidPassword(password)) {
                request.setAttribute("errorMsg", "Mật khẩu phải có ít nhất 8 ký tự, bao gồm 1 chữ hoa và 1 ký tự đặc biệt!");
                request.setAttribute("txtRoleId", roleId);
                request.setAttribute("txtName", name);
                request.setAttribute("txtPass", password);
                request.setAttribute("txtBirthday", birthday);
                request.setAttribute("txtPhoneNumber", phone);
                request.setAttribute("txtEmail", email);
                request.setAttribute("txtGender", gender);
                request.setAttribute("txtCreatedDate", createdDate);
                request.setAttribute("txtStatus", status);
                request.setAttribute("currentAvatar", avatar);
                request.getRequestDispatcher("AddEmployeeView.jsp").forward(request, response);
                return;
            }

            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("/") + "assets/imgs/Employee";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                part.write(uploadPath + File.separator + fileName);
                avatar = fileName;
            }
            if (avatar == null || avatar.isEmpty()) {
                avatar = request.getParameter("currentAvatar");
            }
            request.setAttribute("currentAvatar", avatar);

            Employee emp = new Employee(name, birthday, password, phone, email, gender, createdDate, status, avatar, roleId);
            int result = empDAO.AddEmployee(emp);

            if (result > 0) {
                request.setAttribute("successMsg", "Add successfully");
                request.getRequestDispatcher("AddEmployeeView.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Add failed! Please try again.");
                request.getRequestDispatcher("AddEmployeeView.jsp").forward(request, response);
            }
        } catch (NullPointerException e) {
            System.out.println(e);
        }
    }

    // **Hàm kiểm tra mật khẩu**
    private boolean isValidPassword(String password) {
        return password.matches("^(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$");
    }

}
