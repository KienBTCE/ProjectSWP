/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author NguyenPVT-CE181835
 */
public class RevenueStatistic {

    private Date orderDate;
    private int orderMonth;
    private int orderYear;
    private int totalOrder;
    private long totalRevenue;
    private int totalProductsSold;

    public RevenueStatistic(Date orderDate, int totalOrder, long totalRevenue, int totalProductsSold) {
        this.orderDate = orderDate;
        this.totalOrder = totalOrder;
        this.totalRevenue = totalRevenue;
        this.totalProductsSold = totalProductsSold;
    }

    public RevenueStatistic( int orderYear, int orderMonth, int totalOrder, long totalRevenue, int totalProductsSold) {
        this.orderMonth = orderMonth;
        this.orderYear = orderYear;
        this.totalOrder = totalOrder;
        this.totalRevenue = totalRevenue;
        this.totalProductsSold = totalProductsSold;
    }

    public RevenueStatistic(int orderYear, int totalOrder, long totalRevenue, int totalProductsSold) {
        this.orderYear = orderYear;
        this.totalOrder = totalOrder;
        this.totalRevenue = totalRevenue;
        this.totalProductsSold = totalProductsSold;
    }
    
    

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(int totalOrder) {
        this.totalOrder = totalOrder;
    }

    public int getTotalProductsSold() {
        return totalProductsSold;
    }

    public void setTotalProductsSold(int totalProductsSold) {
        this.totalProductsSold = totalProductsSold;
    }

    public long getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(long totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public int getOrderMonth() {
        return orderMonth;
    }

    public void setOrderMonth(int orderMonth) {
        this.orderMonth = orderMonth;
    }

    public int getOrderYear() {
        return orderYear;
    }

    public void setOrderYear(int orderYear) {
        this.orderYear = orderYear;
    }
    
    

}
