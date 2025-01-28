/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author NhutBMCE180569
 */
public class OrderDAO extends DBContext {

    public int getNewestOrderID() {
        int id = 0;
        try {
            PreparedStatement pre = connector.prepareStatement("Select top 1* from Orders\n"
                    + "order by orderID desc");
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

            PreparedStatement pre = connector.prepareStatement("Insert into [Orders] "
                    + "(a_ID, fullName, a_phoneNumber, [address], paymentMethod, totalAmount, Discount) values (" + data + ")");
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addOrderDetail(int orderID, int pd_SKU, int quantity, int price) {
        try {
            PreparedStatement pre = connector.prepareStatement("Insert into [OrderDetails] values"
                    + "(?, ?, ?, ?)");
            pre.setInt(1, orderID);
            pre.setInt(2, pd_SKU);
            pre.setInt(3, quantity);
            pre.setInt(4, price);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void subtractQuantityAfterBuy(int productID, int quantity) {
        try {
            PreparedStatement pr = connector.prepareStatement("Update Products set quantity = quantity - ? where pd_SKU=?");
            pr.setInt(1, quantity);
            pr.setInt(2, productID);
            pr.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        o.addOrderDetail(1, 1, 3, 34000000);
    }
}
