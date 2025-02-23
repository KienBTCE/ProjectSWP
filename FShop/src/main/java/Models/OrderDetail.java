/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
// // <<<<<<< tu
//  * @author HP
//  */
// public class OrderDetail {
//    private int orderID;
//    private int productID;
//    private  int quantity;
//    private long price;
//    private String category;
//    private String productName;
//    private String image;
=======
 * @author NhutBMCE180569
 */
public class OrderDetail {

    private int OrderID;
    private int ProductID;
    private int Quantity;
    private long Price;
    private String Category;
    private String ProductName;
    private String Image;
// >>>>>>> main

    public OrderDetail() {
    }

    public OrderDetail(int OrderID, int ProductID, int Quantity, long Price) {
// <<<<<<< tu
//         this.orderID = OrderID;
//         this.productID = ProductID;
//         this.quantity = Quantity;
//         this.price = Price;
//     }

//     public OrderDetail(int OrderID, int ProductID, int Quantity, long Price, String Category, String ProductName, String Image) {
//         this.orderID = OrderID;
//         this.productID = ProductID;
//         this.quantity = Quantity;
//         this.price = Price;
//         this.category = category;
//         this.productName = ProductName;
//         this.image = Image;
//     }

//     public String getCategory() {
//         return category;
//     }

//     public void setCategory(String category) {
//         this.category = category;
//     }

//     public String getProductName() {
//         return productName;
//     }

//     public void setProductName(String ProductName) {
//         this.productName = ProductName;
//     }

//     public String getImage() {
//         return image;
//     }

//     public void setImage(String Image) {
//         this.image = Image;
//     }

//     public int getOrderID() {
//         return orderID;
//     }
    
//     public void setOrderID(int OrderID) {
//         this.orderID = OrderID;
//     }

//     public int getProductID() {
//         return productID;
//     }

//     public void setProductID(int ProductID) {
//         this.productID = ProductID;
//     }

//     public int getQuantity() {
//         return quantity;
//     }

//     public void setQuantity(int Quantity) {
//         this.quantity = Quantity;
//     }

//     public long getPrice() {
//         return price;
//     }

//     public void setPrice(long Price) {
//         this.price = Price;
//     }
   
// =======
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.Quantity = Quantity;
        this.Price = Price;
    }

    public OrderDetail(int OrderID, int ProductID, int Quantity, long Price, String category, String ProductName, String Image) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.Quantity = Quantity;
        this.Price = Price;
        this.Category = category;
        this.ProductName = ProductName;
        this.Image = Image;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        this.Category = category;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public long getPrice() {
        return Price;
    }

    public void setPrice(long Price) {
        this.Price = Price;
    }
// >>>>>>> main
}
