package cx.learningcenter.model;

public class Category {
	private int id;
	private String categoryName;
	private int problemCounter;
	public int getProblemCounter() {
		return problemCounter;
	}
	public void setProblemCounter(int problemCounter) {
		this.problemCounter = problemCounter;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}
