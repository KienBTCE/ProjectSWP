/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ImportOrderDAO;
import DAOs.ImportOrderDetailDAO;
import DAOs.ProductDAO;
import DAOs.SupplierDAO;
import Models.Employee;
import Models.ImportOrder;
import Models.ImportOrderDetail;
import Models.Product;
import Models.Supplier;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

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
    ArrayList<ImportOrderDetail> detailList = new ArrayList<>();
    Supplier s;
    int importId;
    ImportOrder importOrder;
    long sum = 0;

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
        String status = request.getParameter("status");
        if (status != null) {
            System.out.println("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
            selectedProducts = null;
            detailList.clear();
            s = null;
            sum = 0L;

            response.sendRedirect("ImportOrder");
        } else {
            try {
                request.setAttribute("supplier", s);
                request.setAttribute("suppliers", sd.getAllActivatedSuppliers());
                request.setAttribute("products", pd.getAllProducts());
                request.setAttribute("selectedProducts", detailList);
                request.getRequestDispatcher("ImportStockView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }
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
            s = sd.getSupplierByID(Integer.parseInt(request.getParameter("supplierId")));
            request.setAttribute("supplier", s);
            response.sendRedirect("ImportStock");
        } else if (request.getParameter("productId") != null) {
            int pId = Integer.parseInt(request.getParameter("productId"));
            Product p = pd.getProductByID(pId);
            ImportOrderDetail d = new ImportOrderDetail();

            d.setProduct(p);
            d.setQuantity(Integer.parseInt(request.getParameter("importQuantity")));
            d.setImportPrice(Long.parseLong(request.getParameter("importPrice")));

            boolean isContained = false;

            for (ImportOrderDetail proDet : detailList) {
                if (proDet.getProduct().getProductId() == pId) {
                    isContained = true;
                }
            }

            if (!isContained) {
                detailList.add(d);
            } else {
                String error = "Duplicated Product";
                HttpSession session = request.getSession();
                session.setAttribute("error", error);
            }
            response.sendRedirect("ImportStock");
        } else if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            if ("delete".equals(action)) {
                int pId = Integer.parseInt(request.getParameter("productEditedId"));

                for (ImportOrderDetail proDet : detailList) {
                    if (proDet.getProduct().getProductId() == pId) {
                        detailList.remove(proDet);
                        break;
                    }
                }
            } else if ("save".equals(action)) {
                int pId = Integer.parseInt(request.getParameter("productEditedId"));

                for (ImportOrderDetail proDet : detailList) {
                    if (proDet.getProduct().getProductId() == pId) {
                        proDet.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                        proDet.setImportPrice(Long.parseLong(request.getParameter("price")));
                        break;
                    }
                }
            }

            response.sendRedirect("ImportStock");
        } else if (s != null && !detailList.isEmpty()) {
            for (ImportOrderDetail proDet : detailList) {
                sum += proDet.getQuantity() * proDet.getImportPrice();
            }

            io = new ImportOrder(4, s.getSupplierId(), sum);
            HttpSession sess = request.getSession();
            Employee e = (Employee) sess.getAttribute("employee");
            io.setEmployeeId(e.getEmployeeId());
            int impId = ioD.createImportOrder(io);
            for (ImportOrderDetail proDet : detailList) {
                proDet.setIoid(impId);
                iodD.createImportOrderDetail(proDet);
            }
            ioD.importStock(impId);

            response.sendRedirect("ImportOrder?id=" + impId);
        } else {
            String error = "Please select full";
            HttpSession session = request.getSession();
            session.setAttribute("error", error);
            response.sendRedirect("ImportStock");
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
