/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Employee;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author NguyenPVT-CE181835
 */
public class EmployeeDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public ArrayList<Employee> getAllEmployees() {
        ArrayList<Employee> listEmployee = new ArrayList<>();
        String sql = "SELECT * FROM Employees";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                listEmployee.add(new Employee(rs.getInt("EmployeeID"),
                        rs.getString("FullName"),
                        rs.getTimestamp("Birthday").toLocalDateTime(),
                        rs.getString("Password"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("Gender"),
                        rs.getTimestamp("CreatedDate").toLocalDateTime(),
                        rs.getString("Status"),
                        rs.getString("Avatar"),
                        rs.getInt("RoleID")
                ));
            }
            return listEmployee;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listEmployee;
    }

    public Employee getEmployeeById(String id) {
        int empId = Integer.parseInt(id);
        Employee emp = null;
        String sql = "SELECT * FROM Employees WHERE EmployeeID = ?";

        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            pr.setInt(empId, 1);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                emp = new Employee(rs.getInt("EmployeeID"),
                        rs.getString("FullName"),
                        rs.getTimestamp("Birthday").toLocalDateTime(),
                        rs.getString("Password"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("Gender"),
                        rs.getTimestamp("CreatedDate").toLocalDateTime(),
                        rs.getString("Status"),
                        rs.getString("Avatar"),
                        rs.getInt("RoleID")
                );
            }
            return emp;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return emp;
    }

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

    public Employee employeeLogin(String email, String password) {
        Employee emp = null;
        try {
            PreparedStatement pr = connector.prepareStatement("SELECT * FROM Employees WHERE Email = ? AND Password = ?");

            pr.setString(1, email);
            pr.setString(2, getMD5(password));

            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                emp = new Employee(rs.getInt("EmployeeID"),
                        rs.getString("FullName"),
                        rs.getTimestamp("Birthday").toLocalDateTime(),
                        "",
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("Gender"),
                        rs.getTimestamp("CreatedDate").toLocalDateTime(),
                        rs.getString("Status"),
                        rs.getString("Avatar"),
                        rs.getInt("RoleID")
                );
            }
            return emp;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return emp;
    }
    
//    public static void main(String[] args) {
//        EmployeeDAO emDAO = new EmployeeDAO();
//        Employee em = new Employee();
//        
//        
//        em = emDAO.employeeLogin("nguyen.vana@example.com", "User123@");
//        
//        System.out.println(em.getFullname());
//        System.out.println(emDAO.getMD5("User123@"));
//    }
    
    
}
