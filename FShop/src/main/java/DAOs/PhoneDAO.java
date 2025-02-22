/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBContext;
import Models.Phone;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KienBTCE180180
 */
public class PhoneDAO {

    DBContext db = new DBContext();
    Connection connector = db.getConnection();

//    public ArrayList<Phone> GetAllPhones() {
//        ArrayList<Phone> list = new ArrayList<>();
//
//        String query = "SELECT * FROM Products JOIN Phones ON Products.pd_SKU = Phones.pd_SKU";
//
//        try ( PreparedStatement ps = connector.prepareStatement(query)) {
//            try ( ResultSet rs = ps.executeQuery()) {
//                while (rs.next()) {
//                    list.add(new Phone(
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
//                            rs.getString("chip"),
//                            rs.getString("size"),
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
//    public Phone GetPhone(int SKU) {
//        Phone p;
//        String query = "SELECT * FROM Products JOIN Phones ON Products.pd_SKU = Phones.pd_SKU WHERE pd_SKU = ?";
//
//        try ( PreparedStatement ps = connector.prepareStatement(query)) {
//            ps.setInt(1, SKU);
//            try ( ResultSet rs = ps.executeQuery()) {
//                if (rs.next()) {
//                    p = new Phone(
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
//                            rs.getString("chip"),
//                            rs.getString("size"),
//                            rs.getFloat("weight"),
//                            rs.getString("image"),
//                            rs.getString("description")
//                    );
//                    return p;
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
//    public ArrayList<String> GetAllBrandPhone() {
//        ArrayList<String> list = null;
//
//        String query = "SELECT DISTINCT brand FROM Products WHERE pd_SKU IN (SELECT pd_SKU FROM Phones)";
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
//    public ArrayList<Phone> GetFilterLaptops(ArrayList<String> filters) {
//        ArrayList<Phone> list = null;
//
//        String query = "SELECT * FROM Phones JOIN Products\n"
//                + "ON Phones.pd_SKU = Products.pd_SKU\n"
//                + "WHERE Phones.pd_SKU IN (SELECT pd_SKU FROM Products WHERE pd_SKU IN (SELECT pd_SKU FROM Phones)";
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
//                    list.add(new Phone(
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
//                            rs.getString("chip"),
//                            rs.getString("size"),
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
