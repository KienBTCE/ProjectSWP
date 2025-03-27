/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CustomerDAO;
import DAOs.CustomerVoucherDAO;
import DAOs.VoucherDAO;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ThyLTKCE181577
 */
public class RegisterOTPServlet extends HttpServlet {

    // Static map lưu trạng thái lock theo email
    private static final Map<String, LockInfo> lockMap = new HashMap<>();

    // Class lưu số lần thử và thời gian lock
    private static class LockInfo {

        int attempts;
        long lockTime; // 0 nếu chưa lock

        LockInfo(int attempts, long lockTime) {
            this.attempts = attempts;
            this.lockTime = lockTime;
        }
    }

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
            out.println("<title>Servlet RegisterOTPServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterOTPServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("VerifyOTPView.jsp").forward(request, response);
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

        // Lấy thông tin email từ đối tượng customer đã đăng ký
        Customer customer = (Customer) session.getAttribute("registerCustomer");
        if (customer == null) {
            request.setAttribute("error", "Session expired! Please register again.");
            request.getRequestDispatcher("RegisterView.jsp").forward(request, response);
            return;
        }
        String email = customer.getEmail();

        // Kiểm tra trạng thái lock của email từ lockMap
        LockInfo lockInfo = lockMap.get(email);
        if (lockInfo != null && lockInfo.attempts >= 5) {
            long elapsedTime = System.currentTimeMillis() - lockInfo.lockTime;
            if (elapsedTime < 30 * 60 * 1000) {
                int minutesRemaining = (int) ((30 * 60 * 1000 - elapsedTime) / 60000);
                request.setAttribute("error", "Bạn đã nhập sai OTP quá 5 lần. Vui lòng thử lại sau " + minutesRemaining + " phút.");
                request.getRequestDispatcher("OTPView.jsp").forward(request, response);
                return;
            } else {
                // Reset lock nếu đã hết thời gian
                lockMap.remove(email);
                lockInfo = null;
            }
        }

        String otpEntered = request.getParameter("otp");
        String otpStored = (String) session.getAttribute("otp");

        if (otpStored != null && otpStored.equals(otpEntered)) {
            // Nếu OTP đúng: xóa trạng thái lock (nếu có) và reset số lần thử
            lockMap.remove(email);
            session.removeAttribute("otp");

            // Đăng ký customer vào database
            CustomerDAO ctmDAO = new CustomerDAO();
            int result = ctmDAO.addNewCustomer(customer);

            if (result != 0) {
                session.setAttribute("message", "Register Successfully");
                // Xóa thông tin customer khỏi session
                session.removeAttribute("registerCustomer");

                CustomerVoucherDAO cv = new CustomerVoucherDAO();
                Customer cus = ctmDAO.getCustomerLogin(customer.getEmail(), customer.getPassword());
                cv.assignVoucherToCustomer(cus.getId(), 1, 1, null);
                response.sendRedirect("/customerLogin");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("OTPView.jsp").forward(request, response);
            }
        } else {
            // Nếu OTP sai, cập nhật số lần nhập sai vào lockMap
            if (lockInfo == null) {
                // Tạo mới LockInfo với 1 lần thử
                lockInfo = new LockInfo(1, 0);
                lockMap.put(email, lockInfo);
            } else {
                lockInfo.attempts++;
                if (lockInfo.attempts >= 5 && lockInfo.lockTime == 0) {
                    // Khi đạt 5 lần, thiết lập thời gian lock
                    lockInfo.lockTime = System.currentTimeMillis();
                }
            }
            int remaining = 5 - lockInfo.attempts;
            if (remaining < 0) {
                remaining = 0;
            }
            request.setAttribute("error", "Incorrect OTP code! Bạn còn " + remaining + " lần thử.");
            request.getRequestDispatcher("OTPView.jsp").forward(request, response);
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
