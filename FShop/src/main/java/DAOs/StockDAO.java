/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Stock;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class StockDAO{
    DBContext db = new DBContext();
    Connection connector = db.getConnection();
    public List<Stock> GetAll() {
        List<Stock> list = new ArrayList<>();
        String query = "SELECT \n" +
"    io.IOID,\n" +
"    e.FullName AS EmployeeName,\n" +
"    s.[Name] AS SupplierName,\n" +
"    io.ImportDate,\n" +
"    io.TotalCost,\n" +
"    io.LastModify,\n" +
"    p.ProductID,\n" +
"    p.FullName AS ProductName,\n" +
"    b.[Name] AS BrandName,\n" +
"    c.[Name] AS CategoryName,\n" +
"    iod.Quantity,\n" +
"    iod.ImportPrice,\n" +
"    p.Price AS RetailPrice, \n" +
"    (p.Price - iod.ImportPrice) AS ProfitMargin\n" +
"FROM ImportOrders io\n" +
"JOIN Employees e ON io.EmployeeID = e.EmployeeID\n" +
"JOIN Suppliers s ON io.SupplierID = s.SupplierID\n" +
"JOIN ImportOrderDetails iod ON io.IOID = iod.IOID\n" +
"JOIN Products p ON iod.ProductID = p.ProductID\n" +
"JOIN Brands b ON p.BrandID = b.BrandID\n" +
"JOIN Categories c ON p.CategoryID = c.CategoryID\n" +
"ORDER BY io.ImportDate DESC;";
        try {
            PreparedStatement ps = connector.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Stock stock = new Stock(
                        rs.getInt("IOID"),
                        rs.getString("EmployeeName"),
                        rs.getString("SupplierName"),
                        rs.getTimestamp("ImportDate"),
                        rs.getLong("TotalCost"),
                        rs.getTimestamp("LastModify"),
                        rs.getString("ProductName"),
                        rs.getInt("Quantity"),
                        rs.getLong("ImportPrice"),
                        rs.getInt("ProductID"),
                        rs.getString("BrandName"),
                        rs.getString("CategoryName"),
                        rs.getLong("RetailPrice"),
                        rs.getLong("ProfitMargin"));
                list.add(stock);
            }

        } catch (SQLException E) {
            System.out.println(E);
        }
        return list;
    }
}
