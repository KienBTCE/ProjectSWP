/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.InventoryStatisticDAO;
import Models.InventoryStatistic;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author NguyenPVT-CE181835
 */
public class SearchInventoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InventoryStatisticDAO inventoryDAO = new InventoryStatisticDAO();
        ArrayList<InventoryStatistic> listI;
        String query = request.getParameter("query");
        if (query == null || query.trim().isEmpty()) {
            listI = inventoryDAO.getAllInventory();
        } else {
            listI = inventoryDAO.searchInventory(query);
        }
        request.setAttribute("listI", listI);
        request.setAttribute("searchQuery", query);
        request.getRequestDispatcher("InventoryStatisticView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
