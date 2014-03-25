package cx.learningcenter.inter;

import cx.learningcenter.model.Problem;

import java.util.List;

import org.apache.ibatis.annotations.Param;
public interface IProblemOperation {
	
	public Problem selectProblemById(int id);
	public List<Problem> selectProblems();
	public List<Integer> selectProblemids(@Param("hardness") int hardness,@Param("category") int category);
}