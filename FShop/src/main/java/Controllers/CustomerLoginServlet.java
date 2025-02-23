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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author TuongMPCE180644
 */
@WebServlet(name = "CustomerLoginServlet", urlPatterns = {"/customerLogin"})
public class CustomerLoginServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerLoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerLoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("customerLoginView.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        CustomerDAO ctmDAO = new CustomerDAO();

        if (ctmDAO.checkEmailExisted(email) != 1) {
            session.setAttribute("message", "Account does not exist!");
            System.out.println("Email does not exist");
            request.getRequestDispatcher("customerLoginView.jsp").forward(request, response);
            return;
        }

        if (ctmDAO.checkEmailExisted(email) == 1) {
            Customer customer = ctmDAO.getCustomerLogin(email, password);
            if (customer == null) {
                session.setAttribute("message", "Incorrect email or password!");
                System.out.println("Wrong credentials");
                request.getRequestDispatcher("customerLoginView.jsp").forward(request, response);
                return;
            }

            if (customer.getIsDeleted() == 1) {
                session.setAttribute("message", "Account does not exist!");
                System.out.println("Account is deleted");
            } else if (customer.getIsBlock() == 1) {
                session.setAttribute("message", "Your account has been locked!");
                System.out.println("Account is blocked");
            } else {
                session.setAttribute("customer", customer);
                System.out.println("Login success");
                request.getRequestDispatcher("HomeServlet").forward(request, response);
                return;
            }
        } else {
            session.setAttribute("message", "Account does not exist!");
        }

        request.getRequestDispatcher("customerLoginView.jsp").forward(request, response);

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
