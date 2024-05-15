package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;

import controller.DatabaseController;
import model.AboutUsModel;
import util.StringUtils;
/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AboutUsServlet" })
public class AboutUsSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AboutUsSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
	    String email = request.getParameter("email");
	    String message = request.getParameter("message");
	    String number = request.getParameter("number");
	    
	    if (email != null) {
	        AboutUsModel aboutUsModel = new AboutUsModel(email, number, message);
	        int result = dbController.saveFeedback(email, message, number);

	        if (result == 0) {
	            request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.FEEDBACK_SUCCESS_MESSAGE);
	            request.getRequestDispatcher(StringUtils.ABOUTUS_PAGE).forward(request, response);
	        } else {
	            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.FEEDBACK_ERROR_MESSAGE);
	            request.getRequestDispatcher(StringUtils.ABOUTUS_PAGE).forward(request, response);
	        }
	    } else {
	        // Handle the case when 'email' is null
	        request.setAttribute(StringUtils.ERROR_MESSAGE, "Email is required.");
	        request.getRequestDispatcher(StringUtils.ABOUTUS_PAGE).forward(request, response);
	    }
	}



	}