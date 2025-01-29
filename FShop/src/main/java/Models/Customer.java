/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author TuongMPCE180644
 */
public class Customer {
    private int id;
    private String fullName;
    private String password;
    private String birthday;
    private String gender;
    private String phoneNumber;
    private String email;
    private String createAt;
    private String status;
    private String avatar;
    private double loyalPoint;

    public Customer() {
    }

    public Customer(int id, String fullName, String password, String birthday, String gender, String phoneNumber, String email, String createAt, String status, String avatar, double loyalPoint) {
        this.id = id;
        this.fullName = fullName;
        this.password = password;
        this.birthday = birthday;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.createAt = createAt;
        this.status = status;
        this.avatar = avatar;
        this.loyalPoint = loyalPoint;
    }

    public int getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPassword() {
        return password;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getGender() {
        return gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getCreateAt() {
        return createAt;
    }

    public String getStatus() {
        return status;
    }

    public String getAvatar() {
        return avatar;
    }

    public double getLoyalPoint() {
        return loyalPoint;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setLoyalPoint(double loyalPoint) {
        this.loyalPoint = loyalPoint;
    }
    
    
}
