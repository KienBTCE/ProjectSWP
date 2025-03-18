package Controllers;

import DAOs.EmployeeDAO;
import Models.Email;
import Models.EmailUtils;
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
            Date birthday = null;
            String birthdayStr = request.getParameter("txtBirthday");
            if (birthdayStr != null && !birthdayStr.isEmpty()) {
                birthday = Date.valueOf(birthdayStr);
            }
            String phone = request.getParameter("txtPhoneNumber");
            String email = request.getParameter("txtEmail");
            String gender = request.getParameter("txtGender");
            Date createdDate = Date.valueOf(request.getParameter("txtCreatedDate"));
            int status = Integer.parseInt(request.getParameter("txtStatus"));
            String avatar = request.getParameter("currentAvatar");
            Part part = request.getPart("txtAvatar");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!isValidPassword(password) && !password.equals(request.getParameter("currentPassword"))) {
                request.setAttribute("errorMsg", "Password must be at least 8 characters, including 1 uppercase letter and 1 special character!");
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

            Employee emp = new Employee(employeeId, name, birthday != null ? birthday : null, password, phone, email, gender, createdDate, status, avatar, roleId);
            int result = empDAO.UpdateEmployee(emp);

            if (result > 0) {
                String emailAddress = request.getParameter("txtEmail");
                Email sendEmail = new Email();
                sendEmail.setFrom("kieuthy2004@gmail.com");
                sendEmail.setFromPassword("xkkc ohwn aesf arqm");
                sendEmail.setTo(emailAddress);
                sendEmail.setSubject("Reset Password " + emailAddress);
                String emailContent = "Your password has been updated successfully.\n"
                        + "Your new password is:" + password + "\n"
                        + "Note: Please do not share this password with others.";
                sendEmail.setContent(emailContent);
                try {
                    EmailUtils.send(sendEmail);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                request.setAttribute("popupSuccessMsg", "Updated successfully");
                request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
            } else {
                request.setAttribute("popupErrorMsg", "Update failed! Please try again.");
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
