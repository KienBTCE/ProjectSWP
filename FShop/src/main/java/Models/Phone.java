/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author KienBTCE180180
 */
public class Phone {

    private String pd_ID;
    private String brand;
    private String fullName;
    private String screen;
    private String camera;
    private int RAM;
    private int ROM;
    private String chip;
    private String size;
    private float weight;
    private double price; // To handle DECIMAL(10, 2)
    private String image;
    private String description;
    private String categoryId;

    public Phone() {
    }

    public Phone(String pd_ID, String brand, String fullName, String screen, String camera, int RAM, int ROM, String chip, String size, float weight, double price, String image, String description, String categoryId) {
        this.pd_ID = pd_ID;
        this.brand = brand;
        this.fullName = fullName;
        this.screen = screen;
        this.camera = camera;
        this.RAM = RAM;
        this.ROM = ROM;
        this.chip = chip;
        this.size = size;
        this.weight = weight;
        this.price = price;
        this.image = image;
        this.description = description;
        this.categoryId = categoryId;
    }

    public String getPd_ID() {
        return pd_ID;
    }

    public void setPd_ID(String pd_ID) {
        this.pd_ID = pd_ID;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getCamera() {
        return camera;
    }

    public void setCamera(String camera) {
        this.camera = camera;
    }

    public int getRAM() {
        return RAM;
    }

    public void setRAM(int RAM) {
        this.RAM = RAM;
    }

    public int getROM() {
        return ROM;
    }

    public void setROM(int ROM) {
        this.ROM = ROM;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

}
