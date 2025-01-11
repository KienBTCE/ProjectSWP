/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author KienBTCE180180
 */
public class ProductDAO extends DBContext {

    public ProductDAO() {
        super();
    }

    public ArrayList<Product> GetAllProducts() {
        ArrayList<Product> list = new ArrayList<>();

        String query = "SELECT * FROM Products";

        try ( PreparedStatement ps = connector.prepareStatement(query)) {
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Product(
                            rs.getString("model"),
                            rs.getInt("pd_ID"),
                            rs.getInt("brandID"),
                            rs.getString("fullName"),
                            rs.getString("status"),
                            rs.getString("note"),
                            rs.getInt("quantity"),
                            rs.getInt("price"),
                            rs.getDate("importDate"),
                            rs.getInt("categoryID"),
                            rs.getInt("supplierID")
                    ));
                }
                return list;
            } catch (Exception e) {
                System.out.println(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }

}
