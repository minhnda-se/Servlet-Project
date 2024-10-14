/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.servlets;

import gamestore.dao.GameDAO;
import gamestore.dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteFavServlet", urlPatterns = {"/DeleteFavServlet"})
public class DeleteFavServlet extends HttpServlet {

    private static final String ERROR = "ViewFavouriteServlet";
    private static final String SUCCESS = "ViewFavouriteServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            GameDAO dao = new GameDAO();
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER_INFORMATION");
            int gameID = Integer.parseInt(request.getParameter("gameID"));
            int userID = user.getUserID();
            boolean check = dao.deleteFav(userID, gameID);
            if (check) {
                session.setAttribute("FAVOURITE_GAME", dao);
                url = SUCCESS;
            } else {
                session.setAttribute("ERROR_FAV_MESSAGE", "Error in removing Favourites");
            }
        } catch (Exception e) {
            log("Error at DeleteFavServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
