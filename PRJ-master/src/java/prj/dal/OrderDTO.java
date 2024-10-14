/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.dal;


/**
 *
 * @author Anh Minh
 */
public class OrderDTO {
    private String id;
     private String date;
    private int totalPrice;
    private String userName;
    private String lastName;
    
    public OrderDTO(){}

    public OrderDTO(String id, String date, int totalPrice, String userName, String lastName) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.date = date;
        this.userName = userName;
        this.lastName = lastName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
}
