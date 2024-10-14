/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.dal;

/**
 *
 * @author PC
 */
public class UserDTO {
    private String userName;
    private String password;
    private String lastName;
    private String phone;
    private String email;
    private String address;
    private String membership;
    private int discount;
    
    public UserDTO(){}

    public UserDTO(String userName, String password, String lastName, String phone, String email, String address, String membership, int discount) {
        this.userName = userName;
        this.password = password;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.membership = membership;
        this.discount = discount;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMembership() {
        return membership;
    }

    public void setMembership(String membership) {
        this.membership = membership;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

   
    
}
