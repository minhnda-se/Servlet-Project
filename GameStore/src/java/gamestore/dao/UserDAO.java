/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.dao;

import gamestore.db.DBUtil;
import gamestore.dto.GoogleUserDTO;
import gamestore.dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author LENOVO
 */
public class UserDAO {

    private static final String LOGIN = "SELECT * FROM Users WHERE userName=? AND password=?";
    private static final String SEARCH = "SELECT * FROM Users WHERE userName LIKE ?";
    private static final String CHECK_USER_EXISTS = "SELECT userName FROM Users WHERE userName=?";
    private static final String CHECK_EMAIL_EXISTS = "SELECT email FROM Users WHERE email=?";
    private static final String UPDATE = "UPDATE Users SET userName=?, password=?, email=?, phoneNumber=? WHERE userID=?";
    private static final String SIGNUP = "INSERT INTO Users (userName, password, email, phoneNumber) VALUES(?,?,?,?)";
    private static final String GET_USER_BY_NAME_AND_PASSWORD = "SELECT * FROM Users WHERE userName=? AND password=?";
    private static final String GET_USER_BY_NAME = "SELECT * FROM Users WHERE userName=?";
    private static final String GET_USER_BY_ROLE = "SELECT * FROM Users WHERE role=?";
    private static final String UPDATE_USER_ROLE = "UPDATE Users SET role=? WHERE userId=?";

    public boolean checkLogin(String userName, String password) throws ClassNotFoundException, SQLException {
        Connection connect = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            connect = DBUtil.getConnection();

            if (connect != null) {
                ps = connect.prepareStatement(LOGIN);
                ps.setString(1, userName);
                ps.setString(2, password);
                rs = ps.executeQuery();
                return rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return false;
    }

    public List<UserDTO> getListUser(String search) throws SQLException, ClassNotFoundException, NamingException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();

            if (conn != null) {
                ps = conn.prepareStatement(SEARCH);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();

                while (rs.next()) {
                    int userID = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    String role = rs.getString("role");
                    listUser.add(new UserDTO(userID, userName, password, email, phoneNumber, role));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listUser;
    }

    public boolean update(int userID, String userName, String password, String email, String phoneNumber) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection connect = null;
        PreparedStatement ps = null;

        try {
            connect = DBUtil.getConnection();

            if (connect != null) {
                ps = connect.prepareStatement(UPDATE);
                ps.setString(1, userName);
                ps.setString(2, password);
                ps.setString(3, email);
                ps.setString(4, phoneNumber);
                ps.setInt(5, userID);
                check = ps.executeUpdate() > 0;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return check;
    }

    public boolean checkUserDuplicate(String userName) throws SQLException, ClassNotFoundException {
        boolean exists = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CHECK_USER_EXISTS);
                ptm.setString(1, userName);
                rs = ptm.executeQuery();
                exists = rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return exists;
    }

    public boolean checEmailkDuplicate(String email) throws SQLException, ClassNotFoundException {
        boolean exists = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CHECK_EMAIL_EXISTS);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                exists = rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return exists;
    }

    public boolean create(String userName, String password, String email, String phoneNumber) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SIGNUP);
                ptm.setString(1, userName);
                ptm.setString(2, password);
                ptm.setString(3, email);
                ptm.setString(4, phoneNumber);
                int affetecdRow = ptm.executeUpdate();
                return affetecdRow > 0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public UserDTO getUserByNameAndPassword(String userName, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = GET_USER_BY_NAME_AND_PASSWORD;
                stm = con.prepareStatement(query);
                stm.setString(1, userName);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userId");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    String role = rs.getString("role");
                    UserDTO user = new UserDTO(userID, userName, password, email, phoneNumber, role);
                    return user;
                }
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
        return null;
    }

    public List<UserDTO> getUserByName(String userName) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList userList = new ArrayList();

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Users WHERE userName=?";
                stm = con.prepareStatement(query);
                stm.setString(1, userName);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int userID = rs.getInt("userId");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    String role = rs.getString("role");
                    UserDTO user = new UserDTO(userID, userName, password, email, phoneNumber, role);
                    userList.add(user);
                }
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

        return userList;
    }

    public List<UserDTO> getUserByRole(String role) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList userList = new ArrayList();

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Users WHERE role=?";
                stm = con.prepareStatement(query);
                stm.setString(1, role);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int userID = rs.getInt("userId");
                    String userName = rs.getString("userName");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    UserDTO user = new UserDTO(userID, userName, password, email, phoneNumber, role);
                    userList.add(user);
                }
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

        return userList;
    }

    public UserDTO changeUserRole(int userID, String newRole) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        UserDTO user = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String updateRoleQuery = "UPDATE Users SET role = ? WHERE userID = ?";
                stm = con.prepareStatement(updateRoleQuery);
                stm.setString(1, newRole);
                stm.setInt(2, userID);
                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    String selectUserQuery = "SELECT * FROM Users WHERE userID = ?";
                    stm = con.prepareStatement(selectUserQuery);
                    stm.setInt(1, userID);
                    ResultSet rs = stm.executeQuery();
                    if (rs.next()) {
                        user = new UserDTO();
                        user.setUserID(rs.getInt("userID"));
                        user.setUserName(rs.getString("userName"));
                        user.setEmail(rs.getString("email"));
                        user.setPhoneNumber(rs.getString("phoneNumber"));
                        user.setRole(rs.getString("role"));
                    }

                    rs.close();
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }

        }

        return user;
    }

    private static final String CHECK_USERID = "SELECT userId FROM Users WHERE email = ?";

    public boolean checkUserByEmail(String email) throws ClassNotFoundException, SQLException {
        Connection connect = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            connect = DBUtil.getConnection();

            if (connect != null) {
                ps = connect.prepareStatement(CHECK_USERID);
                ps.setString(1, email);
                rs = ps.executeQuery();
                return rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return false;
    }

    private static final String INSERT_GOOGLE_USER = "INSERT INTO Users (userName, password, email, phoneNumber, role) VALUES (?, ?, ?, ?, ?)";

    public boolean addGoogleUser(GoogleUserDTO user) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                stm = con.prepareStatement(INSERT_GOOGLE_USER);
                stm.setString(1, user.getName());
                stm.setString(2, "");
                stm.setString(3, user.getEmail());
                stm.setNull(4, java.sql.Types.VARCHAR);
                stm.setString(5, "customer");
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
    private static final String GET_USER_EMAIL = "SELECT userId, userName, email, phoneNumber, role FROM Users WHERE email = ?";

    public UserDTO getUserByEmail(String email) throws SQLException, ClassNotFoundException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(GET_USER_EMAIL);
                ps.setString(1, email);
                rs = ps.executeQuery();
                if (rs.next()) {
                    user = new UserDTO();
                    user.setUserID(rs.getInt("userId"));
                    user.setUserName(rs.getString("userName"));
                    user.setEmail(rs.getString("email"));
                    user.setPhoneNumber(rs.getString("phoneNumber"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return user;
    }
}
