/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author KienBTCE180180
 */
public class Laptop extends Product {

    private int ID;
    private String screen;
    private String camera;
    private int RAM;
    private int ROM;
    private String CPU;
    private String GPU;
    private String size;
    private String connectionPort;
    private boolean lightKeyboard;
    private float weight;
    private String image;
    private String description;

    public Laptop() {
    }

    public Laptop(String model, int ID, int brandID, String fullName, String status, String note, int quantity, int price, Date importDate, int categoryID, int supplierID, String screen, String camera, int RAM, int ROM, String CPU, String GPU, String size, String connectionPort, boolean lightKeyboard, float weight, String image, String description) {
        super(model, ID, brandID, fullName, status, note, quantity, price, importDate, categoryID, supplierID);
        this.ID = ID;
        this.screen = screen;
        this.camera = camera;
        this.RAM = RAM;
        this.ROM = ROM;
        this.CPU = CPU;
        this.GPU = GPU;
        this.size = size;
        this.connectionPort = connectionPort;
        this.lightKeyboard = lightKeyboard;
        this.weight = weight;
        this.image = image;
        this.description = description;
    }

    @Override
    public int getID() {
        return ID;
    }

    @Override
    public void setID(int ID) {
        this.ID = ID;
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

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getGPU() {
        return GPU;
    }

    public void setGPU(String GPU) {
        this.GPU = GPU;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getConnectionPort() {
        return connectionPort;
    }

    public void setConnectionPort(String connectionPort) {
        this.connectionPort = connectionPort;
    }

    public boolean isLightKeyboard() {
        return lightKeyboard;
    }

    public void setLightKeyboard(boolean lightKeyboard) {
        this.lightKeyboard = lightKeyboard;
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

    @Override
    public String getFullName() {
        return super.getFullName(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getPriceFormatted() {
        return super.getPriceFormatted(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
