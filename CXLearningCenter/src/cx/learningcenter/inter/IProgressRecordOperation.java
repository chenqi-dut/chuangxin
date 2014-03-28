package cx.learningcenter.inter;

import org.apache.ibatis.annotations.Param;

import cx.learningcenter.model.ProgressRecord;

public interface IProgressRecordOperation {

	public ProgressRecord selectProgressRecordByUserid(int id);
	public void setProgressRecordByUserid(@Param("userid") int userid,@Param("problemid") int problemid);
}
