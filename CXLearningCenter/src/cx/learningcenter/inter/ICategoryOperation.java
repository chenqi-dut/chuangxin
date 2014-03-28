package cx.learningcenter.inter;

import java.util.List;

import cx.learningcenter.model.Category;

public interface ICategoryOperation {
	public List<Category> selectCategories(int hardness); 
	public Category selectCategoryById(int id);
}
