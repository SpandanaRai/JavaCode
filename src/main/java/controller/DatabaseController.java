package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.PasswordEncryption;
import model.UserModel;
import model.ProductModel;
import model.CategoryModel;
import model.CartModel;
import util.StringUtils;

public class DatabaseController {
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/laptop_nexus";
        String user = "root";
        String pass = "";
        return DriverManager.getConnection(url, user, pass);
    }

    public int addUser(UserModel userModel) {
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(StringUtils.INSERT_USER);

            PreparedStatement checkUsernamePs = con.prepareStatement(StringUtils.GET_USERNAME);
            checkUsernamePs.setString(1, userModel.getUsername());
            ResultSet checkUsername = checkUsernamePs.executeQuery();

            checkUsername.next();

            if (checkUsername.getInt(1) > 0) {
                return -2; // Username already exists
            }

            PreparedStatement checkNumberPs = con.prepareStatement(StringUtils.GET_PHONE);
            checkNumberPs.setString(1, userModel.getPhoneNumber());
            ResultSet checkNumber = checkNumberPs.executeQuery();

            if (checkNumber.next()) {
                String phoneNumber = checkNumber.getString(1);
                if (checkNumber.getInt(1) > 0 && !phoneNumber.matches("\\+[0-9]{13}")) {
                    return -4; // Phone Number already exists and does not match the expected format
                }
            }

            PreparedStatement checkEmailPs = con.prepareStatement(StringUtils.GET_EMAIL);
            checkEmailPs.setString(1, userModel.getEmail());
            ResultSet checkEmail = checkEmailPs.executeQuery();

            checkEmail.next();

            if (checkEmail.getInt(1) > 0) {
                return -3; // Email already exists
            }

            // Encrypt password before storing it in the database
            String encryptedPassword = PasswordEncryption.encryptPassword(userModel.getPassword(), "U3CdwubLD5yQbUOG92ZnHw==");

            ps.setString(1, userModel.getUsername());
            ps.setString(2, userModel.getName());
            ps.setString(3, userModel.getEmail());
            ps.setString(4, userModel.getPhoneNumber());
            ps.setString(5, userModel.getAddress());
            ps.setString(6, encryptedPassword);
            String isAdmin = userModel.getUsername().equalsIgnoreCase("admin") ? "true" : "false";
            ps.setString(7, isAdmin);
           
            int result = ps.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }


    public int getUserLoginInfo(String username, String password) {
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String userDb = rs.getString("username");
                String encryptedPassword = rs.getString("password");

                // Decrypt password from database and compare
                String decryptedPassword = PasswordEncryption.decryptPassword(encryptedPassword, "U3CdwubLD5yQbUOG92ZnHw==");

                if (decryptedPassword!=null && userDb.equals(username) && decryptedPassword.equals(password)) {
                    return 1; // Login successful
                } else {
                    return 0; // Password mismatch
                }
            } else {
                // No matching record found
                return 0;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    public UserModel getUserDetails(String username) throws ClassNotFoundException {
        try (Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(StringUtils.GET_LOGIN_USER_INFO)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Fetch user details from the result set and create a user object
                    UserModel user = new UserModel();
                    user.setName(rs.getString("name"));
            
                    return user;
                } else {
                    // No user found with the given username
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
            return null;
        }
    }
    
    public List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(StringUtils.GET_ALL_USERS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserModel user = new UserModel();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                // Populate other fields as needed
                users.add(user);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        
        return users;
    }
  
    
  //Fetching All Products Data
  	public List<ProductModel> getAllProducts() {
  		List<ProductModel> products = new ArrayList<>();
  		try (Connection con = getConnection()) {
  			PreparedStatement st = con.prepareStatement(StringUtils.GET_ALL_PRODUCTS);
  			ResultSet rs = st.executeQuery();
  			while (rs.next()) {
  				ProductModel allProducts = new ProductModel();
  				allProducts.setName(rs.getString("name"));
  				allProducts.setDescription(rs.getString("description"));
  				allProducts.setPrice(rs.getFloat("price"));
  				allProducts.setStock(rs.getInt("stock"));
  				allProducts.setCategoryName(rs.getString("category_name"));
  				allProducts.setProductId(rs.getInt("product_id"));
  				allProducts.setImageUrl(rs.getString("images"));
  				products.add(allProducts);
  			}
  		} catch (SQLException | ClassNotFoundException ex) {
  			ex.printStackTrace(); // Log the exception for debugging
  		}
  		return products;
  	}

  	
  //Filter Products With Price And Category
  	public List<ProductModel> filterProducts(int minPrice, int maxPrice, int category) {
  		List<ProductModel> products = new ArrayList<>();
  		try (Connection con = getConnection()) {
  			try (PreparedStatement st = con.prepareStatement(StringUtils.GET_FILTER_PRODUCTS)) {
  				st.setInt(1, minPrice);
  				st.setInt(2, maxPrice);
  				st.setInt(3, category);
  				try (ResultSet rs = st.executeQuery()) {
  					while (rs.next()) {
  						ProductModel product = new ProductModel();
  						product.setName(rs.getString("name"));
  						product.setDescription(rs.getString("description"));
  						product.setPrice(rs.getFloat("price"));
  						product.setStock(rs.getInt("stock"));
  						product.setCategoryName(rs.getString("category_name"));
  						product.setProductId(rs.getInt("product_id"));
  						;
  						products.add(product);
  					}
  				}
  			}
  		} catch (SQLException | ClassNotFoundException ex) {
  			ex.printStackTrace();
  		}
  		return products;
  	}

  	public List<ProductModel> searchProducts(String Search) {
  		Search = "%" + Search + "%";
  		List<ProductModel> products = new ArrayList<>();
  		try (Connection con = getConnection()) {
  			try (PreparedStatement st = con.prepareStatement(StringUtils.GET_SEARCH_PRODUCTS)) {
  				st.setString(1, Search);
  				st.setString(2, Search);
  				try (ResultSet rs = st.executeQuery()) {
  					while (rs.next()) {
  						ProductModel product = new ProductModel();
  						product.setName(rs.getString("name"));
  						product.setDescription(rs.getString("description"));
  						product.setPrice(Float.parseFloat(rs.getString("price")));
  						product.setStock(Integer.parseInt(rs.getString("stock")));
  						product.setCategoryName(rs.getString("category_name"));
  						product.setProductId(rs.getInt("product_id"));
  						products.add(product);
  					}
  				}
  			}
  		} catch (SQLException | ClassNotFoundException ex) {
  			ex.printStackTrace();
  		}
  		return products;
  	}

  	public List<ProductModel> getProduct(int productId) {
  		List<ProductModel> product = new ArrayList<>();
  		try (Connection con = getConnection()) {
  			try (PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT)) {
  				st.setInt(1, productId);
  				try (ResultSet rs = st.executeQuery()) {
  					while (rs.next()) {
  						ProductModel singleProduct = new ProductModel();
  						singleProduct.setName(rs.getString("name"));
  						singleProduct.setDescription(rs.getString("description"));
  						singleProduct.setPrice(Float.parseFloat(rs.getString("price")));
  						singleProduct.setStock(Integer.parseInt(rs.getString("stock")));
  						singleProduct.setCategoryName(rs.getString("category_name"));
  						singleProduct.setProductId(rs.getInt("product_id"));
  						singleProduct.setImageUrl(rs.getString("images"));
  						product.add(singleProduct);
  					}
  				}
  			}
  		} catch (SQLException | ClassNotFoundException ex) {
  			ex.printStackTrace();
  		}
  		return product;
  	}

  	public int addProduct(ProductModel product) {
  		try (Connection con = getConnection();
  				PreparedStatement st = con.prepareStatement(StringUtils.INSERT_PRODUCT)) {
  			st.setString(1, product.getName());
  			st.setString(2, product.getDescription());
  			st.setInt(3, product.getStock());
  			st.setInt(4, product.getCategory());
  			st.setFloat(5, product.getPrice());
  			st.setString(6, product.getImageUrlFromPart());
  			int rowsAffected = st.executeUpdate();
  			return rowsAffected;
  		} catch (SQLException | ClassNotFoundException e) {
  			System.out.println(e.getMessage());
  			return 0;
  		}
  	}
  	

