package controller.servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.UserModel;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.REGISTER_SERVLET})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	DatabaseController dbController = new DatabaseController();
	public RegisterServlet() {
		super();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter(StringUtils.USERNAME);
		String name = request.getParameter(StringUtils.NAME);
		String email = request.getParameter(StringUtils.EMAIL);
		String phoneNumber = request.getParameter(StringUtils.PHONE_NUMBER);
		String address = request.getParameter(StringUtils.ADDRESS);
		String password = request.getParameter(StringUtils.PASSWORD);
		String isAdmin = request.getParameter(StringUtils.IS_ADMIN);
		String retypePassword = request.getParameter(StringUtils.RETYPE_PASSWORD);
		

		UserModel userModel = new UserModel(username, name, email, phoneNumber, address, password, isAdmin);
		int result = dbController.addUser(userModel);


		if (password.equals(retypePassword)) {
			switch (result) {
				case 1 -> {
	                request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.REGISTER_SUCCESS_MESSAGE);
	                request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
				}
				case 0 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.REGISTER_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -1 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -2 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -3 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.EMAIL_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -4 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PHONE_NUMBER_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				default -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
			}
		}
		else {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
		    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
		}
	}
}

