/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author KienBTCE180180
 */
public class Phone extends Product {

    private int SKU;
    private String screen;
    private String camera;
    private int RAM;
    private int ROM;
    private String chip;
    private String size;
    private float weight;
    private String image;
    private String description;
    private String categoryId;

    public Phone() {
    }

    public Phone(int SKU, String fullName, String screen, String camera, int RAM, int ROM, String chip, String size, float weight, String image, String description, int price) {
        this.SKU = SKU;
        super.setFullName(fullName);
        this.screen = screen;
        this.camera = camera;
        this.RAM = RAM;
        this.ROM = ROM;
        this.chip = chip;
        this.size = size;
        this.weight = weight;
        this.image = image;
        this.description = description;
        super.setPrice(price);
    }

    @Override
    public int getSKU() {
        return SKU;
    }

    @Override
    public void setSKU(int SKU) {
        this.SKU = SKU;
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

    @Override
    public String getFullName() {
        return super.getFullName(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getPriceFormatted() {
        return super.getPriceFormatted(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
