/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.dao;

import gamestore.db.DBUtil;
import gamestore.dto.ItemDTO;
import gamestore.dto.GameDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Minh
 */
public class CartDAO {
     private static final String DELETE_CART = "DELETE FROM Cart WHERE userID=?";
    private static final String VIEW = "SELECT *\n"
            + "FROM Cart c\n"
            + "INNER JOIN Games g ON c.gameId = g.gameId\n"
            + "WHERE c.userId = ? ;";
     public List<ItemDTO> viewCart(int userId) throws SQLException {
        List<ItemDTO> cart = new ArrayList();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                stm = con.prepareStatement(VIEW);
                stm.setInt(1, userId);
                rs = stm.executeQuery();
                while (rs.next()) {
//                    
                    int gameId = rs.getInt("gameId");
                    String name = rs.getString("name");
                    String platform = rs.getString("platform");
                    String publisher = rs.getString("publisher");
                    int publication_year = rs.getInt("publication_year");
                    String category = rs.getString("category");
                    float price = rs.getFloat("price");
                    int stock = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    String image_game = rs.getString("image_game");
                    int quantity = rs.getInt("quantity");
                    ItemDTO item = new ItemDTO(new GameDTO(gameId, name, platform, publisher, publication_year, category, price, stock, description, image_game), quantity);
                    cart.add(item);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
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

        return cart;
    }

    public boolean deleteCart(int userId, int gameId) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "DELETE FROM Cart WHERE userID = ? AND gameId = ?";
                stm = con.prepareStatement(query);
                stm.setInt(1, userId);
                stm.setInt(2, gameId); 
                return stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null);
            stm.close();
            if (con != null);
            con.close();
        }
        return false;
    }
    public boolean addToCart(int quantity, int gameId, int userId) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                   String insertQuery = "INSERT INTO Cart (userId, gameId, quantity) VALUES (?, ?, ?)";
                    stm = con.prepareStatement(insertQuery);
                    stm.setInt(1, userId);
                    stm.setInt(2, gameId);
                    stm.setInt(3, quantity);
                    return stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    public boolean updateCart(int quantity, int userID, int gameID) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                   String query = "UPDATE Cart SET quantity = ? WHERE userId = ? AND gameId = ?";
                    stm = con.prepareStatement(query);
                    stm.setInt(1, quantity);
                    stm.setInt(2, userID);
                    stm.setInt(3, gameID);
                    return stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
     public ItemDTO getItemFromCart(int userId, int gameId) throws SQLException{
        List<ItemDTO> cart = viewCart(userId);
        for (ItemDTO item : cart){
            if (item.getGame().getGameId() == gameId)   return item;
        }
        return null;
    }
     public float getTotal(List<ItemDTO> list){
         float sum = 0;
          for (ItemDTO item : list){
                    sum+= item.getSubPrice();
                }
          return Float.parseFloat(String.format("%.2f", sum));
     }
     public boolean deleteCart(int userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm= conn.prepareStatement(DELETE_CART);
                ptm.setInt(1, userID);
                check= ptm.executeUpdate()> 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

}

