/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.ImportOrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author KienBTCE180180
 */
public class ImportOrderDetailDAO {
    DBContext db = new DBContext();
    Connection connector = db.getConnection();
    
    public int createImportOrderDetails(ArrayList<ImportOrderDetail> detailList) {
        String query = "INSERT INTO ImportOrderDetails (IOID, ProductID, Quantity, ImportPrice) VALUES";
        ArrayList<String> values = new ArrayList<>();
        
        for (ImportOrderDetail d : detailList) {
            String value = "(";
            value += d.getIoid() + ",";
            value += d.getProduct().getProductId() + ",";
            value += d.getQuantity() + ",";
            value += d.getImportPrice() + ")";
        }
        
        for (String v : values) {
            query += " " + v + ",";
        }
        
        String finalQuery = query.substring(0, query.length() - 1);
        
        try {
            PreparedStatement ps = connector.prepareStatement(finalQuery);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }
    
}
