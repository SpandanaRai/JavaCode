package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import controller.DatabaseController;
import model.UserModel;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.LOGIN_SERVLET)
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String isAdmin = request.getParameter("isAdmin");

        // Check login credentials
        int loginResult = dbController.getUserLoginInfo(username, password);

        if (loginResult == 1) {
        	
        	HttpSession userSession = request.getSession();
        	userSession.setAttribute("user", username);
        	userSession.setMaxInactiveInterval(30*60);
        	
        	Cookie userCookie = new Cookie("user", username);
        	userCookie.setMaxAge(30*60);
        	response.addCookie(userCookie);
        	
            UserModel user = null;
			try {
				user = dbController.getUserDetails(username);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			
            if (user != null) {
            	if ("admin".equals(username)) {
                    // Redirect to the admin portal
                    request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.LOGIN_SUCCESS_MESSAGE);
                    request.getRequestDispatcher(StringUtils.ADMIN_HOME_PAGE).forward(request, response);
                } else {
                    request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.LOGIN_SUCCESS_MESSAGE);
                    request.getRequestDispatcher(StringUtils.USER_HOME_PAGE).forward(request, response);
                    
                }
            	
                
            } else {
                // If user details are not found, handle the error appropriately
                request.setAttribute(StringUtils.ERROR_MESSAGE, "User details not found");
                request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
            }
        } else if (loginResult == 0) {
            // Set error message for invalid credentials and forward to login page
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.LOGIN_ERROR_MESSAGE);
            request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
        } else {
            // Set server error message and forward to login page
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
            request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
        }
    }
}
