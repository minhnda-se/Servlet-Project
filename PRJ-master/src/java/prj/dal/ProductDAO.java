/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.dal;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import prj.db.DBUtil;

/**
 *
 * @author Admin
 */
public class ProductDAO {
    /**
     * 
     * @param productID
     * @param productList
     * @return 
     */
    public ProductDTO search(String productID, List<ProductDTO> productList){
        for (ProductDTO product : productList){
            if (product.getId().trim().equalsIgnoreCase(productID.trim())){
                return product;
            }
        }
        return null;
    }
    public boolean updateProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        
        try{
            con = DBUtil.getConnection();
            if(con != null){
                String query = "UPDATE Product SET stock=?, listPrice=?, description=?, sale=? WHERE productID=?";
                stm = con.prepareStatement(query);
                stm.setInt(1, product.getQuantity());
                stm.setInt(2, product.getListPrice());
                stm.setString(3, product.getDescription());
                stm.setInt(4, product.getSale());
                stm.setString(5, product.getId());
                
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }
        finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    /**
     * This function will get the list of products that store in database
     * @return the list of products
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<ProductDTO> getProductList() {
        List<ProductDTO> productList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try{
            con = DBUtil.getConnection();
            if(con != null){
                String query = "SELECT * FROM Product p INNER JOIN ProductCategory pc On p.categoryID = pc.categoryID";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()){
                    String id = rs.getString("productID");
                    String category = rs.getString("productCatogory");
                    String name = rs.getString("productName");
                    int stock = rs.getInt("stock");
                    int listPrice = rs.getInt("listPrice");
                    String descrip = rs.getString("description");
                    int sale = rs.getInt("sale");
                    String isBestSelling = rs.getString("isBestSelling");
                    productList.add(new ProductDTO(id, category, name, stock, listPrice, descrip, sale, isBestSelling));
                }
            }
        }
        finally{
            if(rs != null) try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(stm != null) try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(con != null) try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return productList;
        }
    }
    /**
     * 
     * @param category
     * @param productList
     * @return 
     */
    public List<ProductDTO> getProductListByCategory(String category, List<ProductDTO> productList){
        List<ProductDTO> productListByCategory = new ArrayList<>();
        for (ProductDTO product : productList){
            if (product.getCategory().equalsIgnoreCase(category)){
                productListByCategory.add(product);
            }
        }
        return productListByCategory;
    }
    public boolean updateStock(List<ProductDTO> productList, List<ProductDTO> cart){
        Connection con = null;
        PreparedStatement stm = null;
        int aff = 0;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                for (ProductDTO item : cart){
                    ProductDTO product = search(item.getId(), productList);
                    String query = "UPDATE Product SET stock = ? WHERE productID = ?";
                    stm = con.prepareStatement(query);
                    stm.setInt(1, product.getQuantity() - item.getQuantity());
                    stm.setString(2, item.getId());
                    aff += stm.executeUpdate();
                }
                return aff == cart.size();
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }
    public boolean addProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        
        try{
            con = DBUtil.getConnection();
            if(con != null){
                String query = "INSERT INTO Product ([productID]\n"
                        + "           ,[categoryID]\n"
                        + "           ,[productName]\n"
                        + "           ,[stock]\n"
                        + "           ,[listPrice]\n"
                        + "           ,[description]\n"
                        + "           ,[sale]"
                        + "           ,[isBestSelling]) VALUES(?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1, product.getId());
                stm.setString(2, product.getCategory());
                stm.setString(3, product.getName());
                stm.setInt(4, product.getQuantity());
                stm.setInt(5, product.getListPrice());
                stm.setString(6, product.getDescription());
                stm.setInt(7, product.getSale());
                stm.setString(8, product.getIsBestSelling());
                
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }
        finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
    public boolean checkProductExist(String id)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Product WHERE productID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, id);
                rs = stm.executeQuery();
                return rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    public boolean setQuantity(List<ProductDTO> productList, List<ProductDTO> cart){
        for (ProductDTO item : cart){
            ProductDTO product = search(item.getId(), productList);
            if (product == null)    return false;
            product.setQuantity(product.getQuantity() - item.getQuantity());
        }
        return true;
    }
    /**
     * 
     * @return 
     */
    public List<String> getCategory(){
       List<String> categoryList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try{
            con = DBUtil.getConnection();
            if(con != null){
                String query = "SELECT * FROM ProductCategory";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()){
                    String category = rs.getString("productCatogory");
                    categoryList.add(category);
                }
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally{
            if(rs != null) try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(stm != null) try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(con != null) try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }  
        }
        return categoryList;
    }
    public boolean addCategory(String id, String category){
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                category = removeAccent(category);
                category = normalizeVietnamese(category);
                String query = "INSERT INTO ProductCategory VALUES (?, ?)";
                stm = con.prepareStatement(query);
                stm.setString(1, id);
                stm.setString(2, category);
                int aff = stm.executeUpdate();
                return aff > 0;
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }
    /**
     * 
     * @param productID
     * @return 
     */
    public boolean deleteProduct(String productID) {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "DELETE Distribute WHERE productID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, productID);
                int aff = stm.executeUpdate();
                query = "DELETE Include WHERE productID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, productID);
                aff = stm.executeUpdate();
                query = "DELETE Product WHERE productID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, productID);
                aff = stm.executeUpdate();

                return aff > 0;
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }
    /**
     * This function will return the list of products that contains the values from user
     * @param searchValue: the value that entered by user
     * @param productList: the list of all products needs to compare
     * @return the list of contained products
     */
    public List<ProductDTO> searchProductList(String searchValue, List<ProductDTO> productList){
        if (searchValue == null || searchValue.isEmpty())
            return productList;
        searchValue = removeAccent(searchValue);
        List<ProductDTO> searchProductList = new ArrayList<>();
        for (ProductDTO product : productList){
            if (normalizeVietnamese(product.getName()).contains(normalizeVietnamese(searchValue)))
                searchProductList.add(product);
        }
        return searchProductList;
    }
    public ProductDTO getProduct(String productID, List<ProductDTO> productList){
        for (ProductDTO product : productList){
            if (product.getId().trim().equalsIgnoreCase(productID.trim()))
                return product;
        }
        return null;
    }
    
    /**
     * Convert the Non-Vietnamese format String to Vietnamese
     * @param s: the input String that java can not convert to Vietnamese
     * @return normal Vietnamese format
     */
    private String removeAccent(String s) {
        String normalString = decodeVietnamese(s);
        return normalString;
    }
    /**
     * This function will decode the String that wrong Vietnamese spell from input
     * @param encodedString the String that need to encode
     * @return the String that finished Vietnamese-decoded
     */
    private String decodeVietnamese(String encodedString) {
        String decodedString = null;
        try {
            // Convert the encoded string to bytes assuming UTF-8 encoding
            byte[] utf8Bytes = encodedString.getBytes("ISO-8859-1");

            // Convert UTF-8 bytes back to a Java String
            decodedString = new String(utf8Bytes, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return decodedString;
    }
    /**
     * This function will normalize the Vietnamese String without any stress
     * @param input: normal Vietnamese String
     * @return the String that normalized to lowercase for case-insensitive comparison
     */
    public String normalizeVietnamese(String input) {
        // Replace common diacritics with their base characters
        input = input.replaceAll("[àáảãạâầấẩẫậăằắẳẵặ]", "a");
        input = input.replaceAll("[èéẻẽẹêềếểễệ]", "e");
        input = input.replaceAll("[ìíỉĩị]", "i");
        input = input.replaceAll("[òóỏõọôồốổỗộơờớởỡợ]", "o");
        input = input.replaceAll("[ùúủũụưừứửữự]", "u");
        input = input.replaceAll("[ỳýỷỹỵ]", "y");
        input = input.replaceAll("[đ]", "d");

        
        input = java.text.Normalizer.normalize(input, java.text.Normalizer.Form.NFD);
        input = input.replaceAll("\\p{M}", ""); // Remove combining marks

        return input.toLowerCase(); 
    }
}
