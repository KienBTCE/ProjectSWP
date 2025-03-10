/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Customer;
import Models.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NhutBMCE180569
 */
public class OrderDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public List<Order> getOrderList() {
        List<Order> list = new ArrayList<>();
        String url = "select * from Orders where Orders.Status != 6 ";
        try {

            PreparedStatement pre = connector.prepareStatement(url);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Order o = new Order(rs.getInt("OrderID"),
                        rs.getInt("CustomerID"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Address"),
                        rs.getInt("TotalAmount"),
                        rs.getString("OrderedDate"),
                        rs.getInt("Status"));
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Order getOrderByID(String orderID) {
        Order o = new Order();
        String query = "select * from Orders where Orders.OrderID = ?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setString(1, orderID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                o.setOrderID(rs.getInt("OrderID"));
                o.setAccountID(rs.getInt("CustomerID"));
                o.setFullName(rs.getString("FullName"));
                o.setPhone(rs.getString("PhoneNumber"));
                o.setAddress(rs.getString("Address"));
                o.setTotalAmount(rs.getInt("TotalAmount"));
                o.setOrderDate(rs.getString("OrderedDate"));
                o.setStatus(rs.getInt("Status"));
            }
        } catch (Exception e) {
        }
        return o;
    }

    public int getNewestOrderID() {
        int id = 0;
        try {
            PreparedStatement pre = connector.prepareStatement("Select top 1* from Orders\n"
                    + "order by OrderID desc");
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }

    public void createNewOrder(Order o) {
        try {
            String data = "";
            data = "'" + o.getAccountID() + "',";
            data += "'" + o.getFullName() + "',";
            data += "'" + o.getPhone() + "',";
            data += "N'" + o.getAddress() + "',";
            data += o.getTotalAmount() + "";

            PreparedStatement pre = connector.prepareStatement("Insert into [Orders] (CustomerID, FullName, PhoneNumber, [Address], TotalAmount, [Status], OrderedDate)"
                    + " values (" + data + ", 1, GETDATE())");
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addOrderDetail(int orderID, int productID, int quantity, long price) {
        try {
            PreparedStatement pre = connector.prepareStatement("Insert into [OrderDetails] values"
                    + "(?, ?, ?, ?)");
            pre.setInt(1, orderID);
            pre.setInt(2, productID);
            pre.setInt(3, quantity);
            pre.setLong(4, price);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void subtractQuantityAfterBuy(int productID, int quantity) {
        try {
            PreparedStatement pr = connector.prepareStatement("Update Products set Quantity = quantity - ? where ProductID=?");
            pr.setInt(1, quantity);
            pr.setInt(2, productID);
            pr.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void plusQuantityAfterCancel(int productID, int quantity) {
        try {
            PreparedStatement pr = connector.prepareStatement("Update Products set Quantity = quantity + ? where ProductID=?");
            pr.setInt(1, quantity);
            pr.setInt(2, productID);
            pr.executeUpdate();
        } catch (Exception e) {
        }
    }


    public void addQuantityAfterCancel(int productID, int quantity) {
        try {
            PreparedStatement pr = connector.prepareStatement("Update Products set Quantity = quantity + ? where ProductID=?");
            pr.setInt(1, quantity);
            pr.setInt(2, productID);
            pr.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateOrder(int orderID, int status) {


        String query = "Update Orders SET Orders.Status= ? WHERE Orders.OrderID=?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, status);
            pre.setInt(2, orderID);

            pre.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }

//    public static void main(String[] args) {
//        OrderDAO o = new OrderDAO();
//        o.addOrderDetail(1, 1, 3, 34000000);
//    }
//<<<<<<< HEAD
    }

    public void deleteOrder(int orderID) {

        String query = "Update Orders SET Orders.Status= 6 WHERE Orders.OrderID=?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);

            pre.setInt(1, orderID);
            pre.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
//=======
//    }

//    public void DeleteOrder(String orderID) {
//
//        String query = "Update Orders SET Orders.Status= 6 WHERE Orders.OrderID=?";
//        try {
//            PreparedStatement pre = connector.prepareStatement(query);
//
//            pre.setString(1, orderID);
//            pre.executeUpdate();
//        } catch (Exception e) {
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//
//    }
//>>>>>>> e29642a491e61163dac269a3d9e0bc78f00dd8ef
    public List<Order> getAllOrderOfCustomer(int customerID) {
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement pre = connector.prepareStatement("SELECT * FROM Orders WHERE CustomerID = ?\n"
                    + "Order by OrderedDate DESC");
            pre.setInt(1, customerID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9)));
            }
        } catch (SQLException e) {
            System.out.println(e + "");
        }
        return list;
    }
    
    public int checkHaveOrders(int id) {
        String query = "SELECT * FROM Orders WHERE "
                + "OrderID = ? AND Status != 4 AND Status != 5";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setInt(1, id);

            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                return 1;
            }
        } catch (Exception e) {
            return 1;
        }
        return 0;
    }

    public List<Order> searchOrders(String searchQuery) {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE "
                + "OrderID LIKE ? OR "
                + "FullName LIKE ? OR "
                + "PhoneNumber LIKE ? OR "
                + "Status LIKE ?";
        try {
            PreparedStatement pre = connector.prepareStatement(query);
            pre.setString(1, "%" + searchQuery + "%");
            pre.setString(2, "%" + searchQuery + "%");
            pre.setString(3, "%" + searchQuery + "%");
            pre.setString(4, "%" + searchQuery + "%");

            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("CustomerID"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Address"),
                        rs.getInt("TotalAmount"),
                        rs.getString("OrderedDate"),
                        rs.getInt("Status")
                );
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Customer getCustomerByOrderId(int id) {
        String sql = "SELECT c.CustomerID, c.FullName, c.PhoneNumber, c.Email, "
                + "c.IsBlock, c.IsDeleted FROM customers c "
                + "JOIN orders o ON c.CustomerID = o.CustomerID WHERE o.OrderID = ?";
        try ( PreparedStatement ps = connector.prepareStatement(sql)) {
            ps.setInt(1, id);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(
                            rs.getInt("CustomerID"),
                            rs.getString("FullName"),
                            null,
                            null,
                            null,
                            rs.getString("PhoneNumber"),
                            rs.getString("Email"),
                            null,
                            rs.getInt("IsBlock"),
                            rs.getInt("IsDeleted"),
                            null
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        return null; // Không tìm thấy khách hàng
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
//        o.addOrderDetail(1, 1, 3, 34000000);
//        List<Order> list = o.getAllOrderOfCustomer(1);
//        for (Order order : list) {
//            System.out.println(order.getAddress());
//        }
        o.updateOrder(2, 2);
    }
}
