/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author NhutBMCE180569
 */
public class CustomerVoucher {

    private int voucherID;
    private int voucherType;
    private String voucherCode;
    private int voucherValue;
    private int customerID;
    private String expirationDate;
    private String description;

    public CustomerVoucher() {
    }

    public CustomerVoucher(int voucherID, int voucherType, String voucherCode, int voucherValue, int customerID, String expirationDate, String description) {
        this.voucherID = voucherID;
        this.voucherType = voucherType;
        this.voucherCode = voucherCode;
        this.voucherValue = voucherValue;
        this.customerID = customerID;
        this.expirationDate = expirationDate;
        this.description = description;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public int getVoucherType() {
        return voucherType;
    }

    public void setVoucherType(int voucherType) {
        this.voucherType = voucherType;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public int getVoucherValue() {
        return voucherValue;
    }

    public void setVoucherValue(int voucherValue) {
        this.voucherValue = voucherValue;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
