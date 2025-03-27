package Controllers;

import DAOs.AttributeDAO;
import DAOs.CategoryDAO;
import DAOs.ProductDAO;
import Models.AttributeDetail;
import Models.Category;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiuth
 */
public class ProductListServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductListServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message"); // Xóa sau khi dùng xong
        }

        ProductDAO pr = new ProductDAO();
        CategoryDAO catDAO = new CategoryDAO();
        ArrayList<Product> products = new ArrayList<>();

        // Lấy danh sách danh mục để hiển thị trong dropdown
        List<Category> categories = catDAO.getAllCategories();
        request.setAttribute("categories", categories);

        // Lấy tham số từ request
        String detailID = request.getParameter("id");
        String deleteID = request.getParameter("delete");
        String restoreID = request.getParameter("restore");
        String keyword = request.getParameter("txt");
        String selectedCategoryID = request.getParameter("categoryId");
        String filterNewImport = request.getParameter("new_import"); // Lọc sản phẩm mới nhập

        // Xử lý xóa sản phẩm
        if (deleteID != null) {
            int id = Integer.parseInt(deleteID);
            Product product = pr.getProductByID(id);
            pr.deleteProduct(id);
            if (product != null) {
                session.setAttribute("message", product.getFullName() + " has been deleted from website");
            } else {
                session.setAttribute("message", "Product not found");
            }
            response.sendRedirect("ProductListServlet");
            return;
        }

        // Xử lý khôi phục sản phẩm
        if (restoreID != null) {
            int id = Integer.parseInt(restoreID);
            Product product = pr.getProductByID(id);
            pr.restoreProduct(id);
            if (product != null) {
                session.setAttribute("message", product.getFullName() + " has been activated on website");
            } else {
                session.setAttribute("message", "Product not found");
            }
            response.sendRedirect("ProductListServlet");
            return;
        }

        // Xử lý xem chi tiết sản phẩm
        if (detailID != null) {
            int id = Integer.parseInt(detailID);
            Product product = pr.getProductByID(id);
            AttributeDAO ad = new AttributeDAO();
            List<AttributeDetail> attributes = ad.getAttributesByProductID(id);
            product.setAttributeDetails(attributes);
            request.setAttribute("product", product);
            request.getRequestDispatcher("ProductDetailManagerView.jsp").forward(request, response);
            return;
        }

        // Xử lý lọc sản phẩm theo danh mục
        if (selectedCategoryID != null && !selectedCategoryID.isEmpty()) {
            try {
                int categoryID = Integer.parseInt(selectedCategoryID);
                products = (ArrayList<Product>) pr.getProductsByCategory(categoryID);
                System.out.println("Số sản phẩm tìm thấy theo danh mục: " + products.size());
            } catch (NumberFormatException e) {
                System.out.println("Lỗi: categoryID không hợp lệ - " + selectedCategoryID);
            }
        } else if (keyword != null && !keyword.trim().isEmpty()) {
            // Tìm kiếm theo tên sản phẩm
            products = (ArrayList<Product>) pr.searchProductByName(keyword);
        } else {
            // Nếu không có bộ lọc nào, lấy toàn bộ danh sách sản phẩm
            products = pr.getProductList();
        }
// Xử lý lọc sản phẩm mới nhập
        if ("true".equals(filterNewImport)) {
            products = (ArrayList<Product>) pr.getNewImportedProducts();
            System.out.println("Số sản phẩm mới nhập: " + products.size());
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("ManageProductView.jsp").forward(request, response);

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
