/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author HP
 */
public class ProductRating {
    private int rateID;
    private int customerID;
    private int productID;
    private int orderID;
    private Date createdDate;
    private int star;
    private String comment;
    private boolean isDeleted;
    private boolean isRead;
    private  String customerName;
    private String avatar;
    private  String reply;
    private int employeeID;
    

    public ProductRating() {
    }


    public ProductRating(int rateID, int customerID, int productID, int orderID, Date createdDate, int star, String comment, boolean isDeleted, boolean isRead, String customerName, String avatar) {
        this.rateID = rateID;
        this.customerID = customerID;
        this.productID = productID;
        this.orderID = orderID;
        this.createdDate = createdDate;
        this.star = star;
        this.comment = comment;
        this.isDeleted = isDeleted;
        this.isRead = isRead;
        this.customerName = customerName;
        this.avatar = avatar;
    }

    public ProductRating(int rateID, int customerID, int productID, int orderID, Date createdDate, int star, String comment, boolean isDeleted, boolean isRead, String customerName, String avatar, String reply, int employeeID) {
        this.rateID = rateID;
        this.customerID = customerID;
        this.productID = productID;
        this.orderID = orderID;
        this.createdDate = createdDate;
        this.star = star;
        this.comment = comment;
        this.isDeleted = isDeleted;
        this.isRead = isRead;
        this.customerName = customerName;
        this.avatar = avatar;
        this.reply = reply;
        this.employeeID = employeeID;
    }
    

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }
    
    
    
    

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    
    
    public int getRateID() {
        return rateID;
    }

    public void setRateID(int rateID) {
        this.rateID = rateID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public boolean isIsRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }
    
    
}
