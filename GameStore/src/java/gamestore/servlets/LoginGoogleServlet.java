/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import gamestore.dto.GoogleUserDTO;
import gamestore.dto.Constants;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import gamestore.dao.UserDAO;
import gamestore.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

@WebServlet(urlPatterns = {"/LoginGoogleServlet"})
public class LoginGoogleServlet extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            GoogleUserDTO user = getUserInfo(accessToken);
            System.out.println(user);
            UserDAO dao = new UserDAO();
            // Check if the user exists in the database
            boolean userExists = dao.checkUserByEmail(user.getEmail());

            if (userExists) {
                // User exists, retrieve user details from the database
                UserDTO existingUser = dao.getUserByEmail(user.getEmail());
                // Save the existing user information into the session
                HttpSession session = request.getSession();
                session.setAttribute("USER_ID", existingUser.getUserID());
                session.setAttribute("USER_INFORMATION", existingUser);
                session.setAttribute("LOGIN_USER_NAME", existingUser.getUserName());
                session.setAttribute("LOGIN_USER_EMAIL", existingUser.getEmail());
                url = SUCCESS; // Redirect to the success page
            } else {
                // User doesn't exist, create a new entry in the Users table
                boolean isAdded = dao.addGoogleUser(user);
                if (isAdded) {
                    UserDTO existingUser = dao.getUserByEmail(user.getEmail());
                    // Save the existing user information into the session
                    HttpSession session = request.getSession();
                    session.setAttribute("USER_ID", existingUser.getUserID());
                    session.setAttribute("USER_INFORMATION", existingUser);
                    session.setAttribute("LOGIN_USER_NAME", existingUser.getUserName());
                    session.setAttribute("LOGIN_USER_EMAIL", existingUser.getEmail());
                    url = SUCCESS; // Redirect to the success page
                } else {
                    url = ERROR;
                    request.setAttribute("USER_ERROR", "Failed to create account. Please try again.");
                }
            }
        } catch (Exception e) {
            log("Error at LoginGoogleServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleUserDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        GoogleUserDTO googlePojo = new Gson().fromJson(response, GoogleUserDTO.class);

        return googlePojo;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the +
    // sign on the left to edit the code.">
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
