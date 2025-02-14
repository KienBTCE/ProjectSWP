/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author NhutBMCE180569
 */
public class AddressDAO {
    
    DBContext db = new DBContext();
    Connection connector = db.getConnection();
    
    public Address getDefaultAddress(int customerID) {
        try {
            PreparedStatement pr = connector.prepareStatement("SELECT AddressID, AddressDetails FROM Addresses Where CustomerID = ? AND IsDefault = 1");
            pr.setInt(1, customerID);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                return new Address(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e + " ");
        }
        return null;
    }

}
