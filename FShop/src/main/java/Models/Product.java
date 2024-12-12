/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author KienBTCE180180
 */
public class Product {

    private String ID;
    private String brand;
    private int SKU;
    private String fullName;
    private String status;
    private String note;
    private int quantity;
    private String productType;
    private int price;

    public Product() {
    }

    public Product(String ID, String brand, int SKU, String fullName, String status, String note, int quantity, String productType, int price) {
        this.ID = ID;
        this.brand = brand;
        this.SKU = SKU;
        this.fullName = fullName;
        this.status = status;
        this.note = note;
        this.quantity = quantity;
        this.productType = productType;
        this.price = price;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getSKU() {
        return SKU;
    }

    public void setSKU(int SKU) {
        this.SKU = SKU;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public boolean isLaptop() {
        return this instanceof Laptop;
    }

    public boolean isPhone() {
        return this instanceof Phone;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPriceFormatted() {
        Locale vietnam = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(vietnam);
        return currencyFormatter.format(price);
    }

}
