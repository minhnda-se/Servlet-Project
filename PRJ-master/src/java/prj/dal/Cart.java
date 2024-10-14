
/*
 * To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.dal;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart extends ArrayList<ProductDTO>{
    public Cart(){
        super();
    }
    private ProductDTO search(String productID,List<ProductDTO> productList){
        for(ProductDTO product : productList){
            if(product.getId().trim().equals(productID)){
                return product;
            }
        }
       return null; 
    }
    private ProductDTO searchInCart(String productID){
        for (ProductDTO product : this){
            if (product.getId().trim().equalsIgnoreCase(productID)){
                return product;
            }
        }
        return null;
    }
    public boolean addToCart(String productID, String quantity, List<ProductDTO> productList){
        ProductDTO product = search(productID, productList);
        ProductDTO item = searchInCart(product.getId().trim());
        int number = 0;
        if (quantity == null || quantity.isEmpty())
            number = 1;
        else    number = Integer.parseInt(quantity);
        if(item != null){
            item.setQuantity(item.getQuantity()+number);
        }
        else{
            item = new ProductDTO(product.getId(), product.getCategory(), product.getName(), number, product.getListPrice(), product.getDescription(), product.getSale(), product.getIsBestSelling());
            this.add(item);
            
        }       
        return true;
    }
    public boolean deleteItem(String itemID){
        ProductDTO item = searchInCart(itemID);
        if (item != null){
            this.remove(item);
            return true;
        }
        return false;
    }
    public int getTotalMoney(){
        int sum = 0;
        for (ProductDTO item : this){
            sum += item.getQuantity()*item.getSalePrice();
        }
        return sum;
    }
    public int getFinalMoney(int discount){
        int sum = getTotalMoney();
        return  (int) ((int) sum*(1-((float)discount/100)));
    }
}