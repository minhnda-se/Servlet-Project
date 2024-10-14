/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.servlets;

import gamestore.dao.UserDAO;
import gamestore.dto.ValidData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class UserUpdateServlet extends HttpServlet {

    private final static String ERROR = "profile.jsp";
    private final static String SUCCESS = "LogoutServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userName = request.getParameter("newUserName");
            request.setAttribute("NEW_USER_NAME", userName);
            String password = request.getParameter("newPassword");
            String confirm = request.getParameter("newConfirm");
            String email = request.getParameter("newEmail");
            request.setAttribute("NEW_EMAIL", email);
            String phoneNumber = request.getParameter("newPhoneNumber");
            HttpSession session = request.getSession();
            int userID = (Integer) session.getAttribute("USER_ID");
            String loginUserName = (String) session.getAttribute("LOGIN_USER_NAME");
            String loginUserEmail = (String) session.getAttribute("LOGIN_USER_EMAIL");
            UserDAO dao = new UserDAO();
            ValidData vd = new ValidData();
            boolean error1 = vd.checkUserNameExisted(userName);
            if (userName.equals(loginUserName)) {
                error1 = false;
            }
            request.setAttribute("User_CHECK", error1);
            boolean error2 = vd.checkUserNameExisted(userName);
            if (email.equals(loginUserEmail)) {
                error2 = false;
            }
            request.setAttribute("Email_CHECK", error2);
            boolean error = error1
                    | error2
                    | vd.checkPhoneNumberLength(phoneNumber)
                    | vd.checkPasswordFormat(password)
                    | vd.checkConfirm(password, confirm)
                    | vd.checkPhoneNumberFormat(phoneNumber)
                    | vd.checkPasswordLength(password)
                    | vd.checkUserNameLength(userName);
            if (!error) {
                boolean check = dao.update(userID, userName, password, email, phoneNumber);
                if (check) {
                    url = SUCCESS;
                }
            }
            request.setAttribute("VALIDATION", vd);
        } catch (Exception e) {
            e.printStackTrace();
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
