package Controllers;

import DAOs.CategoryDAO;
import DAOs.AttributeDAO;
import DAOs.BrandDAO;
import DAOs.ProductDAO;
import Models.Product;
import Models.Attribute;
import Models.AttributeDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class CreateProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String categoryName = request.getParameter("name");

        if (categoryName != null && !categoryName.isEmpty()) {
            CategoryDAO categoryDAO = new CategoryDAO();
            int categoryId = categoryDAO.getCategoryIdByName(categoryName);

            AttributeDAO attributeDAO = new AttributeDAO();
            List<Attribute> attributes = attributeDAO.getAttributesByCategoryID(categoryId);
            request.setAttribute("attributes", attributes);
        }
        request.setAttribute("categoryName", categoryName);
        CategoryDAO categoryDAO = new CategoryDAO();
        List<String> categories = categoryDAO.getAllCategoryNames();
        BrandDAO brandDAO = new BrandDAO();
        List<String> brands = brandDAO.getAllBrandNames();

        request.setAttribute("categories", categories);
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("CreateProductView.jsp").forward(request, response);
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}
