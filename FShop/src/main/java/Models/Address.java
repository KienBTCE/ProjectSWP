/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author NhutBMCE180569
 */
public class Address {

    private int addressID;
    private int customerID;
    private boolean isDefault;
    private String street;
    private String ward;
    private String district;
    private String province;
    private String provinceNameEn;
    private String districtNameEn;
    private String wardNameEn;

    public Address() {
    }

    public Address(int addressID, String street, String wardNameEn, String districtNameEn, String provinceNameEn) {
        this.addressID = addressID;
        this.street = street;
        this.provinceNameEn = provinceNameEn;
        this.districtNameEn = districtNameEn;
        this.wardNameEn = wardNameEn;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public boolean isIsDefault() {
        return isDefault;
    }

    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvinceNameEn() {
        return provinceNameEn;
    }

    public void setProvinceNameEn(String provinceNameEn) {
        this.provinceNameEn = provinceNameEn;
    }

    public String getDistrictNameEn() {
        return districtNameEn;
    }

    public void setDistrictNameEn(String districtNameEn) {
        this.districtNameEn = districtNameEn;
    }

    public String getWardNameEn() {
        return wardNameEn;
    }

    public void setWardNameEn(String wardNameEn) {
        this.wardNameEn = wardNameEn;
    }

}
