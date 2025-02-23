/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Employee;
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
    
    public Employee getEmployeeById(String id){
        int empId = Integer.parseInt(id);
        Employee emp = null;
        String sql = "SELECT * FROM Employees WHERE EmployeeID = ?";
        
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            pr.setInt(empId, 1);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
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
}
