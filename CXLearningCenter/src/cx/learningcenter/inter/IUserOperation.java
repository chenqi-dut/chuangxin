package cx.learningcenter.inter;

import java.util.List;

import cx.learningcenter.model.User;

public interface IUserOperation {

	public User selectUserById(int id);
	public List<User> selectUsers(String userName);	
	public void addUser(User user);
/*	public void updateUser(User user);
	public void deleteUser(int id);*/
	
}
