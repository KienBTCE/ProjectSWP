/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAOs.InventoryStatisticDAO;
import DAOs.StatisticDAO;
import Models.InventoryStatistic;
import Models.Statistic;
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
public class InventoryStatisticServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InventoryStatisticServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InventoryStatisticServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        InventoryStatisticDAO inventoryStatisticDAO = new InventoryStatisticDAO();
        ArrayList<InventoryStatistic> listInventoryPhone = inventoryStatisticDAO.getInventoryforSmartPhone();
        ArrayList<InventoryStatistic> listInventoryLaptop = inventoryStatisticDAO.getInventoryforLaptop();
        ArrayList<InventoryStatistic> list = inventoryStatisticDAO.getAllInventory();
        request.setAttribute("listI", list);
        request.setAttribute("listInventoryPhone", listInventoryPhone);
        request.setAttribute("listInventoryLaptop", listInventoryLaptop);
        request.getRequestDispatcher("InventoryStatisticView.jsp").forward(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

}
