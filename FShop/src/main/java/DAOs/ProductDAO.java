/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Attributes.Name;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KienBTCE180180
 */
public class ProductDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> list = new ArrayList<>();

        String query = "SELECT * FROM Products WHERE IsDeleted = 0";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Model"),
                        rs.getString("FullName"),
                        rs.getString("Description"),
                        rs.getInt("IsDeleted"),
                        rs.getLong("Price"),
                        rs.getString("Image"),
                        rs.getInt("Quantity"),
                        rs.getInt("Stock")
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public ArrayList<Product> getAllProductsByCategory(String category) {
        ArrayList<Product> list = new ArrayList<>();

        String query = "SELECT * FROM Products P JOIN Categories C ON P.CategoryID = C.CategoryID WHERE C.Name = ? AND P.IsDeleted = 0";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setString(1, category);
            System.out.println(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Model"),
                        rs.getString("FullName"),
                        rs.getString("Description"),
                        rs.getInt("IsDeleted"),
                        rs.getLong("Price"),
                        rs.getString("Image"),
                        rs.getInt("Quantity"),
                        rs.getInt("Stock")
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public ArrayList<Product> findProductsByFilter(ArrayList<String> filters, String category) {
        ArrayList<Product> list = null;

        String query = "SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID WHERE B.Name IN (SELECT Name FROM Brands WHERE ";

        for (String filter : filters) {
            query += filter;
        }

        query += ") AND P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = ?) AND P.IsDeleted = 0";

//        System.out.println("QUERY " + query);
        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Model"),
                        rs.getString("FullName"),
                        rs.getString("Description"),
                        rs.getInt("IsDeleted"),
                        rs.getLong("Price"),
                        rs.getString("Image"),
                        rs.getInt("Quantity"),
                        rs.getInt("Stock")
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public ArrayList<String> getAllBrandByCategory(String category) {
        ArrayList<String> list = null;

        String query = "SELECT DISTINCT B.[Name] FROM Brands B JOIN Products P ON B.BrandID = P.BrandID WHERE P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = ?)  AND P.IsDeleted = 0";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                list.add(rs.getString("Name"));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    //Lay danh sach san pham - shop manager
    public ArrayList<Product> getProductList() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "SELECT sp.ProductID, c.Name AS CategoryName, b.Name AS BrandName, "
                + "sp.FullName, sp.Price, sp.Stock, sp.isDeleted "
                + "FROM Products sp "
                + "JOIN Categories c ON sp.CategoryID = c.CategoryID "
                + "JOIN Brands b ON sp.BrandID = b.BrandID";

        try ( PreparedStatement ps = connector.prepareStatement(query);  ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("CategoryName"),
                        rs.getString("BrandName"),
                        rs.getString("FullName"),
                        rs.getLong("Price"),
                        rs.getInt("Stock"),
                        rs.getInt("isDeleted") // Tránh lỗi nếu DB lưu isDeleted dưới dạng INT
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //Thong tin chi tiet cua san pham - shop manager
    public Product getProductByID(int productId) {
        Product s = null;

        String query = "SELECT sp.ProductID, c.Name AS CategoryName, b.Name AS BrandName, "
                + "sp.FullName, sp.Price, sp.Image, sp.Stock, sp.isDeleted, sp.Description, sp.Model "
                + "FROM Products sp "
                + "JOIN Categories c ON sp.CategoryID = c.CategoryID "
                + "JOIN Brands b ON sp.BrandID = b.BrandID "
                + "WHERE sp.ProductID = ?";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                s = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("CategoryName"),
                        rs.getString("BrandName"),
                        rs.getString("Model"),
                        rs.getString("FullName"),
                        rs.getString("Description"),
                        rs.getInt("isDeleted"),
                        rs.getLong("Price"),
                        rs.getString("Image"),
                        rs.getInt("Stock")
                );
            }
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return s;
    }

    //delete product - shop manager
    public int deleteProduct(int productId) {
        int count = 0;
        try {
            String sql = "UPDATE Products SET isDeleted = 1 WHERE ProductID = ?";
            PreparedStatement pst = connector.prepareStatement(sql);
            pst.setInt(1, productId);
            count = pst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    //restore product - shop manager
    public int restoreProduct(int productId) {
        int count = 0;
        try {
            String sql = "UPDATE Products SET isDeleted = 0 WHERE ProductID = ?";
            PreparedStatement pst = connector.prepareStatement(sql);
            pst.setInt(1, productId);
            count = pst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int createProduct(Product p) {
        int count = 0;
        String query = "INSERT INTO Products (Model, FullName, IsDeleted, Price, Stock, BrandID, CategoryID) "
                + "VALUES (?, ?, 1, ?, ?, "
                + "(SELECT BrandID FROM Brands WHERE Name = ?), "
                + "(SELECT CategoryID FROM Categories WHERE Name = ?))";

        try {
            PreparedStatement ps = connector.prepareStatement(query);

            ps.setString(1, p.getModel());
            ps.setString(2, p.getFullName());
//            ps.setInt(3, p.getDeleted());
            ps.setLong(3, p.getPrice());
            ps.setInt(4, p.getStock());
            ps.setString(5, p.getBrandName());
            ps.setString(6, p.getCategoryName());

            count = ps.executeUpdate();
        } catch (SQLException ex) { // In lỗi ra console
            // In lỗi ra console
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    //update product - shop manager
    public int updateProduct(Product p) {
        String query = "UPDATE Products SET FullName=?, Description=?, Price=?, Image=?, IsDeleted=? WHERE ProductID=?";

        try ( PreparedStatement ps = connector.prepareStatement(query)) {
            ps.setString(1, p.getFullName());
            ps.setString(2, p.getDescription());
            ps.setLong(3, p.getPrice());
            ps.setString(4, p.getImage());
            ps.setInt(5, p.getDeleted());
            ps.setInt(6, p.getProductId());

            return ps.executeUpdate(); // Trả về số dòng bị ảnh hưởng
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> searchProductByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT sp.ProductID, c.Name AS CategoryName, b.Name AS BrandName, "
                + "sp.FullName, sp.Price, sp.Image, sp.Stock, sp.isDeleted, sp.Description, sp.Model "
                + "FROM Products sp "
                + "JOIN Categories c ON sp.CategoryID = c.CategoryID "
                + "JOIN Brands b ON sp.BrandID = b.BrandID "
                + "WHERE sp.FullName LIKE ?";

        try ( PreparedStatement ps = connector.prepareStatement(query)) {
            ps.setString(1, "%" + keyword + "%");

            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Product(
                            rs.getInt("ProductID"),
                            rs.getString("CategoryName"),
                            rs.getString("BrandName"),
                            rs.getString("FullName"),
                            rs.getLong("Price"),
                            rs.getInt("Stock"),
                            rs.getInt("isDeleted")
                    ));
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
}
