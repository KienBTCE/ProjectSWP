/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HP
 */
public class OrderDetail {
   private int orderID;
   private int productID;
   private  int quantity;
   private long price;
   private String category;
   private String productName;
   private String image;

    public OrderDetail() {
    }

    public OrderDetail(int OrderID, int ProductID, int Quantity, long Price) {
        this.orderID = OrderID;
        this.productID = ProductID;
        this.quantity = Quantity;
        this.price = Price;
    }

    public OrderDetail(int OrderID, int ProductID, int Quantity, long Price, String category, String ProductName, String Image) {
        this.orderID = OrderID;
        this.productID = ProductID;
        this.quantity = Quantity;
        this.price = Price;
        this.category = category;
        this.productName = ProductName;
        this.image = Image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String ProductName) {
        this.productName = ProductName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String Image) {
        this.image = Image;
    }

    public int getOrderID() {
        return orderID;
    }
    
    public void setOrderID(int OrderID) {
        this.orderID = OrderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int ProductID) {
        this.productID = ProductID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int Quantity) {
        this.quantity = Quantity;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long Price) {
        this.price = Price;
    }
   
}
