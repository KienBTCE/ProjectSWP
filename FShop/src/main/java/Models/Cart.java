/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author NhutBMCE180569
 */
public class Cart {

    private int productSKU;
    private int quantity;
    private String productImg;
    private String productName;
    private int price;
    private String productType;

    public Cart() {
    }

    public Cart(int productSKU, int quantity, String productImg, String productName, int price, String productType) {
        this.productSKU = productSKU;
        this.quantity = quantity;
        this.productImg = productImg;
        this.productName = productName;
        this.price = price;
        this.productType = productType;
    }

    public int getProductSKU() {
        return productSKU;
    }

    public void setProductSKU(int productSKU) {
        this.productSKU = productSKU;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    
}
