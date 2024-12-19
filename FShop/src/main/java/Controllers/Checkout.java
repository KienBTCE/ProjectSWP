/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.Cart;
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
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

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
        int count = 0;
        long totalAmount = 0;
        for (int i = 0; i < cart.size(); i++) {
            for (int j = 0; j < selectedProductIds.length; j++) {
                if (cart.get(i).getProductSKU() == Integer.parseInt(selectedProductIds[j])) {
                    cartSelected.add(cart.get(i));
                    totalAmount += cart.get(i).getPrice() * cart.get(i).getQuantity();
                    count++;
                }
            }
            
        }
        session.setAttribute("cartSelected", cartSelected);
        session.setAttribute("totalAmount", totalAmount);
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
        String city = request.getParameter("cityName");
        String district = request.getParameter("districtName");
        String town = request.getParameter("wardName");
        String way = request.getParameter("way");
        String totalAddress = address + ", " + town + ", " + district + ", " + city;
        HttpSession session = request.getSession();
        session.setAttribute("order", new Order(fullname, phone, totalAddress, way));
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
