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
    
    public static void main(String[] args) {
        CustomerVoucherDAO c = new CustomerVoucherDAO();
        List<CustomerVoucher> list = c.getVoucherOfCustomer(1);
        for (CustomerVoucher customerVoucher : list) {
            System.out.println(customerVoucher.getVoucherCode());
        }
    }
}
