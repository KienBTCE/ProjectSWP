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
    private String expirationDate;
    private String description;
    private int quantity;

    public CustomerVoucher() {
    }

    public CustomerVoucher(int voucherID, int voucherType, String voucherCode, int voucherValue, String expirationDate, String description, int quantity) {
        this.voucherID = voucherID;
        this.voucherType = voucherType;
        this.voucherCode = voucherCode;
        this.voucherValue = voucherValue;
        this.expirationDate = expirationDate;
        this.description = description;
        this.quantity = quantity;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
