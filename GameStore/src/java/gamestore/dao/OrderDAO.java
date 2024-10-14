
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.dao;

import gamestore.db.DBUtil;
import gamestore.dto.GameDTO;
import gamestore.dto.ItemDTO;
import gamestore.dto.OrderDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private static final String ADD_ORDER = "INSERT INTO Orders(orderID, userID, order_date, status, total_amount, firstName, lastName, address) "
            + "VALUES(?,?,?,?,?,?,?,?)";

    public boolean addOrder(String orderID, int userID, String fName, String lname, String address, float totalAmount) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_ORDER);
                ptm.setString(1, orderID);
                ptm.setInt(2, userID);
                ptm.setDate(3, Date.valueOf(LocalDate.now()));
                ptm.setString(4, "pending");
                ptm.setFloat(5, totalAmount);
                ptm.setString(6, fName);
                ptm.setString(7, lname);
                ptm.setString(8, address);
                return check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    private static final String ADD_ORDER_ITEM = "INSERT INTO OrderItems(orderID, gameID, quantity, price) "
            + "VALUES(?,?,?,?)";

    public boolean addOrderItem(String orderID, int gameID, float price) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_ORDER_ITEM);
                ptm.setString(1, orderID);
                ptm.setInt(2, gameID);
                ptm.setInt(3, 1);
                ptm.setFloat(4, price);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public List<OrderDTO> getOrderList (int userID)
            throws SQLException, ClassNotFoundException{
        List<OrderDTO> list = new ArrayList();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs =null;
        try{
            con = DBUtil.getConnection();
            if(con!=null){
                String query = "SELECT * FROM Orders WHERE userId = ?";
                stm = con.prepareStatement(query);
                stm.setInt(1, userID);
                rs = stm.executeQuery();
                while(rs.next()){
                    String orderId = rs.getString("orderId");
                    Date order_date = rs.getDate("order_date");
                    String status = rs.getString("status");
                    float total = rs.getFloat("total_amount");
                    list.add(new OrderDTO(orderId, order_date, total, status));
                }
            }
        } finally{
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
        return list;
    }
    
    public List<OrderDTO> getOrderListForAdmin ()
            throws SQLException, ClassNotFoundException{
        List<OrderDTO> list = new ArrayList();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs =null;
        try{
            con = DBUtil.getConnection();
            if(con!=null){
                String query = "SELECT * FROM Orders";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while(rs.next()){
                    String orderId = rs.getString("orderId");
                    Date order_date = rs.getDate("order_date");
                    String status = rs.getString("status");
                    float total = rs.getFloat("total_amount");
                    list.add(new OrderDTO(orderId, order_date, total, status));
                }
            }
        } finally{
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
        return list;
    }
    
    public List<ItemDTO> getOrderList(String orderId)
            throws SQLException, ClassNotFoundException{
        List<ItemDTO> list = new ArrayList();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs =null;
        try{
            con = DBUtil.getConnection();
            if(con!=null){
                String query = "SELECT * FROM Orders INNER JOIN OrderItems ON Orders.orderId = OrderItems.orderId  INNER JOIN Games ON OrderItems.gameId = Games.gameId WHERE Orders.orderId = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, orderId);
                rs = stm.executeQuery();
                while(rs.next()){
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
                    list.add(item);
                }
            }
        } finally{
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
        return list;
    }
}
