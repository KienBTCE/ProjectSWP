/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiuth
 */
public class CategoryDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public List<String> getAllCategoryNames() {
        List<String> list = new ArrayList<>();
        String query = "SELECT Name FROM Categories";
        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
