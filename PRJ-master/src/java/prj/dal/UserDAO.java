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
 * @author PC
 */
public class UserDAO {

    /**
     *
     * @param adminID
     * @param password
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public boolean authenticateAdmin(String adminID, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Admin WHERE adminID = ? AND password = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, adminID);
                stm.setString(2, password);
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

    /**
     *
     * @param userName
     * @param password
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public boolean authenticateCustomer(String userName, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Customer WHERE userName = ? AND password = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, userName);
                stm.setString(2, password);
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

    /**
     *
     * @param userName
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public UserDTO getUSer(String userName) throws SQLException, ClassNotFoundException {
        //Get user by id
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Customer c INNER JOIN Membership m ON c.typeMember = m.typeMember WHERE userName=?";
                stm = con.prepareStatement(query);
                stm.setString(1, userName);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String password = rs.getString("password");
                    String lastName = rs.getString("lastName");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String membership = rs.getString("typeMember");
                    int discount = rs.getInt("discount");
                    
                    UserDTO user = new UserDTO(userName, password, lastName, phone, email, address, membership, discount);
                    return user;
                }
            }
            return null;
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

    }

    /**
     *
     * @param id
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public boolean checkExist(String id)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Customer WHERE username = ?";
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
    /**
     *
     * @param id
     * @param pass
     * @param lastName
     * @param phone
     * @param email
     * @param address
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public boolean create(String id, String pass, String lastName, String phone, String email, String address)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        String type = "None";
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "INSERT INTO Customer VALUES(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1, id);
                stm.setString(2, pass);
                stm.setString(3, lastName);
                stm.setString(4, phone);
                stm.setString(5, email);
                stm.setString(6, address);
                stm.setString(7, type);
                int aff = stm.executeUpdate();
                return aff > 0;
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
    public List<VisitorDTO> getVisitor(){
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<VisitorDTO> visitorList = new ArrayList<>();
        try {
            con = DBUtil.getConnection();
            if (con != null){
                String query = "SELECT * FROM Visitor ";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()){
                    String id = rs.getString("visitorID");
                    String date = rs.getString("date");
                    visitorList.add(new VisitorDTO(id, date));
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
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       return visitorList;
    }
    /**
     * 
     * @param visitor
     * @return 
     */
    public boolean addVisitor(VisitorDTO visitor){
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null){
                String query = "INSERT INTO Visitor VALUES(?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1, visitor.getId());
                stm.setString(2, visitor.getDate());
                int aff = stm.executeUpdate();
                return  aff > 0;
            }
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    /**
     *
     * @param user
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public boolean update(UserDTO user)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "UPDATE Customer SET lastName= ?, phone= ?, email= ?, address= ? WHERE userName= ?";
                stm = con.prepareStatement(query);
                stm.setString(1, user.getLastName());
                stm.setString(2, user.getPhone());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getUserName());
                int aff = stm.executeUpdate();
                return aff > 0;
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

    public boolean updatePassword(String userName, String newPassword) {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "UPDATE Customer SET password = ? WHERE userName= ?";
                stm = con.prepareStatement(query);
                stm.setString(1, newPassword);
                stm.setString(2, userName);
                stm.executeUpdate();
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
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }
}
