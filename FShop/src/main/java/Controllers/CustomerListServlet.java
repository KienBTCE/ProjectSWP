package Controllers;

import DAOs.CustomerDAO;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author kiuth
 */
public class CustomerListServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerListServlet at " + request.getContextPath() + "</h1>");
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

        CustomerDAO pr = new CustomerDAO();
        ArrayList<Customer> customers;

        String detailID = request.getParameter("id");
        String deleteID = request.getParameter("Blocked");
        String restoreID = request.getParameter("Activate");

        if (deleteID != null) {
            int id = Integer.parseInt(deleteID);
            pr.blockCustomer(id);
            response.sendRedirect("CustomerListServlet");
            return;
        }
        if (restoreID != null) {
            int id = Integer.parseInt(restoreID);
            pr.restoreCustomer(id);
            response.sendRedirect("CustomerListServlet");
            return;
        }
        if (detailID != null) {
            int id = Integer.parseInt(detailID);
            Customer customer = pr.getCustomerById(id);
            try {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("CustomerDetailView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }
        }
        customers = pr.getCustomerList();
        try {
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("ManageCustomerView.jsp").forward(request, response);
        } catch (NullPointerException e) {
            System.out.println(e);
        }
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
        processRequest(request, response);
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
