/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.RatingReplies;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class RatingRepliesDAO{
      DBContext db = new DBContext();
    Connection connector = db.getConnection();
    
    public  List<RatingReplies> GetAllRepliesByID(int productID){
    List<RatingReplies> list = new ArrayList<>();
    String query = "select * from RatingReplies as rr where rr.RateID = ?";
        try {
             PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, productID);
            ResultSet rs = pre.executeQuery();
            
            while(rs.next()){
                RatingReplies rr = new RatingReplies(
                        rs.getInt("ReplyID"),
                        rs.getInt("EmployeeID"),
                        rs.getInt("RateID"),
                        rs.getString("Answer"),
                        rs.getBoolean("IsRead"));
                list.add(rr);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    return list;
    
    }
}
