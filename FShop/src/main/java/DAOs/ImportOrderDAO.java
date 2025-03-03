/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.ImportOrder;
import Models.ImportOrderDetail;
import Models.Product;
import Models.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KienBTCE180180
 */
public class ImportOrderDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public ArrayList<ImportOrder> getAllImportOrders() {
        ArrayList<ImportOrder> list = new ArrayList<>();

        String query = "SELECT * FROM ImportOrders I JOIN Suppliers S ON I.SupplierID = S.SupplierID";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Supplier s = new Supplier(
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

                ImportOrder io = new ImportOrder(
                        rs.getInt("IOID"),
                        rs.getInt("EmployeeID"),
                        rs.getInt("SupplierID"),
                        rs.getDate("ImportDate"),
                        rs.getLong("TotalCost"),
                        rs.getDate("LastModify")
                );

                io.setSupplier(s);

                list.add(io);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public ImportOrder getImportOrderByID(int id) {
        ImportOrder io = null;

        String query = "SELECT * FROM ImportOrders I JOIN Suppliers S ON I.SupplierID = S.SupplierID WHERE IOID = ?";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Supplier s = new Supplier(
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

                io = new ImportOrder(
                        rs.getInt("IOID"),
                        rs.getInt("EmployeeID"),
                        rs.getInt("SupplierID"),
                        rs.getDate("ImportDate"),
                        rs.getLong("TotalCost"),
                        rs.getDate("LastModify")
                );

                io.setSupplier(s);
            }

            return io;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return io;
    }

    public ImportOrder getImportOrderDetailsByID(int id) {
        ImportOrder io = getImportOrderByID(id);

        String query = "SELECT P.Model, P.FullName, D.IOID, D.Quantity, D.ImportPrice, P.ProductID FROM ImportOrderDetails D JOIN Products P ON D.ProductID = P.ProductID WHERE D.IOID = ?";

        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            ArrayList<ImportOrderDetail> l = new ArrayList<>();
            Product p;
            while (rs.next()) {
                p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setModel(rs.getString("Model"));
                p.setFullName(rs.getString("FullName"));
                l.add(new ImportOrderDetail(
                        rs.getInt("IOID"),
                        p,
                        rs.getInt("Quantity"),
                        rs.getLong("ImportPrice")
                ));
            }

            io.setImportOrderDetails(l);
            return io;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return io;
    }

    public int createImportOrder(ImportOrder io) {
        String query = "INSERT INTO ImportOrders (EmployeeID, SupplierID, ImportDate, TotalCost, LastModify) VALUES (?, ?, GETDATE(), ?, GETDATE())";
        try {
            PreparedStatement ps = connector.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, io.getEmployeeId());
            ps.setInt(2, io.getSupplierId());
            ps.setLong(3, io.getTotalCost());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int importStock(List<Map<String, String>> l) {

        String query = "UPDATE Products SET Stock = Stock + CASE";
        String quantity = "";
        String ids = "(";

        for (Map<String, String> map : l) {
            quantity += " WHEN ProductID = " + map.get("id") + " THEN " + map.get("stock");

            if (l.size() == 1) {
                ids += map.get("id") + ")";
            } else {
                ids += ", " + map.get("id");
            }
        }

        if (l.size() != 1) {
            ids += ")";
            query += quantity + " END WHERE ProductID IN " + "(" + ids.substring(3);
        } else {
            query += quantity + " END WHERE ProductID IN " + ids;
        }

        System.out.println(query);

        return 1;
    }
}
