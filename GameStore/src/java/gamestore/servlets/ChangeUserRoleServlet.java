package gamestore.servlets;

import gamestore.dao.UserDAO;
import gamestore.dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/ChangeUserRoleServlet"})
public class ChangeUserRoleServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String userIdStr = request.getParameter("userId");
      String newRole = request.getParameter("newRole");
      UserDAO userDAO = new UserDAO();
      UserDTO user = new UserDTO();
      String var7 = null;

      try {
         if (userIdStr != null && !userIdStr.trim().isEmpty() && newRole != null && !newRole.trim().isEmpty()) {
            int userId = Integer.parseInt(userIdStr);
            user = userDAO.changeUserRole(userId, newRole);
            if (user != null) {
               var7 = "User role updated successfully!";
            } else {
               var7 = "User not found or update failed.";
            }
         } else {
            var7 = "User ID or new role is missing.";
         }
      } catch (NumberFormatException var9) {
         var7 = "Invalid User ID format.";
      } catch (ClassNotFoundException | SQLException var10) {
         var7 = "Error: " + var10.getMessage();
      }

      request.setAttribute("user", user);
      request.getRequestDispatcher("ChangeRole.jsp").forward(request, response);
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doPost(request, response);
   }
}
