/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.dal;

import java.sql.Connection;
import java.sql.Date;
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
 * @author Anh Minh
 */
public class OrderDAO extends ArrayList<OrderDTO>{
    public boolean addOrder(OrderDTO sale){
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con =DBUtil.getConnection();
            if (con != null){
                String query = "INSERT INTO Orders VALUES(?,?,?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1, sale.getId());
                stm.setString(2, sale.getDate());
                stm.setInt(3, sale.getTotalPrice());
                stm.setString(4, sale.getUserName());
                return stm.executeUpdate() > 0;
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
          return false;
    }
    public boolean addInclude(String orderID, List<ProductDTO> cart){
        Connection con = null;
        PreparedStatement stm = null;
        int aff = 0;
        try {
            con =DBUtil.getConnection();
            if (con != null){
                for (ProductDTO item : cart){
                String query = "INSERT INTO Include VALUES(?,?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1, orderID);
                stm.setString(2, item.getId());
                stm.setInt(3, item.getQuantity());
                aff +=  stm.executeUpdate();
                }
                return aff == cart.size();
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
          return false;
    }
    public List<OrderDTO> getOrderList(){
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con =DBUtil.getConnection();
            if (con != null){
                String query = "SELECT * FROM Orders o INNER JOIN Customer c ON o.userName = c.userName";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()){
                    String id = rs.getString("orderID");
                    String date = rs.getString("dateOrder");
                    int totalPrice = rs.getInt("totalPrice");
                    String userName = rs.getString("userName");
                    String lastName = rs.getString("lastName");
                    this.add(new OrderDTO(id, date, totalPrice, userName, lastName));
                }
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this;
        
    }
  public int getTotalMoney(){
        int sum = 0;
        for (OrderDTO order : this){
            sum += order.getTotalPrice();
        }
        return sum;
    }
}
