/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.time.LocalDateTime;

/**
 *
 * @author KienBTCE180180
 */
public class Supplier {

    private int supplierId;
    private String taxId;
    private String name;
    private String email;
    private String phoneNumber;
    private String address;
    private LocalDateTime createdDate;
    private LocalDateTime lastModify;
    private boolean isDeleted;
    private boolean isActivate;

    public Supplier(int supplierId, String taxId, String name, String email, String phoneNumber, String address, LocalDateTime createdDate, LocalDateTime lastModify, boolean isDeleted, boolean isActivate) {
        this.supplierId = supplierId;
        this.taxId = taxId;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.createdDate = createdDate;
        this.lastModify = lastModify;
        this.isDeleted = isDeleted;
        this.isActivate = isActivate;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public String getTaxId() {
        return taxId;
    }

    public void setTaxId(String taxId) {
        this.taxId = taxId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public LocalDateTime getLastModify() {
        return lastModify;
    }

    public void setLastModify(LocalDateTime lastModify) {
        this.lastModify = lastModify;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public boolean isIsActivate() {
        return isActivate;
    }

    public void setIsActivate(boolean isActivate) {
        this.isActivate = isActivate;
    }
    
    public String getStatus() {
        if(isActivate) {
            return "Activate";
        }
        return "Inactivate";
    }
    
    public String getShortedAddress() {
        String[] fullAddress = address.split(",");
        String shortedAddress = fullAddress[fullAddress.length - 2].trim() + "," + fullAddress[fullAddress.length - 1];
        return shortedAddress;
    }

}
