/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.servlets;

import gamestore.dao.UserDAO;
import gamestore.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author huusa
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String ERROR = "login.jsp";
    private final static String HOME_PAGE = "home.jsp";
    private final static String ADMIN_PAGE = "adminpage.jsp";
    private static final String ROLE_ERROR_MESSAGE = "YOUR ROLE IS NOT SUPPORT";
    private static final String INCORRECT_MESSAGE = "INCORRECT USER ID OR PASSWORD";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            boolean isValid = dao.checkLogin(userName, password);
            if(isValid){
                UserDTO user = dao.getUserByNameAndPassword(userName, password);
                String role = user.getRole();
                String loginUserName=user.getUserName();
                String loginUserEmail=user.getEmail();
                
                if(role.equals("admin")){
                    url = ADMIN_PAGE;
                } else if(user.getRole().equals("customer")){
                    url = HOME_PAGE;
                } else{
                    session.setAttribute("WRONG_ROLE", ROLE_ERROR_MESSAGE);
                }
                session.setAttribute("USER_ID", user.getUserID());
                session.setAttribute("USER_INFORMATION", user);
                session.setAttribute("LOGIN_USER_NAME", loginUserName);
                session.setAttribute("LOGIN_USER_EMAIL", loginUserEmail);
            } else{
                session.setAttribute("INCORRECT", INCORRECT_MESSAGE);
                url = ERROR;
            }
//            if (loginUser == null) {
//                session.setAttribute("ERROR", INCORRECT_MESSAGE);
//                url = ERROR;
//            } else {
//                String role = loginUser.getRole();
//
//                if (AD.equals(role)) {
//                    url = ADMIN_PAGE;
//                } else if (USER.equals(role)) {
//                    url = USER_PAGE;
//                } else {
//                    url = ERROR;
//                    session.setAttribute("ERROR", ROLE_ERROR_MESSAGE);
//                }
//            }
        }catch(SQLException|ClassNotFoundException ex){
            ex.printStackTrace();
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
