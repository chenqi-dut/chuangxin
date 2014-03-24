package cx.learningcenter.inter;

import java.util.List;

import cx.learningcenter.model.Hardness;

public interface IHardnessOperation {
	public Hardness selectHardnessById(int id);
	public List<Hardness> selectHardnesses();
}
