/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ProductDAO;
import Models.Product;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author KienBTCE180180
 */
public class HomeServlet extends HttpServlet {

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
//        ArrayList<Product> productList = null;
//        HttpSession session = request.getSession();
////        ProductDAO pD = new ProductDAO();
////        ArrayList<Product> products = pD.GetAllProducts();
//        LaptopDAO lD = new LaptopDAO();
//        ArrayList<Laptop> laptops = lD.GetAllLaptops();
//        PhoneDAO phD = new PhoneDAO();
//        ArrayList<Phone> phones = phD.GetAllPhones();
//        if(session.getAttribute("customer") != null){
//            CartDAO c = new CartDAO();
//            Customer cus = (Customer)session.getAttribute("customer");
//            session.setAttribute("numOfProCartOfCus", c.getNumberOfProduct(cus.getId()));
//        }
//        CartDAO c = new CartDAO();
//        try {
//            request.setAttribute("laptops", laptops);
//            request.setAttribute("phones", phones);
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//        } catch (NullPointerException e) {
//            System.out.println(e);
//        }

//        ProductDAO pd = new ProductDAO();
//        ArrayList<Product> products = new ArrayList<>();
//        products = pd.GetAllProducts();
//        
//        try {
//            request.setAttribute("products", products);
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//        } catch (NullPointerException e) {
//            System.out.println(e);
//        }
        System.out.println("===== Servlet is running =====");
        System.out.println("Request received in: " + this.getClass().getSimpleName());

        ProductDAO pd = new ProductDAO();
        ArrayList<Product> products = pd.GetAllProducts();
        
        System.out.println(products.size());
        
        try {
            request.setAttribute("products", products);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (NullPointerException e) {
            System.out.println(e);
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
