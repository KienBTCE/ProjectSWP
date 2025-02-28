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
    public List<ProductRating> getAllProductRating(String productID){
    List<ProductRating> list = new ArrayList<>();
    String querry = "select pr.RateID, pr.ProductID, pr.OrderID,pr.CustomerID , pr.Star, pr.IsRead,pr.IsDeleted ,pr.CreatedDate, pr.Comment, C.FullName, C.Avatar, RR.Answer,RR.EmployeeID from ProductRatings AS pr\n" +
"join Customers as C on C.CustomerID = pr.CustomerID \n" +
"join RatingReplies as  RR  on RR.RateID = pr.RateID\n" +
"where ProductID = ?";
        try {
            PreparedStatement pre = connector.prepareStatement(querry);
            pre.setString(1, productID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
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
                    rs.getString("FullName"),
                    rs.getString("Avatar"),
                    rs.getString("Answer"),
                    rs.getInt("EmployeeID")
            );
            list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    return list;
    }

}
