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
import java.util.HashSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj.dal.OrderDAO;
import prj.dal.OrderDTO;
import prj.dal.ProductDAO;
import prj.dal.ProductDTO;
import prj.dal.UserDAO;
import prj.dal.VisitorDTO;

/**
 *
 * @author Anh Minh
 */
public class LoadingServlet extends HttpServlet {

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
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssZ");
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
        String s ="VIS-" + sdf.format(new Date());
        try  {
            /* TODO output your page here. You may use following sample code. */
            ProductDAO productDAO = new ProductDAO();
            UserDAO userDAO = new UserDAO();
            OrderDAO orderDAO = new OrderDAO();
            userDAO.addVisitor(new VisitorDTO(s, sdf1.format(new Date())));
            List<ProductDTO> productList = productDAO.getProductList();
            List<String> categoryList = productDAO.getCategory();
            List<VisitorDTO> visitorList = userDAO.getVisitor();
            List<OrderDTO> orderList = orderDAO.getOrderList();
            HttpSession session = request.getSession(true);
            //Loading visitor
            session.setAttribute("ORDER_LIST", orderList);
            session.setAttribute("VISITOR_LIST", visitorList);
            session.setAttribute("PRODUCT_LIST", productList);
            session.setAttribute("CATEGORY_LIST", categoryList);
            session.setAttribute("CURRENT_DATE",  sdf1.format(new Date()));
            session.setAttribute("URL", "home.jsp");
            
        }
        finally {
            response.sendRedirect("home.jsp");
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
