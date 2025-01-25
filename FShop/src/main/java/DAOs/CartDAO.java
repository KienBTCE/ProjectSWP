/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Cart;
import Models.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NhutBMCE180569
 */
public class CartDAO extends DBContext {

    public CartDAO() {
        super();
    }

    public List<Cart> getCartOfAccountID(int accountID) {
        List<Cart> list = new ArrayList<>();
        try {
            PreparedStatement pre = connector.prepareStatement("SELECT c.SKU, c.Quantity, p.[Image], p.FullName, sp.Price, p.CategoryID  \n"
                    + "FROM Carts c \n"
                    + "LEFT JOIN Products p ON c.SKU = p.SKU\n"
                    + "LEFT JOIN ShopProducts sp ON p.SKU = sp.SKU\n"
                    + "WHERE c.AID = ?");
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

    public void updateProductQuantity(int productSKU, int quantity, int id) {
        String sql = "UPDATE Carts SET Quantity = ? WHERE SKU = ? AND AID = ?";
        try {
            PreparedStatement preparedStatement = connector.prepareStatement(sql);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, productSKU);
            preparedStatement.setInt(3, id);
            preparedStatement.executeUpdate();
            System.out.println("Update Ok");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProductOnCart(int productSKU, int id) {
        try {
            PreparedStatement preparedStatement = connector.prepareStatement("Delete from Carts where SKU = ? and AID = ?");
            preparedStatement.setInt(1, productSKU);
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

    }
}
