/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Address;
import Models.Customer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author TuongMPCE180644
 */
public class CustomerDAO extends DBContext {

    private String getMD5(String input) {
        try {
            // Tạo instance của MessageDigest với thuật toán MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Băm chuỗi đầu vào và trả về kết quả dạng byte[]
            byte[] hashBytes = md.digest(input.getBytes());

            // Chuyển đổi byte[] thành chuỗi hexadecimal
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0'); // Thêm '0' vào đầu nếu cần
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 algorithm not found!", e);
        }
    }

    public Customer getCustomerLogin(String email, String password) {
        String sql = "SELECT * FROM Customers WHERE Email = ? AND Password = ?";
        try ( PreparedStatement ps = connector.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, getMD5(password));

            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(
                            rs.getInt("CustomerID"),
                            rs.getString("FullName"),
                            null,
                            rs.getString("Birthday"),
                            rs.getString("Gender"),
                            rs.getString("PhoneNumber"),
                            rs.getString("Email"),
                            rs.getString("CreatedAt"),
                            rs.getString("Status"),
                            rs.getString("Avatar"),
                            rs.getDouble("LoyalPoint")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        return null; // Không tìm thấy khách hàng
    }

    public Address getDefaultAddress(int customerID) {
        try {
            PreparedStatement pr = connector.prepareStatement("SELECT a.AddressID, a.Street, w.FullNameEn, d.FullNameEn, p.FullNameEn, a.IsDefault FROM Addresses a\n"
                    + "LEFT JOIN Provinces p ON a.Province = p.Code\n"
                    + "LEFT JOIN Districts d ON a.District = d.Code\n"
                    + "LEFT JOIN Wards w ON a.Ward = w.Code\n"
                    + "Where CustomerID = ? AND a.IsDefault = 1");
            pr.setInt(1, customerID);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                return new Address(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println(e + " ");
        }
        return null;
    }

    public boolean checkEmailExisted(String email) {
        try {
            PreparedStatement pr = connector.prepareStatement("SELECT * FROM Customers WHERE Email = ?;");
            pr.setString(1, email);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e + " ");
        }
        return false;
    }

    public boolean addNewCustomer(Customer ctm) {
        try {
            PreparedStatement pr = connector.prepareStatement("INSERT INTO Customers (FullName, Birthday, [Password], PhoneNumber, Email, Gender, CreatedAt, [Status], Avatar, LoyalPoint)\n"
                    + "VALUES\n"
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
            pr.setString(1, ctm.getFullName());
            pr.setString(2, ctm.getBirthday());
            pr.setString(3, getMD5(ctm.getPassword()));
            pr.setString(4, ctm.getPhoneNumber());
            pr.setString(5, ctm.getEmail());
            pr.setString(6, ctm.getGender());
            pr.setString(7, LocalDate.now() + "");
            pr.setString(8, ctm.getStatus());
            pr.setString(9, ctm.getAvatar());
            pr.setDouble(10, ctm.getLoyalPoint());
            int rs = pr.executeUpdate();
            return rs == 1;
        } catch (SQLException e) {
            System.out.println(e + " ");
        }
        return false;
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        
        System.out.println(LocalDate.now());
        System.out.println(c.getDefaultAddress(1).getWardNameEn());
    }
}
