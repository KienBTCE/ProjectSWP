/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Order;
import Models.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class OrderDetailsDAO {
     DBContext db = new DBContext();
    Connection connector = db.getConnection();
    public List<OrderDetail> getOrderDetail(String orderid){
   
    List <OrderDetail> list = new ArrayList<>();
    String query = "SELECT * FROM OrderDetails as od\n" +
"join Products as p on p.ProductID = od.ProductID\n" +
"WHERE OrderID = ?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setString(1,orderid);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
             OrderDetail od = new OrderDetail(
            rs.getInt("OrderID"),
            rs.getInt("ProductID"),
        rs.getInt("Price"),
            rs.getInt("Quantity"),
             rs.getString("CategoryID"),
             rs.getString("FullName"),
             rs.getString("Image"));
            list.add(od);
            };
        } catch (Exception e) {
            System.out.println(e);
        }
    return list;
    }
  
}
