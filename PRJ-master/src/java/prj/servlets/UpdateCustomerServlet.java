/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj.dal.UserDAO;
import prj.dal.UserDTO;

/**
 *
 * @author PC
 */
public class UpdateCustomerServlet extends HttpServlet {

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
        
        try {
            /* TODO output your page here. You may use following sample code. */
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            HttpSession session = request.getSession();
            UserDAO dao = new UserDAO();
            UserDTO currentUser = (UserDTO) session.getAttribute("USER");
            UserDTO user = new UserDTO(userName, password, lastName, phone, email, address, currentUser.getMembership(), currentUser.getDiscount());
            boolean isSucess = dao.update(user);
            if(isSucess){
                request.setAttribute("UPDATE", "Updated successfully!");
                
                session.setAttribute("USER", user);
            }else{
                request.setAttribute("UPDATE", "Updated Fail!!!");
            }
            session.setAttribute("URL", "profile.jsp");
        }
        catch(SQLException|ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally{
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
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
