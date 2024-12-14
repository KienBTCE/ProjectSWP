/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author NhutBMCE180569
 */
public class Order {

    int orderID;
    String accountID;
    String fullName;
    String phone;
    String address;
    String way;
    long totalAmount;

    public Order(String fullName, String phone, String address, String way) {
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.way = way;
    }

    public Order(String accountID, String fullName, String phone, String address, String way, long totalAmount) {
        this.accountID = accountID;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.way = way;
        this.totalAmount = totalAmount;
    }

    
    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public long getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(long totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

  

}
