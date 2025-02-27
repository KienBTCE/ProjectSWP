/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author KienBTCE180180
 */
public class SupplierDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public ArrayList<Supplier> getAllSuppliers() {
        ArrayList<Supplier> list = new ArrayList<>();

        String query = "SELECT * FROM Suppliers";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Supplier(
                        rs.getInt("SupplierID"),
                        rs.getString("TaxID"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Address"),
                        rs.getTimestamp("CreatedDate").toLocalDateTime(),
                        rs.getTimestamp("LastModify").toLocalDateTime(),
                        rs.getInt("IsDeleted"),
                        rs.getInt("IsActivate")
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Supplier getSupplierByID(int supplierId) {
        Supplier s = null;

        String query = "SELECT * FROM Suppliers WHERE SupplierId = ?";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setInt(1, supplierId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s = new Supplier(
                        rs.getInt("SupplierID"),
                        rs.getString("TaxID"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Address"),
                        rs.getTimestamp("CreatedDate").toLocalDateTime(),
                        rs.getTimestamp("LastModify").toLocalDateTime(),
                        rs.getInt("IsDeleted"),
                        rs.getInt("IsActivate")
                );
            }
            return s;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return s;
    }

    public boolean createSupplier(Supplier s) {

        String query = "INSERT INTO Suppliers (TaxID, [Name], Email, PhoneNumber, Address, CreatedDate, LastModify, IsDeleted, IsActivate) VALUES (?, ?, ?, ?, ?, GETDATE(), GETDATE(), ?, ?)";
        System.out.println("helo1");
        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setString(1, s.getTaxId());
            ps.setString(2, s.getName());
            ps.setString(3, s.getEmail());
            ps.setString(4, s.getPhoneNumber());
            ps.setString(5, s.getAddress());
            ps.setInt(6, 0);
            ps.setInt(7, 1);

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }
}
