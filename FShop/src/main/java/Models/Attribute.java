/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ThyLTKCE181577
 */
public class Attribute {

    private int attributeId;
    private int categoryId;
    private String atrributeName;

    public Attribute() {
    }

    public Attribute(int attributeId, int categoryId, String atrributeName) {
        this.attributeId = attributeId;
        this.categoryId = categoryId;
        this.atrributeName = atrributeName;
    }

    public int getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(int attributeId) {
        this.attributeId = attributeId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getAtrributeName() {
        return atrributeName;
    }

    public void setAtrributeName(String atrributeName) {
        this.atrributeName = atrributeName;
    }

}
