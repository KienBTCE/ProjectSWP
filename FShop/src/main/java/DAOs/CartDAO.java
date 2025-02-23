/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Cart;
import Models.Product;
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
public class CartDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public List<Cart> getCartOfAccountID(int accountID) {
        List<Cart> list = new ArrayList<>();
        try {
            PreparedStatement pre = connector.prepareStatement("SELECT c.ProductID, c.Quantity, p.[Image], p.FullName, p.Price, p.CategoryID\n"
                    + "FROM Carts c\n"
                    + "LEFT JOIN Products p ON c.ProductID = p.ProductID\n"
                    + "WHERE c.CustomerID = ?");
            pre.setInt(1, accountID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (SQLException e) {
            System.out.println(e + "");
        }
        return list;
    }

    public int getNumberOfProduct(int accountID) {
        int num = 0;
        try {
            PreparedStatement pre = connector.prepareStatement("SELECT * FROM Carts WHERE CustomerID = ?");
            pre.setInt(1, accountID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                num++;
            }
        } catch (SQLException e) {
            System.out.println(e + "");
        }
        return num;
    }

    public void updateProductQuantity(int productID, int quantity, int id) {
        String sql = "UPDATE Carts SET Quantity = ? WHERE ProductID = ? AND CustomerID = ?";
        try {
            PreparedStatement preparedStatement = connector.prepareStatement(sql);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, productID);
            preparedStatement.setInt(3, id);
            preparedStatement.executeUpdate();
            System.out.println("Update Ok");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProductOnCart(int productID, int id) {
        try {
            PreparedStatement preparedStatement = connector.prepareStatement("Delete from Carts where ProductID = ? and CustomerID = ?");
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CartDAO c = new CartDAO();
        List<Cart> ca = c.getCartOfAccountID(1);
        for (Cart cart : ca) {
            System.out.println(cart.getFullName() + " " + cart.getImage());
        }
        System.out.println(c.getNumberOfProduct(1));
    }
}
