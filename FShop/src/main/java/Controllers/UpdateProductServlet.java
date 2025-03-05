/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AttributeDAO;
import DAOs.CategoryDAO;
import Models.Product;
import DAOs.ProductDAO;
import Models.AttributeDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiuth
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UpdateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
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
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductByID(productId);

            if (product != null) {
                // Lấy danh sách category từ DB thông qua CategoryDAO
                CategoryDAO categoryDAO = new CategoryDAO();
                List<String> categories = categoryDAO.getAllCategoryNames();
                request.setAttribute("categories", categories);

                // Lấy danh sách attribute details từ DB thông qua AttributeDAO
                AttributeDAO attributeDAO = new AttributeDAO();
                List<AttributeDetail> attributeDetails = attributeDAO.getAttributesByProductID(productId);
                product.setAttributeDetails(attributeDetails);

                request.setAttribute("product", product);
                request.getRequestDispatcher("UpdateProductView.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("error", "Product not found.");
                response.sendRedirect("ProductListServlet");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Invalid product ID.");
            response.sendRedirect("ProductListServlet");
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
        try {
            ProductDAO productDAO = new ProductDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            String fullName = request.getParameter("fullName");
            String description = request.getParameter("description");
            long price = Long.parseLong(request.getParameter("price"));
            int isDeleted = Integer.parseInt(request.getParameter("isDeleted"));
            String categoryName = request.getParameter("categoryName");

            // Lấy thông tin sản phẩm hiện tại từ DB
            Product currentProduct = productDAO.getProductByID(id);
            if (currentProduct == null) {
                request.getSession().setAttribute("error", "Product not found.");
                response.sendRedirect("ProductListServlet");
                return;
            }

            // Sử dụng ảnh hiện tại nếu không cập nhật ảnh mới
            String photoPath = currentProduct.getImage();

            // Xử lý upload file nếu có ảnh mới được chọn
            Part part = request.getPart("txtPPic");
            if (part != null && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String realPath = request.getServletContext().getRealPath("/");
                Path imgDir = Paths.get(realPath, "assets", "imgs", "Products");
                if (!Files.exists(imgDir)) {
                    Files.createDirectories(imgDir);
                }
                String fileSavePath = imgDir.toString() + File.separator + fileName;
                part.write(fileSavePath);
                photoPath = fileName;
            }

            // Tạo đối tượng Product mới để update, dùng các giá trị từ form và currentProduct cho các trường không có trong form
            Product product = new Product();
            product.setProductId(id);
            product.setFullName(fullName);
            product.setDescription(description);
            product.setPrice(price);
            product.setDeleted(isDeleted);
            product.setImage(photoPath);
            product.setCategoryName(categoryName);
            // Lấy model và brandName từ sản phẩm hiện có vì form không cập nhật chúng
            product.setModel(currentProduct.getModel());
            product.setBrandName(currentProduct.getBrandName());

            // Xây dựng danh sách attribute details từ form
            String[] attributeIds = request.getParameterValues("attributeId");
            if (attributeIds != null) {
                List<AttributeDetail> attributeDetails = new ArrayList<>();
                for (String attrIdStr : attributeIds) {
                    int attrId = Integer.parseInt(attrIdStr);
                    // Các input được đặt tên theo định dạng "attributeInfor_${attrId}"
                    String attributeInfor = request.getParameter("attributeInfor_" + attrId);
                    // attributeName không cần update (hoặc có thể lấy lại từ DB nếu cần)
                    AttributeDetail detail = new AttributeDetail(attrId, id, attributeInfor, null);
                    attributeDetails.add(detail);
                }
                product.setAttributeDetails(attributeDetails);
            }

            // Gọi phương thức updateProduct đã được tích hợp cập nhật cả sản phẩm và attribute details (sử dụng transaction)
            int check = productDAO.updateProduct(product);
            if (check > 0) {
                response.sendRedirect("ProductListServlet?id=" + product.getProductId());
            } else {
                request.getSession().setAttribute("error", "Update failed. Please try again.");
                response.sendRedirect("UpdateProductServlet?id=" + product.getProductId());
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi để debug
            request.getSession().setAttribute("error", "An unexpected error occurred.");
            response.sendRedirect("UpdateProductServlet?id=" + request.getParameter("id"));
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
