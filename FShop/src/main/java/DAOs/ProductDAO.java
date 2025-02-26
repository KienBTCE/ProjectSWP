/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Product;
import Models.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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

        String query = "SELECT * FROM Products";

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
                        rs.getBoolean("IsDeleted"),
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

    public ArrayList<Product> getAllLaptops() {
        ArrayList<Product> list = new ArrayList<>();

        String query = "SELECT * FROM Products P JOIN Categories C ON P.CategoryID = C.CategoryID WHERE C.Name = 'Laptop'";

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
                        rs.getBoolean("IsDeleted"),
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

    public ArrayList<Product> findProductsByFilter(ArrayList<String> filters) {
        ArrayList<Product> list = null;

        String query = "SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID WHERE B.Name IN (SELECT Name FROM Brands WHERE ";

        for (String filter : filters) {
            query += filter;
        }

        query += ") AND P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')";

        System.out.println("QUERY " + query);

        try ( PreparedStatement ps = connector.prepareStatement(query)) {
            try ( ResultSet rs = ps.executeQuery()) {
                list = new ArrayList<>();
                while (rs.next()) {
                    list.add(new Product(
                            rs.getInt("ProductID"),
                            rs.getInt("BrandID"),
                            rs.getInt("CategoryID"),
                            rs.getString("Model"),
                            rs.getString("FullName"),
                            rs.getString("Description"),
                            rs.getBoolean("IsDeleted"),
                            rs.getLong("Price"),
                            rs.getString("Image"),
                            rs.getInt("Quantity"),
                            rs.getInt("Stock")
                    ));
                }
                return list;
            } catch (Exception e) {
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public ArrayList<String> getAllBrandLaptop() {
        ArrayList<String> list = null;

        String query = "SELECT DISTINCT B.[Name] FROM Brands B JOIN Products P ON B.BrandID = P.BrandID WHERE P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')";

        try ( PreparedStatement ps = connector.prepareStatement(query)) {
            try ( ResultSet rs = ps.executeQuery()) {
                list = new ArrayList<>();
                while (rs.next()) {
                    list.add(rs.getString("Name"));
                }
                return list;
            } catch (Exception e) {
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    //Lay danh sach san pham - shop manager
    public ArrayList<Product> getProductList() {
        ArrayList<Product> list = new ArrayList<>();

        String query = "SELECT sp.ProductID, c.Name AS CategoryName, b.Name AS BrandName, "
                + "sp.FullName, sp.Price, sp.Quantity, sp.isDeleted "
                + "FROM Products sp "
                + "JOIN Categories c ON sp.CategoryID = c.CategoryID "
                + "JOIN Brands b ON sp.BrandID = b.BrandID";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("CategoryName"),
                        rs.getString("BrandName"),
                        rs.getString("FullName"),
                        rs.getLong("Price"),
                        rs.getInt("Quantity"),
                        rs.getBoolean("isDeleted")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Doi trang thai button - shop manager
    public void toggleStatus(int customerID) {
        try (
                 PreparedStatement ps = connector.prepareStatement("UPDATE Products SET isDeleted = 1 - isDeleted WHERE ProductID = ?")) {
            ps.setInt(1, customerID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //Thong tin chi tiet cua san pham - shop manager
    public Product getProductByID(int productId) {
        Product s = null;

        String query = "SELECT sp.ProductID, c.Name AS CategoryName, b.Name AS BrandName, "
                + "sp.FullName, sp.Price, sp.Quantity, sp.isDeleted "
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
                        rs.getString("FullName"),
                        rs.getLong("Price"),
                        rs.getInt("Quantity"),
                        rs.getBoolean("isDeleted")
                );
            }
            return s;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return s;
    }
    // Xóa mềm sản phẩm - Shop Manager

    public int deleteProduct(int productId) {
        int count = 0;
        try {
            String sql = "UPDATE Products SET isDeleted = 1 WHERE ProductID = ?";
            PreparedStatement pst = connector.prepareStatement(sql);
            pst.setInt(1, productId);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int restoreProduct(int productId) {
        int count = 0;
        try {
            String sql = "UPDATE Products SET isDeleted = 0 WHERE ProductID = ?";
            PreparedStatement pst = connector.prepareStatement(sql);
            pst.setInt(1, productId);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}
