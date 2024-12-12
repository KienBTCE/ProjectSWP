/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Phone;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author KienBTCE180180
 */
public class PhoneDAO extends DBContext {

    public PhoneDAO() {
        super();
    }

    public ArrayList<Phone> GetAllPhones() {
        ArrayList<Phone> list = new ArrayList<>();

        String query = "SELECT * FROM Products JOIN Phones ON Products.pd_SKU = Phones.pd_SKU";

        try ( PreparedStatement ps = connector.prepareStatement(query)) {
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Phone(
                            rs.getInt("pd_SKU"),
                            rs.getString("fullName"),
                            rs.getString("screen"),
                            rs.getString("camera"),
                            rs.getInt("RAM"),
                            rs.getInt("ROM"),
                            rs.getString("chip"),
                            rs.getString("size"),
                            rs.getFloat("weight"),
                            rs.getString("image"),
                            rs.getString("description"),
                            rs.getInt("price")
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
