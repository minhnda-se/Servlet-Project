/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.servlets;


import gamestore.dao.CartDAO;
import gamestore.dao.GameDAO;
import gamestore.dto.ItemDTO;
import gamestore.dto.GameDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ViewCartController", urlPatterns = {"/ViewCartController"})
public class ViewCartController extends HttpServlet {

    private static final String ERROR = "view_cart.jsp";
        private static final String SUCCESS = "view_cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        float sum = 0 ;
        try{
            HttpSession session = request.getSession();
            int userId = (int)session.getAttribute("USER_ID");
            
            CartDAO dao = new CartDAO();
            List<ItemDTO> list = dao.viewCart(userId);
            
            if (list!=null){              
                session.setAttribute("VIEW_CART_LIST", list);
                session.setAttribute("SUM_PRICE", dao.getTotal(list));
                url=SUCCESS;
            }
            
        }catch(Exception e){
            log("Error at ViewCartController :" +e.toString());
            
        }finally{
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
