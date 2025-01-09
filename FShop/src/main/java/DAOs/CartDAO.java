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

    public List<Cart> getCartOfAccountID(String accountID) {
        List<Cart> list = new ArrayList<>();
        List<Product> p = new ArrayList<>();
        try {
            PreparedStatement pre = connector.prepareStatement("SELECT * FROM Carts c \n"
                    + "LEFT JOIN Products p\n"
                    + "ON c.pd_SKU = p.pd_SKU "
                    + "WHERE c.a_ID LIKE '" + accountID + "'");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                p.add(new Product(
                        rs.getString("pd_ID"),
                        rs.getString("brand"),
                        rs.getInt("pd_SKU"),
                        rs.getString("fullName"),
                        rs.getString("status"),
                        rs.getString("note"),
                        rs.getInt("quantity"),
                        rs.getString("productType"),
                        rs.getInt("price")));
            }
            for (Product pr : p) {
                if (pr.getProductType().equalsIgnoreCase("laptop")) {
                    pre = connector.prepareStatement("SELECT c.pd_SKU, c.quantity, l.[image], p.fullName, p.price, p.productType FROM Carts c\n"
                            + "                            LEFT JOIN Products p\n"
                            + "                           ON c.pd_SKU = p.pd_SKU \n"
                            + "                            LEFT JOIN Laptops l\n"
                            + "                            ON p.pd_SKU = l.pd_SKU\n"
                            + "                            WHERE c.pd_SKU = ? AND c.a_ID LIKE '" + accountID + "'");
                    pre.setInt(1, pr.getSKU());
                    rs = pre.executeQuery();
                    if (rs.next()) {
                        list.add(new Cart(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
                    }
                } else if (pr.getProductType().equalsIgnoreCase("smartphone")) {
                    pre = connector.prepareStatement("SELECT c.pd_SKU, c.quantity, ph.[image], p.fullName, p.price, p.productType FROM Carts c \n"
                            + "LEFT JOIN Products p\n"
                            + "ON c.pd_SKU = p.pd_SKU \n"
                            + "LEFT JOIN Phones ph\n"
                            + "ON p.pd_SKU = ph.pd_SKU WHERE c.pd_SKU = ? AND c.a_ID LIKE '" + accountID + "'");
                    pre.setInt(1, pr.getSKU());
                    rs = pre.executeQuery();
                    if (rs.next()) {
                        list.add(new Cart(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e + "");
        }
        return list;
    }

    public void updateProductQuantity(int productSKU, int quantity, String id) {
        String sql = "UPDATE Carts SET quantity = ? WHERE pd_SKU = ? AND a_ID LIKE '" + id + "'";
        try {
            PreparedStatement preparedStatement = connector.prepareStatement(sql);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, productSKU);
            preparedStatement.executeUpdate();
            System.out.println("Update Ok");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProductOnCart(int productSKU, String id) {
        try {
            PreparedStatement preparedStatement = connector.prepareStatement("Delete from Carts where pd_SKU = ? and a_ID LIKE'" + id + "'");
            preparedStatement.setInt(1, productSKU);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CartDAO c = new CartDAO();
        List<Cart> ca = c.getCartOfAccountID("user1");
        for (Cart cart : ca) {
            System.out.println(cart.getProductName() + " " + cart.getProductType());
        }
        c.updateProductQuantity(5, 10, "user1");
    }
}
