/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CustomerDAO;
import Models.Address;
import Models.Cart;
import Models.Customer;
import Models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nhutb
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + request.getContextPath() + "</h1>");
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
//        long total = Long.parseLong(request.getParameter("total"));
//        request.setAttribute("total", total);
        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cartList");
        String selectedProductIds[] = request.getParameterValues("cartSelected");
        List<Cart> cartSelected = new ArrayList<>();
        Customer cus = (Customer) session.getAttribute("customer");
        CustomerDAO cdao = new CustomerDAO();
        Address add = cdao.getDefaultAddress(cus.getId());
        String address = add.getStreet() + ", " + add.getWardNameEn() + ", " + add.getDistrictNameEn() + ", " + add.getProvinceNameEn();
        int count = 0;
        long totalAmount = 0;
        for (int i = 0; i < cart.size(); i++) {
            for (String selectedProductId : selectedProductIds) {
                if (cart.get(i).getSKU() == Integer.parseInt(selectedProductId)) {
                    cartSelected.add(cart.get(i));
                    totalAmount += cart.get(i).getPrice() * cart.get(i).getQuantity();
                    count++;
                    System.out.println(cart.get(i).getFullName());
                }
            }
        }
        
        session.setAttribute("cartSelected", cartSelected);
        session.setAttribute("totalAmount", totalAmount);
        session.setAttribute("shipAddress", address);
        session.setAttribute("numOfItems", count);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        System.out.println(fullname + " " +address);
        HttpSession session = request.getSession();
        session.setAttribute("order", new Order(fullname, phone, address));
        request.getRequestDispatcher("payment.jsp").forward(request, response);

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
