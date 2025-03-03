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
import Models.Product;
import Models.ImportOrderDetail;
import Models.Supplier;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KienBTCE180180
 */
public class ImportStockServlet extends HttpServlet {

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

        SupplierDAO sd = new SupplierDAO();
        ProductDAO pd = new ProductDAO();

        try {
            request.setAttribute("suppliers", sd.getAllSuppliers());
            request.setAttribute("products", pd.getAllProducts());
            request.getRequestDispatcher("ImportStockView.jsp").forward(request, response);
        } catch (NullPointerException e) {
            System.out.println(e);
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
//        processRequest(request, response);

//        ImportOrder i = new ImportOrder(0, 0, 0, importDate, 0, lastModify);
//        Supplier s = new Supplier(0, taxId, name, email, phoneNumber, address, LocalDateTime.MAX, LocalDateTime.MIN, 0, 0);
//        Product p = new Models.Product(0, categoryName, brandName, fullName, 0, 0, 0);
//        ImportOrderDetail = d = new ImportOrderDetail(0, p, 0, 0);
        SupplierDAO sd = new SupplierDAO();
        Supplier s = sd.getSupplierByTaxID(request.getParameter("taxId"));
        ArrayList<ImportOrderDetail> detailList = null;
        String jsonS = request.getParameter("selectedProducts");

        if (jsonS != null && s != null) {
            Gson gson = new Gson();
            Type listType = new TypeToken<List<Map<String, String>>>() {
            }.getType();
            List<Map<String, String>> list = gson.fromJson(jsonS, listType);
            
            long sum = 0;

            for (Map<String, String> map : list) {
                sum += Integer.parseInt(map.get("stock")) * Long.parseLong(map.get("price"));
                System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP" + sum);
            }
            System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP" + sum);

//            ImportOrderDAO ioD = new ImportOrderDAO();
//            int importOrderID = ioD.createImportOrder(new ImportOrder(0, s.getSupplierId(), sum));
//
//            for (Map<String, String> map : list) {
//                ImportOrderDetail d = new ImportOrderDetail();
//                Product p = new Product();
//                p.setProductId(Integer.parseInt(map.get("id")));
//
//                d.setIoid(importOrderID);
//                d.setImportPrice(Long.parseLong(map.get("price")));
//                d.setQuantity(Integer.parseInt(map.get("stock")));
//                d.setProduct(p);
//
//                detailList.add(d);
//            }
//
//            ImportOrderDetailDAO iodD = new ImportOrderDetailDAO();
//
//            iodD.createImportOrderDetails(detailList);
//
//            ioD.importStock(list);
        }

//        for (Map<String, String> map : list) {
//            System.out.println("id: " + map.get("id") + ", stock: " + map.get("stock"));
//        }
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
