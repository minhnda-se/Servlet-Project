package gamestore.servlets;

import gamestore.dao.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/SearchUsersServlet"})
public class SearchUsersServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();
        List users = null;

        try {
            String role;
            if ("searchByName".equals(action)) {
                role = request.getParameter("userName");
                if (role != null && !role.trim().isEmpty()) {
                    users = userDAO.getUserByName(role);
                }
            } else if ("searchByRole".equals(action)) {
                role = request.getParameter("role");
                if (role != null && !role.trim().isEmpty()) {
                    users = userDAO.getUserByRole(role);
                }
            }
        } catch (ClassNotFoundException | SQLException var7) {
            request.setAttribute("error", "Error: " + var7.getMessage());
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("SearchUsers.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
