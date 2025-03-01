/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.RatingReplies;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */

public class RatingRepliesDAO {
     DBContext db = new DBContext();
    Connection connector = db.getConnection();
    public List<RatingReplies> getAllRatingRepliesByProduct(int productId) {
        List<RatingReplies> list = new ArrayList<>();
        String query = "SELECT rr.* FROM RatingReplies rr JOIN ProductRatings pr ON rr.RateID = pr.RateID WHERE pr.ProductID = ?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, productId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                RatingReplies rr = new RatingReplies(
                        rs.getInt("ReplyID"),
                        rs.getInt("EmployeeID"),
                        rs.getInt("RateID"),
                        rs.getString("Answer"),
                        rs.getBoolean("IsRead")
                );
                list.add(rr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addRatingReply(int employeeId, int rateId, String answer) {
        String query = "INSERT INTO RatingReplies (EmployeeID, RateID, Answer, IsRead) VALUES (?, ?, ?, 0)";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, employeeId);
            pre.setInt(2, rateId);
            pre.setString(3, answer);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
