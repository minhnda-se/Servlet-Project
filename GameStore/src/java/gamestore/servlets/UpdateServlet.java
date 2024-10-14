/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.servlets;

import gamestore.dao.GameDAO;
import gamestore.dto.GameDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author huusa
 */
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String PRODUCT_ADMIN_PAGE = "ProductAD.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = PRODUCT_ADMIN_PAGE;
        try {
            int gameId = Integer.parseInt(request.getParameter("gameId"));
            String name = request.getParameter("name");
            String platform = request.getParameter("platform");
            String publisher = request.getParameter("publisher");
            int publication_year = Integer.parseInt(request.getParameter("publication_year"));
            String category = request.getParameter("category");
            float price  = Float.parseFloat(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String description = request.getParameter("description");
            String image = request.getParameter("image_game");
            GameDAO dao = new GameDAO();
            boolean isSuccess = dao.updateGame(gameId, name, platform, 
                    publisher, publication_year, category, 
                    price, stock, description, image);
            if(isSuccess){
                List<GameDTO> list = dao.getAllGameList();
                HttpSession session = request.getSession();
                session.setAttribute("GAME_LIST", list);
            } else {
                request.setAttribute("MESSAGE", "Update Fail!");
            }
        } catch(SQLException|ClassNotFoundException ex){
            ex.printStackTrace();
        } finally{
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
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
