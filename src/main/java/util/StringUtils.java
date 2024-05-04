package util;
public class StringUtils {
	public static final String INSERT_USER = "INSERT INTO user_info "
			+ "(username, name, email, phoneNumber, address, password, isAdmin) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?)";


	public static final String GET_LOGIN_USER_INFO = "SELECT * FROM user_info WHERE username = ?";
	public static final String GET_USERNAME = "SELECT COUNT(*) FROM user_info WHERE username = ?";
	public static final String GET_PHONE = "SELECT COUNT(*) FROM user_info WHERE phoneNumber = ?";
	public static final String GET_EMAIL = "SELECT COUNT(*) FROM user_info WHERE email = ?";
	public static final String GET_ALL_USERS = "SELECT * FROM user_info";
	public static final String GET_ALL_PRODUCTS = "select * from products p join categories c on p.category=c.category_id;";
	public static final String GET_SEARCH_PRODUCTS = "SELECT * FROM PRODUCTS p JOIN categories c ON p.category = c.category_id WHERE p.name LIKE ? OR p.description LIKE ?\r\n"
			+ "";
	public static final String GET_FILTER_PRODUCTS = " SELECT * " + "FROM products "
			+ "INNER JOIN categories ON products.category= categories.category_id " + "WHERE price BETWEEN ? AND ? "
			+ "AND category = ?; " + " ";

	public static final String CHECK_ADMIN = "SELECT USERNAME FROM USERS WHERE USERNAME=? AND isAdmin='true'";
	public static final String INSERT_IMAGE = "INSERT INTO IMAGES(imageName,image) values(?,?) ";
	public static final String GET_PRODUCT = "SELECT * from  products p join categories c on p.category=c.category_id  where product_id=? ";
	public static final String INSERT_PRODUCT = "INSERT INTO products (name, description, stock, category, price, images) VALUES ( ?, ?, ?, ?, ?, ?)";
	public static final String INSERT_CATEGORY = "INSERT INTO category (category_name) VALUES (?)";
	public static final String GET_ALL_CATEGORIES = "SELECT * FROM category";
	
	public static final String INSERT_CART = "INSERT INTO cart (quantity) VALUES (?)";
	public static final String GET_ALL_CART = "SELECT * FROM cart";

	public static final String USERNAME = "username";
	public static final String NAME = "name";
	public static final String EMAIL = "email";
	public static final String PHONE_NUMBER = "phoneNumber";
	public static final String ADDRESS = "address";
	public static final String PASSWORD = "password";
	public static final String IS_ADMIN = "isAdmin";
	public static final String RETYPE_PASSWORD = "retypePassword";
	public static final String CATEGORYNAME = "category_name";
	
	public static final String AUTHORIZATION_ERROR = "YOU ARE NOT AN ADMIN LOGIN HERE";
	
	public static final String REGISTER_SUCCESS_MESSAGE = "You've successfully registered!";
	public static final String REGISTER_ERROR_MESSAGE = "Please check the form and correct any mistakes.";
	public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occurred.";
	public static final String USERNAME_ERROR_MESSAGE = "Sorry, the username is already taken.";
	public static final String EMAIL_ERROR_MESSAGE = "Sorry, the email provided is already registered.";
	public static final String PHONE_NUMBER_ERROR_MESSAGE = "Sorry, the phone number provided is already in use.";
	public static final String PASSWORD_UNMATCHED_ERROR_MESSAGE = "The passwords entered do not match each other.";
	
	// End register page messages
	
	public static final String LOGIN_SUCCESS_MESSAGE = "You've successfully logged in!";
	public static final String LOGIN_ERROR_MESSAGE = "The username or password you entered is incorrect.";
	// End login page message
	
	public static final String SUCCESS_MESSAGE = "successMessage";
	public static final String ERROR_MESSAGE = "errorMessage";
	
	// Start JSP Route
	public static final String LOGIN_PAGE = "/pages/login.jsp";
	public static final String REGISTER_PAGE = "/pages/register.jsp";
	public static final String ADMIN_HOME_PAGE = "/pages/adminHome.jsp";
	public static final String USER_HOME_PAGE = "/pages/home.jsp";
	public static final String PRODUCTS_PAGE = "/pages/Products.jsp";
	public static final String PRODUCT_PAGE = "/pages/Product.jsp";
	public static final String ADD_PRODUCTS_PAGE = "/pages/AddProduct.jsp";
	public static final String ADMIN_DASHBOARD = "/pages/AdminDashboard.jsp";
	public static final String CART_PAGE = "/pages/Cart.jsp";
	// End JSP Route
	
	// Start Servlet Route
	public static final String REGISTER_SERVLET = "/RegisterServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String USERS_SERVLET = "/UserServlet";
	public static final String PRODUCT_SERVLET = "/ProductServlet";
	public static final String WILDCARD_SERVLET = "/ProductServlet/*";
	public static final String SAVE_PATH = "C:/Users/ashis/eclipse-workspace/LaptopNexus/src/main/webapp/resources/images/";
	// End Servlet Route
}

	