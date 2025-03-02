/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.Product;
import DAOs.ProductDAO;
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
            
            Product currentProduct = productDAO.getProductByID(id);  // Get the current product info from DB
            String photoPath = currentProduct.getImage();  // Default to current image path
            // Step 3: Handle file upload (if a new image is uploaded)
            Part part = request.getPart("txtPPic");

            if (part != null && part.getSize() > 0) {  // Check if a new file was uploaded
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();  // Get the new file name

                // Define the directory where the image will be saved
                String realPath = request.getServletContext().getRealPath("/");

                // Step 4: Create the directory if it does not exist
                Path imgDir = Paths.get(realPath);
                if (!Files.exists(imgDir)) {
                    Files.createDirectory(imgDir);  // Create the /img directory if it doesn't exist
                }

                // Save the new image to the directory
                String fileSavePath = realPath + "/" + fileName;
                part.write(fileSavePath);  // Save the file

                // Update the relative path to be stored in the database
                photoPath = "/" + fileName;
            }

            Product product = new Product(id, fullName, description, isDeleted, price, photoPath);

            int check = productDAO.updateProduct(product);
            if (check > 0) {
                response.sendRedirect("ProductListServlet?id=" + product.getProductId());
            } else {
                request.getSession().setAttribute("error", "Update failed. Please try again.");
                response.sendRedirect("UpdateProductServlet?id=" + product.getProductId());
            }
        } catch (Exception e) {
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
