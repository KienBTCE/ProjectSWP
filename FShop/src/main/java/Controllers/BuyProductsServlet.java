/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AddressDAO;
import DAOs.CartDAO;
import DAOs.OrderDAO;
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
@WebServlet(name = "buyProductsServlet", urlPatterns = {"/order"})
public class BuyProductsServlet extends HttpServlet {

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
            out.println("<title>Servlet Order</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("buyProductAction");
        OrderDAO od = new OrderDAO();
        CartDAO ca = new CartDAO();
        Customer cus = (Customer) session.getAttribute("customer");

        if (action.equals("checkout")) {
            List<Cart> cart = (List<Cart>) session.getAttribute("cartList");
            String selectedProductIds[] = request.getParameterValues("cartSelected");
            List<Cart> cartSelected = new ArrayList<>();
            AddressDAO cdao = new AddressDAO();
            Address add = cdao.getDefaultAddress(cus.getId());
            String address = add.getAddressDetails();
            int count = 0;
            long totalAmount = 0;
            for (int i = 0; i < cart.size(); i++) {
                for (String selectedProductId : selectedProductIds) {
                    if (cart.get(i).getProductID() == Integer.parseInt(selectedProductId)) {
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
            request.getRequestDispatcher("CheckoutView.jsp").forward(request, response);
        } else if (action.equals("confirm")) {
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            System.out.println(fullname + " " + address);
            session.setAttribute("order", new Order(fullname, phone, address));
            request.getRequestDispatcher("ConfirmView.jsp").forward(request, response);
        } else if (action.equals("placeOrder")) {
            long totalAmount = Long.parseLong(request.getParameter("totalAmount"));
            Order o = (Order) session.getAttribute("order");
            o.setAccountID(cus.getId());
            o.setTotalAmount(totalAmount);
            od.createNewOrder(o);
            List<Cart> cartSelected = (List<Cart>) session.getAttribute("cartSelected");
            for (Cart c : cartSelected) {
                od.addOrderDetail(od.getNewestOrderID(), c.getProductID(), c.getQuantity(), c.getPrice());
                od.subtractQuantityAfterBuy(c.getProductID(), c.getQuantity());
                ca.deleteProductOnCart(c.getProductID(), cus.getId());
            }
            session.setAttribute("orderStatus", "success");
            session.setAttribute("numOfProCartOfCus", ca.getNumberOfProduct(cus.getId()));
            request.getRequestDispatcher("ConfirmView.jsp").forward(request, response);
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
