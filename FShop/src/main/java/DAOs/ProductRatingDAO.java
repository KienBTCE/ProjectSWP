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
    String querry = "select * from ProductRatings where ProductID =?";
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
                    rs.getBoolean("isRead"));
            list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    return list;
    }

}
