//package controller.servlets;
//
//import java.io.IOException;
//import java.sql.Connection;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import controller.DatabaseController;
//import model.CategoryModel;
//import model.UserModel;
//import util.StringUtils;
//
///**
// * Servlet implementation class CategoryServlet
// */
//@WebServlet(asyncSupported = true, urlPatterns = { "/CategoryServlet" })
//public class CategoryServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	DatabaseController dbController = new DatabaseController();
//    public CategoryServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String action = request.getParameter("action");
//
//        if (action.equals("addCategory")) {
//			String category_name = request.getParameter(StringUtils.CATEGORYNAME);
//			CategoryModel categoryModel = new CategoryModel(category_name);
//			int result = dbController.addCategory(categoryModel);
//        }
//	}
//}