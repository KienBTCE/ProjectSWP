package Controllers;

import DAOs.EmployeeDAO;
import Models.Employee;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.Date;

@WebServlet(name = "UpdateEmployeeServlet", urlPatterns = {"/UpdateEmployee"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            EmployeeDAO empDAO = new EmployeeDAO();
            Employee emp = empDAO.getEmployeeById(id);
            request.setAttribute("employee", emp);
            request.setAttribute("currentAvatar", emp.getAvatar());
            request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            EmployeeDAO empDAO = new EmployeeDAO();
            int employeeId = Integer.parseInt(request.getParameter("txtEmployeeId"));
            int roleId = Integer.parseInt(request.getParameter("txtRoleId"));
            String name = request.getParameter("txtName");
            String password = request.getParameter("txtPass");
            Date birthday = Date.valueOf(request.getParameter("txtBirthday"));
            String phone = request.getParameter("txtPhoneNumber");
            String email = request.getParameter("txtEmail");
            String gender = request.getParameter("txtGender");
            Date createdDate = Date.valueOf(request.getParameter("txtCreatedDate"));
            int status = Integer.parseInt(request.getParameter("txtStatus"));
            String avatar = request.getParameter("currentAvatar");
            Part part = request.getPart("txtAvatar");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            // **1. Check if email exists**
            if (!email.equals(request.getParameter("currentEmail")) && empDAO.isEmailExists(email)) {
                request.setAttribute("errorMsg", "Email đã tồn tại! Vui lòng chọn email khác.");
                // Giữ lại tất cả các giá trị đã nhập vào
                request.setAttribute("txtEmployeeId", employeeId);
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
                request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
                return;
            }

            // **2. Validate password**
            if (!isValidPassword(password) && !password.equals(request.getParameter("currentPassword"))) {
                request.setAttribute("errorMsg", "Mật khẩu phải có ít nhất 8 ký tự, bao gồm 1 chữ hoa và 1 ký tự đặc biệt!");
                // Giữ lại các giá trị đã nhập vào
                request.setAttribute("txtEmployeeId", employeeId);
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
                request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
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

            Employee emp = new Employee(employeeId, name, birthday, password, phone, email, gender, createdDate, status, avatar, roleId);
            int result = empDAO.UpdateEmployee(emp);

            if (result > 0) {
                request.setAttribute("successMsg", "Updated successfully");
                request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Update failed! Please try again.");
                request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
            }
        } catch (NullPointerException e) {
            System.out.println(e);
        }
    }

    private boolean isValidPassword(String password) {
        return password.matches("^(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$");
    }

}
