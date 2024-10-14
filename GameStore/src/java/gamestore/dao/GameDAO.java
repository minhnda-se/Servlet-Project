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
 * @author huusa
 */
public class GameDAO {

    private static final String SELECT_FAV = "SELECT G.gameId, G.name, G.platform, G.publisher, G.publication_year, G.category, G.price, G.stock_quantity, G.description, G.image_game\n"
            + "FROM Games G\n"
            + "INNER JOIN Favourites F ON G.gameId = F.gameId\n"
            + "WHERE F.userId = ?";

    private static final String INSERT_FAV = "INSERT INTO Favourites(userId, gameId) VALUES(?,?)";

    public List<GameDTO> getAllGameList()
            throws SQLException, ClassNotFoundException {
        List<GameDTO> listGame = new ArrayList();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Games WHERE status = 1 ORDER BY gameId DESC";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int gameId = rs.getInt("gameId");
                    String name = rs.getString("name");
                    String platform = rs.getString("platform");
                    String publisher = rs.getString("publisher");
                    int publication_year = rs.getInt("publication_year");
                    String category = rs.getString("category");
                    float price = rs.getFloat("price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    String image_game = rs.getString("image_game");
                    listGame.add(new GameDTO(gameId, name, platform, publisher, publication_year, category, price, stock_quantity, description, image_game));
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return listGame;
    }

    public List<GameDTO> searchGameBy(String searchBy, String searchValue)
            throws SQLException, ClassNotFoundException {
        List<GameDTO> listGame = new ArrayList();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Games WHERE " + searchBy + " LIKE ? ORDER BY gameId DESC";
                stm = con.prepareStatement(query);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int gameId = rs.getInt("gameId");
                    String name = rs.getString("name");
                    String platform = rs.getString("platform");
                    String publisher = rs.getString("publisher");
                    int publication_year = rs.getInt("publication_year");
                    String category = rs.getString("category");
                    float price = rs.getFloat("price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    String image_game = rs.getString("image_game");
                    listGame.add(new GameDTO(gameId, name, platform, publisher, publication_year, category, price, stock_quantity, description, image_game));
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return listGame;
    }

    public GameDTO getGame(String id, List<GameDTO> list) {
        for (GameDTO game : list) {
            if (Integer.toString(game.getGameId()).equals(id)) {
                return game;
            }
        }
        return null;
    }

    public List<GameDTO> viewFav(int userID) throws SQLException {
        List<GameDTO> games = new ArrayList<>();;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                stm = con.prepareStatement(SELECT_FAV);
                stm.setInt(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int gameId = rs.getInt("gameId");
                    String gameName = rs.getString("name");
                    String platform = rs.getString("platform");
                    String publisher = rs.getString("publisher");
                    int publication_year = rs.getInt("publication_year");
                    String category = rs.getString("category");
                    int price = rs.getInt("price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    String image_game = rs.getString("image_game");
                    games.add(new GameDTO(gameId, gameName, platform, publisher, publication_year, category, price, stock_quantity, description, image_game));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return games;
    }

    public boolean addFav(int userID, int gameID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                stm = con.prepareStatement(INSERT_FAV);
                stm.setInt(1, userID);
                stm.setInt(2, gameID);
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }

    

   

    private static final String DELETE_FAV = "DELETE FROM Favourites WHERE userID=? AND gameID= ?";

    public boolean deleteFav(int userID, int gameID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(DELETE_FAV);
                ptm.setInt(1, userID);
                ptm.setInt(2, gameID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if ((con != null)) {
                con.close();
            }
        }
        return check;
    }

    public boolean updateGame(int gameId, String name, String platform, String publisher, int publication_year,
            String category, float price, int stock, String description, String image)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "UPDATE Games SET name = ?, platform = ?, publisher = ?, publication_year = ?, \n"
                        + "category = ?, price = ?, stock_quantity = ?, \n"
                        + "description = ?, image_game = ? WHERE gameId = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, name);
                stm.setString(2, platform);
                stm.setString(3, publisher);
                stm.setInt(4, publication_year);
                stm.setString(5, category);
                stm.setFloat(6, price);
                stm.setInt(7, stock);
                stm.setString(8, description);
                stm.setString(9, image);
                stm.setInt(10, gameId);
                check = stm.executeUpdate() > 0;
                return check;
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
        return false;
    }
    
    public boolean addGame(String name, String platform, String publisher, int publication_year, String category, float price, int stock, String description, String image_game)
            throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBUtil.getConnection();
            if(con!=null){
                String query = "INSERT INTO Games VALUES(?,?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1, name);
                stm.setString(2, platform);
                stm.setString(3, publisher);
                stm.setInt(4, publication_year);
                stm.setString(5, category);
                stm.setFloat(6, price);
                stm.setInt(7, stock);
                stm.setString(8, description);
                stm.setString(9, image_game);
                int affected = stm.executeUpdate();
                return affected > 0;
            }
        } finally{
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean updateQuantity(int gameId) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "UPDATE Games SET stock_quantity = stock_quantity - 1  where gameId = ?";
                stm = con.prepareStatement(query);
                stm.setInt(1, gameId);
                check = stm.executeUpdate() > 0 ? true : false;
                return check;
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
    
    private static final String DELETE_GAME = "UPDATE Games SET status= 0 WHERE gameID= ?";
    
        public boolean deleteGame(int gameID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(DELETE_GAME);
                ptm.setInt(1, gameID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if ((con != null)) {
                con.close();
            }
        }
        return check;
    }
}
