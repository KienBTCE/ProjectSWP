/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CustomerDAO;
import Models.Customer;
import Models.Email;
import Models.EmailUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;

/**
 *
 * @author TuongMPCE180644
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/RegisterView.jsp").forward(request, response);
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
        String fullName = request.getParameter("fullname");
//        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        CustomerDAO ctmDAO = new CustomerDAO();
        HttpSession session = request.getSession();

        if (ctmDAO.checkEmailExisted(email) == 1) {
            session.setAttribute("message", "This email already exists!");
            request.getRequestDispatcher("RegisterView.jsp").forward(request, response);
            return;
        }
        // Generate OTP
        String otp = generateOTP();
        session.setAttribute("otp", otp);
        session.setAttribute("registerCustomer", new Customer(0, fullName, password, "", "", "", email, "", 0, 0, ""));

        // Send OTP via email
        sendOTPEmail(email, otp, fullName);

        // Redirect to OTP verification page
        response.sendRedirect("OTPView.jsp");
    }

    private String generateOTP() {
        SecureRandom random = new SecureRandom();
        int otp = 100000 + random.nextInt(900000); // Generates a 6-digit number
        return String.valueOf(otp);
    }

    private void sendOTPEmail(String recipientEmail, String otp, String fullName) {
        try {
            Email email = new Email();
            email.setFrom("kieuthy2004@gmail.com"); // Sender email
            email.setFromPassword("xkkc ohwn aesf arqm"); // App Password for email
            email.setTo(recipientEmail);
            email.setSubject("Email Verification OTP");

            StringBuilder sb = new StringBuilder();
            sb.append("Dear ").append(fullName).append(",<br><br>");
            sb.append("Thank you for registering on our platform. Please use the OTP below to verify your email:<br>");
            sb.append("<h2>").append(otp).append("</h2>");
            sb.append("If you did not request this, please ignore this email.<br><br>");
            sb.append("Best Regards,<br>");
            sb.append("<b>FShop Team</b>");

            email.setContent(sb.toString());

            // Send the email
            EmailUtils.send(email);

        } catch (Exception e) {
            e.printStackTrace();
        }
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
