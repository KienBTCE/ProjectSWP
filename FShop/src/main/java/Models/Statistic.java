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
    
    
}
