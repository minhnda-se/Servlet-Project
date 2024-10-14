/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj.dal.Cart;
import prj.dal.OrderDAO;
import prj.dal.OrderDTO;
import prj.dal.ProductDAO;
import prj.dal.ProductDTO;
import prj.dal.UserDAO;
import prj.dal.UserDTO;

/**
 *
 * @author Anh Minh
 */
public class CheckoutServlet extends HttpServlet {

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
        String url = "home.jsp";
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssZ");
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
        String orderID ="ORD-" + sdf.format(new Date());
        try  {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            OrderDAO orderDAO = new OrderDAO();
            UserDAO userDAO = new UserDAO(); 
            ProductDAO productDAO = new ProductDAO();
            Cart cart = (Cart) session.getAttribute("CART");
            String totalPrice = request.getParameter("totalPrice");
            List<ProductDTO> productList = (List<ProductDTO>) session.getAttribute("PRODUCT_LIST");
            
            if (totalPrice == null || totalPrice.isEmpty() || user == null){
                request.setAttribute("CHECKOUT_MESSAGE", "Please login or select some items!!");
            }
            else {
                if (orderDAO.addOrder(new OrderDTO(orderID, sdf1.format(new Date()), Integer.parseInt(totalPrice), user.getUserName(), user.getLastName()))
                        && orderDAO.addInclude(orderID, cart) && productDAO.updateStock(productList, cart)){
                    productDAO.setQuantity(productList, cart);
                    request.setAttribute("CHECKOUT_MESSAGE", "Check out successfully!!");
                    session.setAttribute("ORDER_LIST", orderDAO.getOrderList());
                    session.setAttribute("VISITOR_LIST", userDAO.getVisitor());
                    cart.clear();
                    session.setAttribute("CART", cart);
                }
                    
                else request.setAttribute("CHECKOUT_MESSAGE", "Check out failed!!");
                
            }
            url = "viewcart.jsp";
            session.setAttribute("URL", url);
        }
        finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
