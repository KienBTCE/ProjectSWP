/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ProductDAO;
import DAOs.ProductRatingDAO;
import Models.Product;
import Models.ProductRating;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KienBTCE180180
 */
public class SearchProductServlet extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SearchProductServlet</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SearchProductServlet at " + request.getContextPath () + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        ProductDAO pd = new ProductDAO();
        List<Product> products = pd.searchProductByName(request.getParameter("name"));

        if (request.getParameter("name") != null) {
            ArrayList<String> filters = new ArrayList<>();
            try {
                ProductRatingDAO prDAO = new ProductRatingDAO();
                ArrayList<ProductRating> stars = new ArrayList<>();
                for (Product p : products) {
                    ProductRating star = prDAO.getStarAVG(p.getProductId());

                    stars.add(star);

                }
                Map<Object, Object> dataMap = new HashMap<>();
                dataMap.put("stars", stars);
                dataMap.put("products", products);
                request.setAttribute("dataMap", dataMap);
                request.setAttribute("products", products);
                request.setAttribute("filters", filters);
                request.getRequestDispatcher("SearchProductListView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }
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
