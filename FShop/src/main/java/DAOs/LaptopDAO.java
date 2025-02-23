/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Laptop;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author KienBTCE180180
 */
public class LaptopDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

//    public ArrayList<Laptop> GetAllLaptops() {
//        ArrayList<Laptop> list = new ArrayList<>();
//
//        String query = "SELECT * FROM Laptops";
//
//        try ( PreparedStatement ps = connector.prepareStatement(query)) {
//            try ( ResultSet rs = ps.executeQuery()) {
//                while (rs.next()) {
//                    list.add(new Laptop(
//                            rs.getString("model"),
//                            rs.getInt("pd_SKU"),
//                            rs.getInt("brandID"),
//                            rs.getString("fullName"),
//                            rs.getString("status"),
//                            rs.getString("note"),
//                            rs.getInt("quantity"),
//                            rs.getInt("price"),
//                            rs.getDate("importDate"),
//                            rs.getInt("categoryID"),
//                            rs.getInt("supplierID"),
//                            rs.getString("screen"),
//                            rs.getString("camera"),
//                            rs.getInt("RAM"),
//                            rs.getInt("ROM"),
//                            rs.getString("CPU"),
//                            rs.getString("GPU"),
//                            rs.getString("size"),
//                            rs.getString("connectionPort"),
//                            rs.getBoolean("lightKeyboard"),
//                            rs.getFloat("weight"),
//                            rs.getString("image"),
//                            rs.getString("description")
//                    ));
//                }
//                return list;
//            } catch (Exception e) {
//                System.out.println(e);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//
//        return null;
//    }
//
//    public Laptop GetLaptop(int SKU) {
//        Laptop lt;
//        String query = "SELECT * FROM Products JOIN Laptops ON Products.pd_SKU = Laptops.pd_SKU WHERE pd_SKU = ?";
//
//        try ( PreparedStatement ps = connector.prepareStatement(query)) {
//            ps.setInt(1, SKU);
//            try ( ResultSet rs = ps.executeQuery()) {
//                if (rs.next()) {
//                    lt = new Laptop(
//                            rs.getString("model"),
//                            rs.getInt("pd_SKU"),
//                            rs.getInt("brandID"),
//                            rs.getString("fullName"),
//                            rs.getString("status"),
//                            rs.getString("note"),
//                            rs.getInt("quantity"),
//                            rs.getInt("price"),
//                            rs.getDate("importDate"),
//                            rs.getInt("categoryID"),
//                            rs.getInt("supplierID"),
//                            rs.getString("screen"),
//                            rs.getString("camera"),
//                            rs.getInt("RAM"),
//                            rs.getInt("ROM"),
//                            rs.getString("CPU"),
//                            rs.getString("GPU"),
//                            rs.getString("size"),
//                            rs.getString("connectionPort"),
//                            rs.getBoolean("lightKeyboard"),
//                            rs.getFloat("weight"),
//                            rs.getString("image"),
//                            rs.getString("description")
//                    );
//                    return lt;
//                }
//            } catch (Exception e) {
//                System.out.println(e);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//
//        return null;
//    }
//
//    public ArrayList<String> GetAllBrandLaptop() {
//        ArrayList<String> list = null;
//
//        String query = "SELECT DISTINCT brand FROM Products WHERE pd_SKU IN (SELECT pd_SKU FROM Laptops)";
//
//        try ( PreparedStatement ps = connector.prepareStatement(query)) {
//            try ( ResultSet rs = ps.executeQuery()) {
//                list = new ArrayList<>();
//                while (rs.next()) {
//                    list.add(rs.getString("brand"));
//                }
//            } catch (Exception e) {
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//
//        return list;
//    }
//
//    public ArrayList<Laptop> GetFilterLaptops(ArrayList<String> filters) {
//        ArrayList<Laptop> list = null;
//
//        String query = "SELECT * FROM Laptops JOIN Products\n"
//                + "ON Laptops.pd_SKU = Products.pd_SKU\n"
//                + "JOIN Suppliers\n"
//                + "ON Products.brandID = Suppliers.supplierID"
//                + "WHERE";
//
//        for (String filter : filters) {
//            query += filter;
//        }
//
//        query += ")";
//
//        try ( PreparedStatement ps = connector.prepareStatement(query)) {
//            try ( ResultSet rs = ps.executeQuery()) {
//                list = new ArrayList<>();
//                while (rs.next()) {
//                    list.add(new Laptop(
//                            rs.getString("model"),
//                            rs.getInt("pd_SKU"),
//                            rs.getInt("brandID"),
//                            rs.getString("fullName"),
//                            rs.getString("status"),
//                            rs.getString("note"),
//                            rs.getInt("quantity"),
//                            rs.getInt("price"),
//                            rs.getDate("importDate"),
//                            rs.getInt("categoryID"),
//                            rs.getInt("supplierID"),
//                            rs.getString("screen"),
//                            rs.getString("camera"),
//                            rs.getInt("RAM"),
//                            rs.getInt("ROM"),
//                            rs.getString("CPU"),
//                            rs.getString("GPU"),
//                            rs.getString("size"),
//                            rs.getString("connectionPort"),
//                            rs.getBoolean("lightKeyboard"),
//                            rs.getFloat("weight"),
//                            rs.getString("image"),
//                            rs.getString("description")
//                    ));
//                }
//                return list;
//            } catch (Exception e) {
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//
//        return list;
//    }

}
