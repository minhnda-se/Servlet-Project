/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.dal;

import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 *
 * @author Admin
 */
public class ProductDTO {
    private String id;
    private String category;
    private String name;
    private int quantity;
    private int listPrice;
    private String description;
    private int sale;
    private String isBestSelling;

    public ProductDTO(String id, String category, String name, int quantity, int listPrice, String description, int sale, String isBestSelling) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.quantity = quantity;
        this.listPrice = listPrice;
        this.description = description;
        this.sale = sale;
        this.isBestSelling = isBestSelling;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getListPrice() {
        return listPrice;
    }

    public void setListPrice(int listPrice) {
        this.listPrice = listPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public String getIsBestSelling() {
        return isBestSelling;
    }

    public void setIsBestSelling(String isBestSelling) {
        this.isBestSelling = isBestSelling;
    }
    
    public int getSalePrice(){
        return  (int) ((int) listPrice*(1-((float)sale/100)));
    } 

    
}
