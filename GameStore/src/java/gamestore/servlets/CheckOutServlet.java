/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.servlets;

import gamestore.dao.CartDAO;
import gamestore.dao.GameDAO;
import gamestore.dao.OrderDAO;
import gamestore.dto.GameDTO;
import gamestore.dto.ItemDTO;
import gamestore.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anh Minh
 */
public class CheckOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = "thankyou.html";
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER_INFORMATION");
            int userID = user.getUserID();
            String fName = request.getParameter("firstName");
            String lName = request.getParameter("phone");
            String address = request.getParameter("address");
            float totalAmount = (float) session.getAttribute("SUM_PRICE");
            //
            SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssZ");
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
            String orderID = "ORD-" + sdf.format(new Date());
            OrderDAO dao = new OrderDAO();
            CartDAO cartDAO = new CartDAO();
            boolean checkOrder = dao.addOrder(orderID, userID, fName, lName, address, totalAmount);
            boolean checkOrderItem = false;

            if (checkOrder) {
                List<ItemDTO> cart = (List<ItemDTO>) session.getAttribute("VIEW_CART_LIST");
                for (int i = 0; i < cart.size(); i++) {
                    ItemDTO game = cart.get(i);
                    checkOrderItem = dao.addOrderItem(orderID, game.getGame().getGameId(), game.getSubPrice());
                    GameDAO gameDAO = new GameDAO();
                    gameDAO.updateQuantity(game.getGame().getGameId());
                }
                if (checkOrderItem) {
                    cart.removeAll(cart);
                    cartDAO.deleteCart(userID);
                }
            }
        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
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
