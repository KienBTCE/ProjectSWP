/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ImportOrderDAO;
import DAOs.ImportOrderDetailDAO;
import DAOs.ProductDAO;
import DAOs.SupplierDAO;
import Models.ImportOrder;
import Models.ImportOrderDetail;
import Models.Product;
import Models.Supplier;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KienBTCE180180
 */
public class ImportStockServlet extends HttpServlet {

    SupplierDAO sd = new SupplierDAO();
    ProductDAO pd = new ProductDAO();
    ImportOrder io;
    ImportOrderDAO ioD = new ImportOrderDAO();
    ImportOrderDetailDAO iodD = new ImportOrderDetailDAO();
    ArrayList<Product> selectedProducts;
    Supplier s;
    int importId;
    ImportOrder importOrder;

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
//            out.println("<title>Servlet ImportStockServlet</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ImportStockServlet at " + request.getContextPath () + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
//        processRequest(request, response);

        if (request.getParameter("id") != null) {
            importId = Integer.parseInt(request.getParameter("id"));
            io = ioD.getImportOrderByID(Integer.parseInt(request.getParameter("id")));
            importOrder = ioD.getImportOrderDetailsByID(importId);
            s = sd.getSupplierByID(io.getSupplierId());
            try {
                request.setAttribute("supplier", io.getSupplier());
                request.setAttribute("suppliers", sd.getAllSuppliers());
                request.setAttribute("products", pd.getAllProducts());
                request.setAttribute("importOrder", importOrder);
                request.getRequestDispatcher("ImportStockView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }
        } else if (request.getParameter("importStockId") != null) {
            System.out.println("helo3");
            ioD.importStock(Integer.parseInt(request.getParameter("importStockId")), iodD.calculateTotalPrice(importId));
            response.sendRedirect("ImportOrder?id=" + importId);
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

        if (request.getParameter("supplierId") != null) {
            System.out.println("helo5");
            s = sd.getSupplierByID(Integer.parseInt(request.getParameter("supplierId")));
            io.setSupplier(s);
            ioD.updateImportOrderSupplier(Integer.parseInt(request.getParameter("supplierId")));
            response.sendRedirect("ImportStock?id=" + importId);
            return;
        }

        if (request.getParameter("productEditedId") != null) {
            System.out.println("helo1");
            ImportOrderDetail updatedIOD = new ImportOrderDetail();
            updatedIOD.setProduct(pd.getProductByID(Integer.parseInt(request.getParameter("productEditedId"))));
            updatedIOD.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            updatedIOD.setImportPrice(Integer.parseInt(request.getParameter("price")));
            iodD.updateDetailById(updatedIOD);
        }

        if (request.getParameter("productId") != null) {
            System.out.println("helo2");
            int pId = Integer.parseInt(request.getParameter("productId"));
            Product p = pd.getProductByID(pId);
            ImportOrderDetail d = new ImportOrderDetail();

            d.setIoid(importId);
            d.setProduct(p);
            d.setQuantity(Integer.parseInt(request.getParameter("importQuantity")));
            d.setImportPrice(Integer.parseInt(request.getParameter("importPrice")));

            boolean isContained = false;
            ArrayList<ImportOrderDetail> listDetail = iodD.getDetailsById(importId);

            for (ImportOrderDetail det : listDetail) {
                if (det.getProduct().getProductId() == pId) {
                    isContained = true;
                }
            }

            if (!isContained) {
                iodD.createImportOrderDetail(d);
            } else {
                String error = "duplicatedProduct";
                request.setAttribute("duplicatedProduct", error);
            }

//            request.setAttribute("selectedProducts", iodD.getDetailsById(Integer.parseInt(request.getParameter("id"))));
        }

        try {
            request.setAttribute("supplier", s);
            request.setAttribute("suppliers", sd.getAllSuppliers());
            request.setAttribute("products", pd.getAllProducts());
            importOrder = ioD.getImportOrderDetailsByID(importId);
            request.setAttribute("importOrder", importOrder);
            request.getRequestDispatcher("ImportStockView.jsp").forward(request, response);
        } catch (NullPointerException e) {
            System.out.println(e);
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
