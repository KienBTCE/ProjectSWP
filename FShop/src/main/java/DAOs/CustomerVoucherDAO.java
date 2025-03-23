/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.CustomerVoucher;
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
public class CustomerVoucherDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public List<CustomerVoucher> getVoucherOfCustomer(int customerID) {
        List<CustomerVoucher> list = new ArrayList<>();
        try {
            PreparedStatement pre = connector.prepareStatement("  SELECT cv.VoucherID, v.VoucherType, v.VoucherCode, v.VoucherValue, cv.ExpirationDate, v.[Description], cv.Quantity FROM CustomerVoucher cv\n"
                    + "  LEFT JOIN Vouchers v ON cv.VoucherID = v.VoucherID\n"
                    + "  WHERE CustomerID = ?");
            pre.setInt(1, customerID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new CustomerVoucher(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void assignVoucherToCustomer(int customerID, int voucherID, int quantity, String expirationDate) {
        String sql = "INSERT INTO CustomerVoucher (CustomerID, VoucherID, Quantity, ExpirationDate) VALUES (?, ?, ?, ?)";
        try ( PreparedStatement ps = connector.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            ps.setInt(2, voucherID);
            ps.setInt(3, quantity);
            if (expirationDate != null) {
                ps.setString(4, expirationDate);
            } else {
                ps.setNull(4, java.sql.Types.TIMESTAMP);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Assign voucher error: " + e.getMessage());
        }
    }

    public boolean isVoucherAlreadyAssigned(int customerID, int voucherID) {
        String sql = "SELECT * FROM CustomerVoucher WHERE CustomerID = ? AND VoucherID = ?";
        try ( PreparedStatement ps = connector.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            ps.setInt(2, voucherID);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Check assigned error: " + e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        CustomerVoucherDAO c = new CustomerVoucherDAO();
        List<CustomerVoucher> list = c.getVoucherOfCustomer(1);
        for (CustomerVoucher customerVoucher : list) {
            System.out.println(customerVoucher.getVoucherCode());
        }
    }
}
