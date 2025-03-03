/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CustomerDAO;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author nhutb
 */
@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/updateCustomerProfile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
public class UpdateCustomerProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CustomerDAO cusDAO = new CustomerDAO();
        Customer cus = (Customer) session.getAttribute("customer");
        Part img = request.getPart("avatar");

        String fullname = request.getParameter("fullname");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");

        cus.setFullName(fullname);
        cus.setPhoneNumber(phoneNumber);
        cus.setGender(gender);
        cus.setBirthday(year + "-" + month + "-" + day);
        int rs = cusDAO.updateCustomerProfile(cus);
        if (rs == 0) {
            session.setAttribute("message", "Update customer fail!");
        } else {
            session.setAttribute("customer", cus);
            session.setAttribute("message", "Update customer susscessfull!");
        }

        //String filename = img.getSubmittedFileName();
        //cusDAO.updateAvatar(cus.getId() + ".jpg", cus.getId());
        if (img != null && img.getSize() > 0) {
            cus.setAvatar(cus.getId() + ".jpg");
            for (Part part : request.getParts()) {
                part.write("E:\\HocTap\\Ky5\\ProjectSWP\\FShop\\src\\main\\webapp\\assets\\imgs\\CustomerAvatar\\" + cus.getId() + ".jpg");
            }
            try {
                Thread.sleep(2500); // 15 giây = 15000 mili giây
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("profilePage", "CustomerProfileView.jsp");
        request.getRequestDispatcher("ProfileManagementView.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
