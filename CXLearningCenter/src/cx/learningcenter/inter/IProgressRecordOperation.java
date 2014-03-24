package cx.learningcenter.inter;

import cx.learningcenter.model.ProgressRecord;

public interface IProgressRecordOperation {

	public ProgressRecord selectProgressRecordByUserid(int id);
}
