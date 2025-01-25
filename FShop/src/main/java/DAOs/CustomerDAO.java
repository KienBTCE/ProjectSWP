/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Customer;
import Models.Laptop;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
                            rs.getInt("AID"),
                            rs.getString("FullName"),
                            null,
                            rs.getDate("Birthday"),
                            rs.getString("Gender"),
                            rs.getString("PhoneNumber"),
                            rs.getString("Email"),
                            rs.getDate("CreateAt"),
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

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        System.out.println(c.getMD5("hashed_password_123"));
    }
}
