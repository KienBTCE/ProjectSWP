/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.LaptopDAO;
import Models.Laptop;
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
public class ViewLaptopServlet extends HttpServlet {

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
        LaptopDAO lD = new LaptopDAO();
        ArrayList<Laptop> laptops = null;
        ArrayList<String> filters = new ArrayList<>();
        boolean isFilter = false;

        String brand = request.getParameter("brand");
        if (brand != null && !brand.isEmpty()) {
            String[] brandFilters = brand.split(",");

            for (int i = 0; i < brandFilters.length; i++) {
                if (brandFilters.length == 1) {
                    filters.add("brand IN ('" + brandFilters[i].trim() + "')");
                } else if (i == 0) {
                    filters.add("brand IN ('" + brandFilters[i].trim() + "', ");
                } else if (i == brandFilters.length - 1) {
                    filters.add("'" + brandFilters[i].trim() + "')");
                } else {
                    filters.add("'" + brandFilters[i].trim() + "', ");
                }
            }

        }

        for (String filter : filters) {
            System.out.println(filter);
        }

        String price = request.getParameter("price");

        if (price != null) {
            filters.add("price = " + "\'" + price + "\'");
        }

        if (!filters.isEmpty()) {
            laptops = lD.GetFilterLaptops(filters);
            isFilter = true;
        }
        if (!isFilter) {
            laptops = lD.GetAllLaptops();
        }

        try {
            int numberRow = 0;
            if (laptops != null) {
                numberRow = laptops.size() / 4;
                if (laptops.size() % 4 != 0) {
                    numberRow++;
                }
            }

            ArrayList<String> brands = lD.GetAllBrandLaptop();
            request.setAttribute("laptopProducts", laptops);
            request.setAttribute("brands", brands);
            request.setAttribute("numberRow", numberRow);
            request.setAttribute("uri", request.getServletPath().substring(1));
            request.setAttribute("filters", filters);
            request.getRequestDispatcher("viewLaptop.jsp").forward(request, response);
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
