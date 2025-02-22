/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.PhoneDAO;
import Models.Phone;
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
public class ViewPhoneServlet extends HttpServlet {

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
        PhoneDAO phD = new PhoneDAO();
        ArrayList<Phone> phones = null;
        ArrayList<String> filters = new ArrayList<>();
        ArrayList<String> filtersInput = new ArrayList<>();
        boolean isFilter = false;

        String brand = request.getParameter("brand");
        if (brand != null) {
            String[] brandFilters = brand.split(",");

            for (int i = 0; i < brandFilters.length; i++) {
                if (brandFilters.length == 1) {
                    filtersInput.add(" AND brand IN ('" + brandFilters[i].trim() + "')");
                } else if (i == 0) {
                    filtersInput.add(" AND brand IN ('" + brandFilters[i].trim() + "', ");
                } else if (i == brandFilters.length - 1) {
                    filtersInput.add("'" + brandFilters[i].trim() + "')");
                } else {
                    filtersInput.add("'" + brandFilters[i].trim() + "', ");
                }
                filters.add(brandFilters[i].trim());
            }

        }

        String price = request.getParameter("price");
        if (price != null) {
            ArrayList<String> priceFilters = new ArrayList<>();
            for (String string : price.split(",")) {
                switch (string.trim()) {
                    case "20-25":
                        priceFilters.add("BETWEEN 20000000 AND 25000000");
                        break;
                    case "25-30":
                        priceFilters.add("BETWEEN 25000000 AND 30000000");
                        break;
                    case "30-over":
                        priceFilters.add("> 30000000");
                        break;
                    default:
                        priceFilters.add("BETWEEN 0 AND 1000000000");
                        break;
                }
                filters.add(string.trim());
            }

            for (int i = 0; i < priceFilters.size(); i++) {
                if (priceFilters.size() == 1) {
                    filtersInput.add(" AND price " + priceFilters.get(i).trim());
                } else if (i == 0) {
                    filtersInput.add(" AND (price " + priceFilters.get(i).trim());
                } else if (i == priceFilters.size() - 1) {
                    filtersInput.add(" OR price " + priceFilters.get(i).trim() + ")");
                } else {
                    filtersInput.add(" OR price " + priceFilters.get(i).trim());
                }
            }
        }

        if (!filtersInput.isEmpty()) {
//            phones = phD.GetFilterLaptops(filtersInput);
            isFilter = true;
        }
        if (!isFilter) {
//            phones = phD.GetAllPhones();
        }

        try {
            int numberRow = 0;
            if (phones != null) {
                numberRow = phones.size() / 4;
                if (phones.size() % 4 != 0) {
                    numberRow++;
                }
            }

//            ArrayList<String> brands = phD.GetAllBrandPhone();
            request.setAttribute("phoneProducts", phones);
//            request.setAttribute("brands", brands);
            request.setAttribute("numberRow", numberRow);
            request.setAttribute("uri", request.getServletPath().substring(1));
            request.setAttribute("filters", filters);
            request.getRequestDispatcher("viewPhone.jsp").forward(request, response);
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
