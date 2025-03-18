package Controllers;

import DAOs.CategoryDAO;
import DAOs.AttributeDAO;
import DAOs.BrandDAO;
import DAOs.ProductDAO;
import Models.Product;
import Models.Attribute;
import Models.AttributeDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
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
        List<String> brands = brandDAO.getAllBrandName();

        request.setAttribute("categories", categories);
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("CreateProductView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        String categoryName = request.getParameter("categoryName");
        String brandName = request.getParameter("brandName");
        String model = request.getParameter("model");
        String fullName = request.getParameter("fullName");
        String description = request.getParameter("description");
        Long price = Long.parseLong(request.getParameter("price"));
        String image1 = processImageUpload(request, "txtP1");
        String image2 = processImageUpload(request, "txtP2");
        String image3 = processImageUpload(request, "txtP3");
        String image4 = processImageUpload(request, "txtP4");
        int isDeleted = Integer.parseInt(request.getParameter("isDeleted"));

        Product product = new Product(categoryName, brandName, model, fullName, description, isDeleted, price, image1, image2, image3, image4);
        int productId = productDAO.createProduct(product); 
        if (productId > 0) {
            String[] attributeIdList = request.getParameterValues("attributeId");
            for (String attributeId : attributeIdList) {
                int attrId = Integer.parseInt(attributeId);
                String attributeInfor = request.getParameter("attributeInfor_" + attrId);
                AttributeDetail attributeDetail = new AttributeDetail(attrId, productId, attributeInfor, null);
                productDAO.addAttributeDetail(attributeDetail);
            }
            response.sendRedirect("ProductListServlet?success=Product created successfully");
        } else {
            request.setAttribute("errorMsg", "Product creation failed");
            request.getRequestDispatcher("CreateProductView.jsp").forward(request, response);
        }

    }

    private String processImageUpload(HttpServletRequest request, String imageName) throws IOException, ServletException {
        Part imagePart = request.getPart(imageName);
        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("/") + "assets/imgs/Products";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            imagePart.write(uploadPath + File.separator + fileName);
            return fileName;
        }
        return null;
    }
}
