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
import prj.error.RegisterError;


public class RegisterServlet extends HttpServlet {

    private final String LOGIN_PAGE="login.jsp";
    private final String REGISTER_PAGE="register.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String url=LOGIN_PAGE;
        try  {
            String userName=request.getParameter("username");
            String lastName=request.getParameter("name");
            String password=request.getParameter("password");
            String phone=request.getParameter("phone");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            
            RegisterError errors=new RegisterError();
            boolean isValid=
                    errors.checkUserName(userName, 5, 30) &
                    errors.checkPass(password, 6, 20) &
                    errors.checkPhone(phone, 10, 11) &
                    errors.checkEmail(email, 10, 40) &
                    errors.checkAddress(address, 10, 100);
            if(isValid){
                UserDAO dao = new UserDAO();
                boolean isExist= dao.checkExist(userName);
                if(!isExist){
                    dao.create(userName, password, lastName, phone, email, address);
                }
                else{
                    request.setAttribute("EXISTED", "Account is Existed!");
                    url=REGISTER_PAGE;
                }
            }
            else{
                url=REGISTER_PAGE;
                request.setAttribute("ERROR", errors);
            }
            session.setAttribute("URL", url);
           
        }
        catch(SQLException|ClassNotFoundException ex){
            ex.printStackTrace();
        }
        finally{
            RequestDispatcher rd= request.getRequestDispatcher(url);
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
