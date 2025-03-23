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
        String sql = "SELECT\n"
                + "p.FullName AS ProductName,\n"
                + "COALESCE(SUM(od.Quantity), 0) AS SoldQuantity\n"
                + "FROM\n"
                + "Products p\n"
                + "LEFT JOIN \n"
                + "OrderDetails od ON p.ProductID = od.ProductID\n"
                + "GROUP BY \n"
                + "p.ProductID, p.FullName\n"
                + "ORDER BY \n"
                + " SoldQuantity DESC;";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getString(1), rs.getInt(2), 0));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Statistic> getTopCustomer() {
        ArrayList<Statistic> list = new ArrayList<>();
        String sql = "SELECT\n"
                + " c.FullName AS CustomerName,\n"
                + "               c.Email AS CustomerEmail,\n"
                + "               COUNT(c.CustomerID) AS SuccessfulOrders\n"
                + "                FROM\n"
                + "                Customers c\n"
                + "                LEFT JOIN\n"
                + "                Orders o ON c.CustomerID = o.CustomerID\n"
                + "                JOIN\n"
                + "                OrderStatus os ON o.Status = os.ID\n"
                + "                 WHERE\n"
                + "                    os.[Status] = 'Delivered'\n"
                + "                GROUP BY\n"
                + "                c.CustomerID, c.FullName, c.Email\n"
                + "                ORDER BY\n"
                + "                SuccessfulOrders DESC;";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getString(1), rs.getString(2), rs.getInt(3)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Statistic> getInventoryforSmartPhone() {
        ArrayList<Statistic> list = new ArrayList<>();
        String sql = "SELECT p.Model AS Model, p.Stock AS StockQuantity\n"
                + "FROM Products p\n"
                + "WHERE p.CategoryID = 2 ;";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getString(1), rs.getInt(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Statistic> getInventoryforLaptop() {
        ArrayList<Statistic> list = new ArrayList<>();
        String sql = "SELECT p.Model AS Model, p.Stock AS StockQuantity\n"
                + "FROM Products p\n"
                + "WHERE p.CategoryID = 1 ;";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getString(1), rs.getInt(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Statistic> getRevenuePhone() {
        ArrayList<Statistic> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    MONTH(o.OrderedDate) AS Month,\n"
                + "    SUM(od.Quantity * od.Price) AS Revenue\n"
                + "FROM \n"
                + "    Products p\n"
                + "JOIN \n"
                + "    OrderDetails od ON p.ProductID = od.ProductID\n"
                + "JOIN \n"
                + "    Orders o ON od.OrderID = o.OrderID\n"
                + "WHERE \n"
                + "    p.CategoryID = 2\n"
                + "  \n"
                + "GROUP BY \n"
                + "    p.Model,  MONTH(o.OrderedDate)\n"
                + "ORDER BY \n"
                + "    Month Asc";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getInt(1), rs.getLong(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Statistic> getRevenueLaptop() {
        ArrayList<Statistic> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    MONTH(o.OrderedDate) AS Month,\n"
                + "    SUM(od.Quantity * od.Price) AS Revenue\n"
                + "FROM \n"
                + "    Products p\n"
                + "JOIN \n"
                + "    OrderDetails od ON p.ProductID = od.ProductID\n"
                + "JOIN \n"
                + "    Orders o ON od.OrderID = o.OrderID\n"
                + "WHERE \n"
                + "    p.CategoryID = 1\n"
                + "  \n"
                + "GROUP BY \n"
                + "    p.Model,  MONTH(o.OrderedDate)\n"
                + "ORDER BY \n"
                + "    Month Asc";
        try {
            PreparedStatement pr = connector.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getInt(1), rs.getLong(2)));
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
