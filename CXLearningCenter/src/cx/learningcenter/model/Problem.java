package cx.learningcenter.model;

public class Problem {

	private int id;
	private String title;
	private String description;
	private String answer;
	private int hardness;
	private int category;
	private int imageNum_d;
	private int imageNum_a;
	private String imageurl1;
	private String imageurl2;
	private String imageurl3;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getImageNum_d() {
		return imageNum_d;
	}
	public void setImageNum_d(int imageNum_d) {
		this.imageNum_d = imageNum_d;
	}
	public int getImageNum_a() {
		return imageNum_a;
	}
	public void setImageNum_a(int imageNum_a) {
		this.imageNum_a = imageNum_a;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getHardness() {
		return hardness;
	}
	public void setHardness(int hardness) {
		this.hardness = hardness;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getImageurl1() {
		return imageurl1;
	}
	public void setImageurl1(String imageurl1) {
		this.imageurl1 = imageurl1;
	}
	public String getImageurl2() {
		return imageurl2;
	}
	public void setImageurl2(String imageurl2) {
		this.imageurl2 = imageurl2;
	}
	public String getImageurl3() {
		return imageurl3;
	}
	public void setImageurl3(String imageurl3) {
		this.imageurl3 = imageurl3;
	}
	
	
}