//  	public int addCategory(CategoryModel category) {
//  	    try (Connection con = getConnection();
//  	         PreparedStatement st = con.prepareStatement(StringUtils.INSERT_CATEGORY)) {
//  	    	 st.setString(1, category.getCategoryName());
//  	    	int result = st.executeUpdate();
//            return result > 0 ? 1 : 0;
//        } catch (SQLException | ClassNotFoundException e) {
//  			System.out.println(e.getMessage());
//  			return 0;
//  		}
//  	    	 	 
//  	}
//  	public class ProductDao {
//  		private Connection con;
//
//  		private String query;
//  	    private PreparedStatement pst;
//  	    private ResultSet rs;
//  	    
//
//  		public ProductDao(Connection con) {
//  			super();
//  			this.con = con;
//  		}
//  		
//  		public double getTotalCartPrice(ArrayList<CartModel> cartList) {
//  	        double sum = 0;
//  	        try {
//  	            if (cartList.size() > 0) {
//  	                for (CartModel item : cartList) {
//  	                    query = "select price from products where id=?";
//  	                    pst = this.con.prepareStatement(query);
//  	                    
//  	                    rs = pst.executeQuery();
//  	                    while (rs.next()) {
//  	                        sum+=rs.getDouble("price")*item.getQuantity();
//  	                    }
//
//  	                }
//  	            }
//
//  	        } catch (SQLException e) {
//  	            e.printStackTrace();
//  	            System.out.println(e.getMessage());
//  	        }
//  	        return sum;
//  	    }
//    public List<CartModel> getCartProducts(ArrayList<CartModel> cartList) {
//        List<CartModel> book = new ArrayList<>();
//        try {
//            if (cartList.size() > 0) {
//                for (CartModel item : cartList) {
//                    pst = this.con.prepareStatement(query);
//                    pst.setInt(1, item.getId());
//                    rs = pst.executeQuery();
//                    while (rs.next()) {
//                        CartModel row = new CartModel();
//                        row.setPrice(rs.getDouble("price")*item.getQuantity());
//                        row.setQuantity(item.getQuantity());
//                        book.add(row);
//                    }
//
//                }
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            System.out.println(e.getMessage());
//        }
//        return book;
//    }
//}
}
  	
