/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CartDAO;
import DAOs.ProductDAO;
import DAOs.ProductRatingDAO;
import Models.Customer;
import Models.Product;
import Models.ProductRating;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author KienBTCE180180
 */
public class ViewProductServlet extends HttpServlet {

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
        /* Don't delete this LOC */
        CartDAO c = new CartDAO();
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("customer");
        if (cus != null) {
            session.setAttribute("numOfProCartOfCus", c.getNumberOfProduct(cus.getId()));
        }
        /* Don't delete this LOC */

        ProductDAO pd = new ProductDAO();
        ArrayList<Product> products = null;
//        Set<Product> filterProducts = new HashSet<>();

        String pathInfo = request.getRequestURI();
        if (pathInfo != null && pathInfo.contains("Laptop")) {

            products = pd.getAllProductsByCategory("Laptop");
            ArrayList<String> filters = new ArrayList<>();
            ArrayList<String> filtersInput = new ArrayList<>();
            boolean isFilter = false;
            Iterator<Product> iterator = products.iterator();

            String brand = request.getParameter("brand");
            if (brand != null) {
                String[] brandFilters = brand.split(",");

                for (String brandFilter : brandFilters) {
//                    if (brandFilters.length == 1) {
//                        filtersInput.add("Name IN ('" + brandFilters[i].trim() + "')");
//                    } else if (i == 0) {
//                        filtersInput.add("Name IN ('" + brandFilters[i].trim() + "', ");
//                    } else if (i == brandFilters.length - 1) {
//                        filtersInput.add("'" + brandFilters[i].trim() + "')");
//                    } else {
//                        filtersInput.add("'" + brandFilters[i].trim() + "', ");
//                    }
                    filters.add(brandFilter.trim());
                }

                while (iterator.hasNext()) {
                    Product p = iterator.next();

                    boolean found = false;
                    for (String b : brandFilters) {
                        if (b.equalsIgnoreCase(p.getBrandName())) {
                            found = true;
                            break; // Dừng kiểm tra nếu tìm thấy sản phẩm hợp lệ
                        }
                    }

                    if (!found) {
                        iterator.remove(); // Xóa sản phẩm không thuộc brandFilters
                    }
                }
            }

            String price = request.getParameter("price");
            if (price != null) {
                ArrayList<String> priceFilters = new ArrayList<>();

                for (String string : price.split(",")) {
                    switch (string.trim()) {
                        case "20-25":
                            priceFilters.add("20000000;25000000");
                            break;
                        case "25-30":
                            priceFilters.add("25000000;30000000");
                            break;
                        case "30-over":
                            priceFilters.add("30000000");
                            break;
                        default:
                            break;
                    }
                    filters.add(string.trim());
                }

                while (iterator.hasNext()) {
                    Product p = iterator.next();
                    boolean found = false;

                    for (String range : priceFilters) {
                        String[] splitRange = range.split(";");
                        long minPrice = Long.parseLong(splitRange[0]);
                        long maxPrice = (splitRange.length == 2) ? Long.parseLong(splitRange[1]) : Long.MAX_VALUE;

                        if (p.getPrice() >= minPrice && p.getPrice() <= maxPrice) {
                            found = true;
                            break;
                        }
                    }

                    if (!found) {
                        iterator.remove();
                    }
                }

            }

            if (!filtersInput.isEmpty() || !filters.isEmpty()) {
//                products = pd.findProductsByFilter(filtersInput, "Laptop");
                isFilter = true;
            }
            if (!isFilter) {
                products = pd.getAllProductsByCategory("Laptop");
            }

            try {
                int numberRow = 0;
                if (products != null) {
                    numberRow = products.size() / 4;
                    if (products.size() % 4 != 0) {
                        numberRow++;
                    }
                }

                ProductRatingDAO prDAO = new ProductRatingDAO();
                ArrayList<ProductRating> stars = new ArrayList<>();
                for (Product p : products) {
                    ProductRating star = prDAO.getStarAVG(p.getProductId());
                    System.out.println("STAR LAPTOP: ________________________________________________________");
                    System.out.println(star);

                    stars.add(star);

                }
                Map<Object, Object> dataMap = new HashMap<>();
                dataMap.put("stars", stars);
                dataMap.put("products", products);

                ArrayList<String> brands = pd.getAllBrandByCategory("Laptop");
                request.setAttribute("dataMap", dataMap);
                request.setAttribute("products", products);
                request.setAttribute("brands", brands);
                request.setAttribute("numberRow", numberRow);
//            request.setAttribute("uri", request.getServletPath().substring(1));
                request.setAttribute("filters", filters);
                request.getRequestDispatcher("LaptopListView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }

        } else if (pathInfo != null && pathInfo.contains("Smartphone")) {
            ArrayList<String> filters = new ArrayList<>();
            ArrayList<String> filtersInput = new ArrayList<>();
            boolean isFilter = false;

            String brand = request.getParameter("brand");
            if (brand != null) {
                String[] brandFilters = brand.split(",");

                for (int i = 0; i < brandFilters.length; i++) {
                    if (brandFilters.length == 1) {
                        filtersInput.add("Name IN ('" + brandFilters[i].trim() + "')");
                    } else if (i == 0) {
                        filtersInput.add("Name IN ('" + brandFilters[i].trim() + "', ");
                    } else if (i == brandFilters.length - 1) {
                        filtersInput.add("'" + brandFilters[i].trim() + "')");
                    } else {
                        filtersInput.add("'" + brandFilters[i].trim() + "', ");
                    }
                    filters.add(brandFilters[i].trim());
                }

            }

            String price = request.getParameter("price");
            if (price != null) {
                ArrayList<String> priceFilters = new ArrayList<>();

                for (String string : price.split(",")) {
                    switch (string.trim()) {
                        case "20-25":
                            priceFilters.add("BETWEEN 20000000 AND 25000000");
                            break;
                        case "25-30":
                            priceFilters.add("BETWEEN 25000000 AND 30000000");
                            break;
                        case "30-over":
                            priceFilters.add("> 30000000");
                            break;
                        default:
                            priceFilters.add("BETWEEN 0 AND 1000000000");
                            break;
                    }
                    filters.add(string.trim());
                }

                for (int i = 0; i < priceFilters.size(); i++) {
                    if (priceFilters.size() == 1) {
                        filtersInput.add(" AND price " + priceFilters.get(i).trim());
                    } else if (i == 0) {
                        filtersInput.add(" AND (price " + priceFilters.get(i).trim());
                    } else if (i == priceFilters.size() - 1) {
                        filtersInput.add(" OR price " + priceFilters.get(i).trim() + ")");
                    } else {
                        filtersInput.add(" OR price " + priceFilters.get(i).trim());
                    }
                }
            }

            if (!filtersInput.isEmpty()) {
                products = pd.findProductsByFilter(filtersInput, "Smartphone");
                isFilter = true;
            }
            if (!isFilter) {
                products = pd.getAllProductsByCategory("Smartphone");
            }

            try {
                int numberRow = 0;
                if (products != null) {
                    numberRow = products.size() / 4;
                    if (products.size() % 4 != 0) {
                        numberRow++;
                    }
                }


              ProductRatingDAO prDAO = new ProductRatingDAO();
                ArrayList<ProductRating> stars = new ArrayList<>();
            for (Product p : products) {
               ProductRating star = prDAO.getStarAVG(p.getProductId());
                System.out.println(star);
                
                stars.add(star);

            }
              

                ArrayList<String> brands = pd.getAllBrandByCategory("Smartphone");
               Map<Object, Object> dataMap = new HashMap<>();
                dataMap.put("stars", stars);
                dataMap.put("products", products);

                request.setAttribute("dataMap", dataMap);
                request.setAttribute("products", products);
                request.setAttribute("brands", brands);
                request.setAttribute("numberRow", numberRow);
//            request.setAttribute("uri", request.getServletPath().substring(1));
                request.setAttribute("filters", filters);
                request.getRequestDispatcher("PhoneListView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }
        } else if (pathInfo != null && pathInfo.contains("Accessory")) {
            ArrayList<String> filters = new ArrayList<>();
            ArrayList<String> filtersInput = new ArrayList<>();
            boolean isFilter = false;

            String brand = request.getParameter("brand");
            if (brand != null) {
                String[] brandFilters = brand.split(",");

                for (int i = 0; i < brandFilters.length; i++) {
                    if (brandFilters.length == 1) {
                        filtersInput.add("Name IN ('" + brandFilters[i].trim() + "')");
                    } else if (i == 0) {
                        filtersInput.add("Name IN ('" + brandFilters[i].trim() + "', ");
                    } else if (i == brandFilters.length - 1) {
                        filtersInput.add("'" + brandFilters[i].trim() + "')");
                    } else {
                        filtersInput.add("'" + brandFilters[i].trim() + "', ");
                    }
                    filters.add(brandFilters[i].trim());
                }

            }

            String price = request.getParameter("price");
            if (price != null) {
                ArrayList<String> priceFilters = new ArrayList<>();

                for (String string : price.split(",")) {
                    switch (string.trim()) {
                        case "20-25":
                            priceFilters.add("BETWEEN 20000000 AND 25000000");
                            break;
                        case "25-30":
                            priceFilters.add("BETWEEN 25000000 AND 30000000");
                            break;
                        case "30-over":
                            priceFilters.add("> 30000000");
                            break;
                        default:
                            priceFilters.add("BETWEEN 0 AND 1000000000");
                            break;
                    }
                    filters.add(string.trim());
                }

                for (int i = 0; i < priceFilters.size(); i++) {
                    if (priceFilters.size() == 1) {
                        filtersInput.add(" AND price " + priceFilters.get(i).trim());
                    } else if (i == 0) {
                        filtersInput.add(" AND (price " + priceFilters.get(i).trim());
                    } else if (i == priceFilters.size() - 1) {
                        filtersInput.add(" OR price " + priceFilters.get(i).trim() + ")");
                    } else {
                        filtersInput.add(" OR price " + priceFilters.get(i).trim());
                    }
                }
            }

            if (!filtersInput.isEmpty()) {
                products = pd.findProductsByFilter(filtersInput, "Accessory");
                isFilter = true;
            }
            if (!isFilter) {
                products = pd.getAllProductsByCategory("Accessory");
            }

            try {
                int numberRow = 0;
                if (products != null) {
                    numberRow = products.size() / 4;
                    if (products.size() % 4 != 0) {
                        numberRow++;
                    }
                }

                ArrayList<String> brands = pd.getAllBrandByCategory("Accessory");
                request.setAttribute("products", products);
                request.setAttribute("brands", brands);
                request.setAttribute("numberRow", numberRow);
//            request.setAttribute("uri", request.getServletPath().substring(1));
                request.setAttribute("filters", filters);
                request.getRequestDispatcher("AccessoryListView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }
        } else {
            products = pd.getAllProducts();
            ProductRatingDAO prDAO = new ProductRatingDAO();
            ArrayList<ProductRating> stars = new ArrayList<>();
            for (Product p : products) {
                ProductRating star = prDAO.getStarAVG(p.getProductId());
                System.out.println(star);

                stars.add(star);

            }
            try {
                Map<Object, Object> dataMap = new HashMap<>();
                dataMap.put("stars", stars);
                dataMap.put("products", products);
                request.setAttribute("dataMap", dataMap);
                request.setAttribute("products", products);
                request.getRequestDispatcher("HomeView.jsp").forward(request, response);
            } catch (NullPointerException e) {
                System.out.println(e);
            }
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
        processRequest(request, response);
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
