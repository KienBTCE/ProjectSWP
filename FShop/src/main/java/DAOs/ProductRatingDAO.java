/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.ProductRating;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class ProductRatingDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public List<ProductRating> getAllProductRating(int productID) {
        List<ProductRating> list = new ArrayList<>();
        String query = "SELECT P.* ,C.FullName FROM ProductRatings AS P\n"
                + "JOIN Customers AS C ON C.CustomerID = P.CustomerID \n"
                + "WHERE ProductID = ?  ORDER BY P.CreatedDate DESC";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, productID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                ProductRating p = new ProductRating(
                        rs.getInt("RateID"),
                        rs.getInt("CustomerID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getDate("CreatedDate"),
                        rs.getInt("Star"),
                        rs.getString("Comment"),
                        rs.getBoolean("isDeleted"),
                        rs.getBoolean("isRead"),
                        rs.getString("FullName")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public float getStarAverage(int productId){
    float  star = 0 ;
     String query = "SELECT SUM(Star)/COUNT(Star) AS avs FROM ProductRatings as p  where p.ProductID =?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, productId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
            star =rs.getFloat("avs");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    return star;
    }

    public ProductRating getProductRating(int rateID) {
        ProductRating pro = new ProductRating();
        String query = "select * from ProductRatings WHERE RateID =?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, rateID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {

                pro.setRateID(rs.getInt("RateID"));
                pro.setCustomerID(rs.getInt("CustomerID"));
                pro.setProductID(rs.getInt("ProductID"));
                pro.setOrderID(rs.getInt("OrderID"));
                pro.setCreatedDate(rs.getDate("CreatedDate"));
                pro.setStar(rs.getInt("Star"));
                pro.setComment(rs.getString("Comment"));
                pro.setIsDeleted(rs.getBoolean("isDeleted"));
                pro.setIsRead(rs.getBoolean("isRead"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(pro.getProductID());
        return pro;
    }

    public List<ProductRating> getNewFeedback() {
        List<ProductRating> list = new ArrayList<>();
        String query = "SELECT P.* ,C.FullName FROM ProductRatings AS P JOIN Customers AS C ON C.CustomerID = P.CustomerID  ORDER BY P.CreatedDate DESC";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                ProductRating p = new ProductRating(
                        rs.getInt("RateID"),
                        rs.getInt("CustomerID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getDate("CreatedDate"),
                        rs.getInt("Star"),
                        rs.getString("Comment"),
                        rs.getBoolean("isDeleted"),
                        rs.getBoolean("isRead"),
                        rs.getString("FullName")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStatusComment(int rateID, int status) {
        String query = "Update ProductRatings SET IsDeleted = ? WHERE RateID =?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, status);
            pre.setInt(2, rateID);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateisReadComment(int rateID) {
        String query = "Update ProductRatings SET IsRead = 1  WHERE RateID =?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, rateID);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addProductRating(int customerId, int productId, int star, String comment) {
        String query = "INSERT INTO ProductRatings (CustomerID, ProductID, CreatedDate, Star, Comment, isDeleted, isRead) VALUES (?, ?, GETDATE(), ?, ?, 0, 0)";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, customerId);
            pre.setInt(2, productId);
            pre.setInt(3, star);
            pre.setString(4, comment);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getProductID(int rateID) {
        ProductRating pro = new ProductRating();
        String query = "select ProductID from ProductRatings WHERE RateID =?";
        String s = "";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, rateID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                s = rs.getString("ProductID");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(pro.getProductID());
        return s;
    }
}
