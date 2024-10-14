/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author PC
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
    private final String LOADING_SERVLET = "LoadingServlet";
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String LOGOUT_SERVLET = "LogoutServlet";
    private final String REGISTER_SERVLET = "RegisterServlet";
    private final String COOKIE_SERVLET = "CookieServlet";

    private final String ADD_TO_CART_SERVLET = "AddToCartServlet";
    private final String ADD_PRODUCT_SERVLET = "AddProductServlet";
    private final String ADD_CATEGORY_SERVLET = "AddCategoryServlet";

    private final String SEARCH_SERVLET = "SearchServlet";
    private final String SEARCH_PRODUCT_SERVLET = "SearchProductServlet";
    private final String SELECT_CATEGORY_SERVLET = "SelectCategoryServlet";

    private final String UPDATE_CUSTOMER_SERVLET = "UpdateCustomerServlet";
    private final String UPDATE_PASSWORD_SERVLET = "UpdatePasswordServlet";
    private final String UPDATE_PRODUCT_SERVLET = "UpdateProductServlet";

    private final String DELETE_PRODUCT_SERVLET = "DeleteProductServlet";
    private final String DELETE_CART_SERVLET = "DeleteCartServlet";
    private final String REMOVE_SERVLET = "RemoveServlet";

    

    private final String CHECKOUT_SERVLET = "CheckoutServlet";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = "home.jsp";
        HttpSession session = request.getSession();
        try {
            /* TODO output your page here. You may use following sample code. */
            String button = request.getParameter("btAction");
            if (button == null){
                url = LOADING_SERVLET;
            }
            else if (button.equals("InLogin")){
                url = "login.jsp";
            }
            else if (button.equals("GetUrl")){
                url = (String) request.getParameter("url");
                session.setAttribute("URL", url);
            }
            else if(button.equals("Login")){
                url = LOGIN_SERVLET;
            }
             else if(button.equals("Logout")){
                url = LOGOUT_SERVLET;
            }
            else if(button.equals("AddToCart")){
                url = ADD_TO_CART_SERVLET;
            }
            else if(button.equals("Search")){
                url = SEARCH_SERVLET;
            }
            else if(button.equals("Save")){
                url = UPDATE_CUSTOMER_SERVLET;
            }
            else if (button.equals("SavePassword")){
                url = UPDATE_PASSWORD_SERVLET;
            }
            else if(button.equals("Remove")){
                url = REMOVE_SERVLET;
            }
            else if(button.equals("Register")){
                url = REGISTER_SERVLET;
            }
            else if(button.equals("SearchProduct")){
                url = SEARCH_PRODUCT_SERVLET;
            }
             else if (button.equals("AddCategory")){
                url = ADD_CATEGORY_SERVLET;
            }
            else if (button.equals("AddProduct")){
                url = ADD_PRODUCT_SERVLET;
            }
            else if (button.equals("SelectCategory")){
                url = SELECT_CATEGORY_SERVLET;
            }
            else if (button.equals("UpdateProduct")){
                url = UPDATE_PRODUCT_SERVLET;
            }
            else if (button.equals("DeleteProduct")){
                url = DELETE_PRODUCT_SERVLET;
            }
            else if (button.equals("DeleteCart")){
                url = DELETE_CART_SERVLET;
            }
            else if (button.equals("CHECKOUT")){
                url = CHECKOUT_SERVLET;
            }
            else if (button.equals("GetCategory")){
                String category = request.getParameter("category");
                session.setAttribute("URL", (String) request.getParameter("urlName"));
                request.setAttribute("CATEGORY", category);
                url = "product.jsp";
            }
            else if (button.equals("adminAction")){
                String action = request.getParameter("action");
                request.setAttribute("ADMIN_ACTION", action);
                url = "admin.jsp";
            }
        }
        finally{
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        }
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