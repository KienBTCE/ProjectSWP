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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TuongMPCE180644
 */
public class CustomerDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

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

    public Customer getCustomerById(int id) {
        String sql = "SELECT * FROM Customers WHERE CustomerID = ?;";
        try ( PreparedStatement ps = connector.prepareStatement(sql)) {
            ps.setInt(1, id);
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
                            rs.getString("CreatedDate"),
                            rs.getInt("IsBlock"),
                            rs.getInt("IsDeleted"),
                            rs.getString("Avatar")
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
                            rs.getString("CreatedDate"),
                            rs.getInt("IsBlock"),
                            rs.getInt("IsDeleted"),
                            rs.getString("Avatar")
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

    public int checkEmailExisted(String email) {
        try {
            PreparedStatement pr = connector.prepareStatement("SELECT * FROM Customers WHERE Email = ?;");
            pr.setString(1, email);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println(e + " ");
        }
        return 0;
    }

    public int addNewCustomer(Customer ctm) {
        try {
            PreparedStatement pr = connector.prepareStatement(
                    "INSERT INTO Customers (FullName, Birthday, [Password], PhoneNumber, Email, Gender, CreatedDate, IsBlock, IsDeleted, Avatar) "
                    + "VALUES (?, ?, ?, ?, ?, ?, GETDATE(), ?, ?, ?);"
            );
            pr.setString(1, ctm.getFullName());
            pr.setString(2, ctm.getBirthday());
            pr.setString(3, getMD5(ctm.getPassword()));
            pr.setString(4, ctm.getPhoneNumber());
            pr.setString(5, ctm.getEmail());
            pr.setString(6, ctm.getGender());
            pr.setInt(7, ctm.getIsBlock()); // Giá trị mặc định của IsBlock
            pr.setInt(8, ctm.getIsDeleted()); // Giá trị mặc định của IsDeleted
            pr.setString(9, ctm.getAvatar());

            int rs = pr.executeUpdate();
            return rs;
        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm khách hàng: " + e.getMessage());
        }
        return 0;
    }

    public int updateAvatar(String img, int ID) {
        try {
            PreparedStatement pr = connector.prepareStatement(
                    "Update Customers SET Avatar = ? Where CustomerID = ?"
            );
            pr.setString(1, img);
            pr.setInt(2, ID);
            int rs = pr.executeUpdate();
            return rs;
        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm khách hàng: " + e.getMessage());
        }
        return 0;
    }

    //Lay danh sach khach hang - shop manager
    public ResultSet getCustomerList() {
        ResultSet rs = null;
        try {
            Statement st = connector.createStatement();
            String sql = "SELECT CustomerID, FullName, Email, PhoneNumber, isBlock FROM Customers";
            rs = st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    //Doi trang thai button - shop manager
    public void toggleStatus(int customerID) {
        try (
            PreparedStatement ps = connector.prepareStatement("UPDATE Customers SET isBlock = 1 - isBlock WHERE CustomerID = ?")) {
            ps.setInt(1, customerID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //Thong tin chi tiet cua khach hang - shop manager
    public Customer getCustomerById2(int id) {
        Customer customer = null;
        try {
            String query = "SELECT * FROM Customers WHERE CustomerID = ?";
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("CustomerID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getInt("isBlock")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        System.out.println(c.getCustomerLogin("nguyenvana@example.com", "user123"));
//        System.out.println(LocalDate.now());
//        System.out.println(c.getDefaultAddress(1).getWardNameEn());
        System.out.println(c.getMD5("user123"));
    }
}
