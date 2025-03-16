/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author NguyenPVT-CE181835
 */
public class Statistic {
    private String productName;
    private int soldQuantity;
    private double soldPercentage;
    private String customerName;
    private String customerEmail;
    private int successfulOrders;
    private String modelName;
    private int stockQuantity;
    private int month;
    private long revenue;

    public Statistic(int month, long revenue) {
        this.month = month;
        this.revenue = revenue;
    }
    

    public Statistic(String modelName, int stockQuantity) {
        this.modelName = modelName;
        this.stockQuantity = stockQuantity;
    }
    
   
    public Statistic(String customerName, String customerEmail, int successfulOrders) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.successfulOrders = successfulOrders;
    }

 

    public Statistic(String productName, int soldQuantity, double soldPercentage) {
        this.productName = productName;
        this.soldQuantity = soldQuantity;
        this.soldPercentage = soldPercentage;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public double getSoldPercentage() {
        return soldPercentage;
    }

    public void setSoldPercentage(double soldPercentage) {
        this.soldPercentage = soldPercentage;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public int getSuccessfulOrders() {
        return successfulOrders;
    }

    public void setSuccessfulOrders(int successfulOrders) {
        this.successfulOrders = successfulOrders;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public long getRevenue() {
        return revenue;
    }

    public void setRevenue(long revenue) {
        this.revenue = revenue;
    }
    
    
    
    
}
