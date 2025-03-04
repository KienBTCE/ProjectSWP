/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NhutBMCE180569
 */
public class OrderDetailDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public OrderDetail getOrderDetailOfEachOrder(int orderID) {
        OrderDetail od = null;
        try {
            PreparedStatement pre = connector.prepareStatement("SELECT TOP 1 od.OrderID, od.ProductID, od.Quantity, od.Price, c.[Name], p.FullName, p.[Image] FROM OrderDetails as od\n"
                    + "join Products as p on p.ProductID = od.ProductID\n"
                    + "join Categories c ON p.CategoryID = c.CategoryID\n"
                    + "WHERE OrderID = ?");
            pre.setInt(1, orderID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                od = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getLong(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {
        }
        return od;
    }

    public List<OrderDetail> getOrderDetail(String orderid) {

        List<OrderDetail> list = new ArrayList<>();
        String query = "SELECT * FROM OrderDetails as od\n"
                + "join Products as p on p.ProductID = od.ProductID\n"
                + "WHERE OrderID = ?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setString(1, orderid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail(
                        rs.getInt("OrderID"),
                        rs.getInt("ProductID"),
                        rs.getInt("Quantity"),
                        rs.getLong("Price"),
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
 public List<Integer> getCustomerByProductID(int productID) {
        List<Integer> list = new ArrayList<>();
        String query = "SELECT DISTINCT c.CustomerID FROM Orders AS o " +
                     "JOIN Customers AS c ON c.CustomerID = o.CustomerID " +
                     "JOIN OrderDetails AS od ON od.OrderID = o.OrderID " +
                     "WHERE od.ProductID = ? AND o.Status = 5"; // Chỉ lấy đơn hàng hoàn tất

        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, productID); // Gán tham số ProductID vào câu SQL
            ResultSet rs = pre.executeQuery();
            
            while (rs.next()) {
                list.add(rs.getInt("CustomerID")); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    

    public static void main(String[] args) {
        OrderDetailDAO od = new OrderDetailDAO();
        //System.out.println(od.getOrderDetailOfEachOrder(2));
        for (OrderDetail order : od.getOrderDetail("3")) {
            System.out.println(order.getPrice());
        }
    }
}
