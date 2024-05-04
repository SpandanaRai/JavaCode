package model;


public class CategoryModel {
	private String category_name;
	
	public CategoryModel(String category_name) {
		super();
		this.category_name = category_name;
		
	}
	public CategoryModel() {
			
	}
	 // Getter and setter for name field
	public String getCategoryName() {
		return category_name;
	}
	public void setCategoryName(String category_name) {
		this.category_name = category_name;
	}
	
}