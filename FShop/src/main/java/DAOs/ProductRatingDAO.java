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
<<<<<<< HEAD

=======
>>>>>>> 3d93b6c (fig bug on crud order create view feedback.)
    public List<ProductRating> getAllProductRating(int productID) {
        List<ProductRating> list = new ArrayList<>();
        String query = "SELECT P.* ,C.FullName FROM ProductRatings AS P\n" +
"JOIN Customers AS C ON C.CustomerID = P.CustomerID \n" +
"WHERE ProductID = ? AND P.isDeleted = 0 ORDER BY P.CreatedDate DESC";
<<<<<<< HEAD

=======
>>>>>>> 3d93b6c (fig bug on crud order create view feedback.)
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

}
