/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Statistic;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author NguyenPVT-CE181835
 */
public class StatisticDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

    public ArrayList<Statistic> getTopProduct() {
        ArrayList<Statistic> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    p.FullName AS ProductName,\n"
                + "    COALESCE(SUM(od.Quantity), 0) AS SoldQuantity,   \n"
                + "    ROUND((COALESCE(SUM(od.Quantity), 0) * 100.0) / p.Stock, 3) AS SoldPercentage\n"
                + "FROM \n"
                + "    Products p\n"
                + "LEFT JOIN \n"
                + "    OrderDetails od ON p.ProductID = od.ProductID\n"
                + "GROUP BY \n"
                + "    p.ProductID, p.FullName, p.Stock\n"
                + "ORDER BY \n"
                + "    SoldPercentage DESC;";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getString("ProductName"), rs.getInt("SoldQuantity"), rs.getDouble("SoldPercentage")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        StatisticDAO s = new StatisticDAO();
        ArrayList<Statistic> l = s.getTopProduct();
        for (Statistic statistic : l) {
            System.out.println(statistic.getProductName());
        }
    }
}
