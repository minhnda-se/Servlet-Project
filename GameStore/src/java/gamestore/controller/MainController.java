/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author huusa
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String HOME_PAGE = "home.jsp";

    private final static String LOGIN_SERVLET = "LoginServlet";

    private final static String LOGOUT_SERVLET = "LogoutServlet";

    private static final String REGISTER_SERVLET = "RegisterServlet";

    private static final String USER_UPDATE_SERVLET = "UserUpdateServlet";
    
    private static final String SEARCH_SERVLET = "SearchServlet";
    
    private static final String GET_GAME_SERVLET = "GetGameServlet";
    
    private static final String ADD_FAVORITES_SERVLET = "AddFavoriteServlet";
    
    private static final String VIEW_FAVOURITES_SERVLET= "ViewFavouriteServlet";
    
    private static final String ADD_CART_SERVLET = "AddCartServlet";
    
    private static final String REMOVE_FROM_CART = "RemoveController";
    
    private static final String DELET_FAV_SERVLET = "DeleteFavServlet";
    
    private static final String QUANTITY_UPDATE_SERVLET = "UpdateQuantityServelet";

    private static final String CHECKOUT_SERVLET = "CheckOutServlet";
    
    private static final String UPDATE_GAME_SERVLET = "UpdateServlet";
    
    private static final String VIEW_GAME_SERVLET = "ViewGameList";
    
    private static final String ADD_GAME_SEVLET = "AddGameServlet";
    
    private static final String DELETE_GAME_SERVLET = "DeleteGameServlet";
    
    private static final String ORDER_LIST_SERVLET = "OrderList";
    
    private static final String CHECK_ORDER_SERVLET = "CheckOrderServlet";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = HOME_PAGE;
        try{
            String action = request.getParameter("action");
            if(action.isEmpty()) url = HOME_PAGE;
            else if(action.equals("Search")) url = SEARCH_SERVLET;
            else if(action.equals("Login")) url = LOGIN_SERVLET;
            else if(action.equals("Logout")) url = LOGOUT_SERVLET;
            else if(action.equals("Register")) url = REGISTER_SERVLET;
            else if(action.equals("Save")) url = USER_UPDATE_SERVLET;
            else if(action.equals("getGame")) url = GET_GAME_SERVLET;
            else if(action.equals("AddFav")) url= ADD_FAVORITES_SERVLET;
            else if(action.equals("ViewFav")) url=VIEW_FAVOURITES_SERVLET;
            else if(action.equals("AddToCart")) url = ADD_CART_SERVLET;
            else if(action.equals("RemoveItem")) url = REMOVE_FROM_CART;
            else if(action.equals("DeleteFav")) url = DELET_FAV_SERVLET;
            else if(action.equals("QuantityUpdate")) url = QUANTITY_UPDATE_SERVLET;
            else if(action.equals("Checkout")) url = CHECKOUT_SERVLET;
            else if(action.equals("Update")) url = UPDATE_GAME_SERVLET;
            else if(action.equals("GameList")) url = VIEW_GAME_SERVLET;
            else if(action.equals("AddGame")) url = ADD_GAME_SEVLET;
            else if(action.equals("Delete")) url = DELETE_GAME_SERVLET;
            else if(action.equals("OrderList")) url = ORDER_LIST_SERVLET;
            else if(action.equals("CheckOrder")) url = CHECK_ORDER_SERVLET;
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
