/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author KienBTCE180180
 */
public class Product {

    private int productId;
    private int brandId;
    private String categoryName;
    private String brandName;
    private int categoryId;
    private String model;
    private String fullName;
    private String description;
    private boolean isDeleted;
    private long price;
    private String image;
    private int quantity;
    private int stock;

    private HashMap<String, String> attributes;

    public Product() {
    }

    public Product(int productId, int brandId, int categoryId, String model, String fullName, String description, boolean isDeleted, long price, String image, int quantity, int stock) {
        this.productId = productId;
        this.brandId = brandId;
        this.categoryId = categoryId;
        this.model = model;
        this.fullName = fullName;
        this.description = description;
        this.isDeleted = isDeleted;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.stock = stock;
    }

    public Product(int productId, String categoryName, String brandName, String fullName, long price, int quantity, boolean isDeleted) {
        this.productId = productId;
        this.categoryName = categoryName;
        this.brandName = brandName;
        this.fullName = fullName;
        this.isDeleted = isDeleted;
        this.price = price;
        this.quantity = quantity;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public HashMap<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(HashMap<String, String> attributes) {
        this.attributes = attributes;
    }

    public String getStatus() {
        if (isDeleted) {
            return "Deleted";
        }
        return "Activate";
    }

    public String getPriceFormatted() {
        Locale vietnam = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(vietnam);
        return currencyFormatter.format(price);
    }

}
