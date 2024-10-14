/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj.dal.ProductDAO;
import prj.dal.ProductDTO;

/**
 *
 * @author PC
 */
public class AddProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String ADD_PRODUCT_PAGE = "addProduct.jsp";
    private final String ADMIN_PAGE = "admin.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ADD_PRODUCT_PAGE;
        try {
            /* TODO output your page here. You may use following sample code. */
            String productID = request.getParameter("productID");
            String category = request.getParameter("category");
            String productName = request.getParameter("name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int price = Integer.parseInt(request.getParameter("price"));
            String description = request.getParameter("description");
            int sale = Integer.parseInt(request.getParameter("sale"));
            
            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();
            productName = dao.normalizeVietnamese(productName);
            description = dao.normalizeVietnamese(description);
            ProductDTO product = new ProductDTO(productID, category, productName, quantity, price, description, sale, "false");
                boolean isExist= dao.checkProductExist(productID);
                if(!isExist){
                    dao.addProduct(product);
                    List<ProductDTO> productList = dao.getProductList();
                    session.setAttribute("PRODUCT_LIST", productList);
                    //url = ADMIN_PAGE;
                    url=ADD_PRODUCT_PAGE;
                    request.setAttribute("SUCCESSFUL", "The product has been successfully added");
                }
                else{
                    request.setAttribute("EXISTED", "Product ID is already existed!");
                    url=ADD_PRODUCT_PAGE;
                }
            
            
        }
        catch(SQLException|ClassNotFoundException ex){
            ex.printStackTrace();
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
