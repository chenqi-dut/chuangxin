package cx.learningcenter.inter;

import cx.learningcenter.model.Problem;
import java.util.List;
public interface IProblemOperation {
	
	public Problem selectProblemById(int id);
	public List<Problem> selectProblems();
	
}