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
            int employeeId = Integer.parseInt(request.getParameter("txtEmployeeId"));
            int roleId = Integer.parseInt(request.getParameter("txtRoleId"));
            String name = request.getParameter("txtName");
            String password = request.getParameter("txtPass");
            java.sql.Date birthday = java.sql.Date.valueOf(request.getParameter("txtBirthday"));
            String phone = request.getParameter("txtPhoneNumber");
            String email = request.getParameter("txtEmail");
            String gender = request.getParameter("txtGender");
            java.sql.Date createdDate = java.sql.Date.valueOf(request.getParameter("txtCreatedDate"));
            int status = Integer.parseInt(request.getParameter("txtStatus"));

            Part part = request.getPart("txtAvatar");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String avatar = request.getParameter("currentAvatar");

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

            EmployeeDAO empDAO = new EmployeeDAO();
            Employee emp = new Employee(employeeId, name, birthday, password, phone, email, gender, createdDate, status, avatar, roleId);
            int result = empDAO.UpdateEmployee(emp);

            if (result > 0) {
                response.sendRedirect("EmployeeList?success=Employee updated successfully");
            } else {
                request.setAttribute("errorMsg", "Update failed! Please try again.");
                request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Invalid data! Please check your input.");
            request.getRequestDispatcher("UpdateEmployeeView.jsp").forward(request, response);
        }
    }

}
