package cx.learningcenter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cx.learningcenter.inter.IUserOperation;
import cx.learningcenter.model.User;

@Controller
//@RequestMapping("/signup")
public class SignupController {
	
	@Autowired
	IUserOperation userService;
	
	@RequestMapping("/signup")
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response){
		String message = "signup message";
		ModelAndView mav=new ModelAndView("signup");
		mav.addObject("message", message);
		return mav;
	}
	
	@RequestMapping("/signup/adduser")
	public ModelAndView addUser(HttpServletRequest request,HttpServletResponse response){
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		ModelAndView mav=new ModelAndView("welcome");
		mav.addObject("username", userName);
		mav.addObject("password", passWord);
		User user = new User();
		user.setUserName(userName);
		user.setPassWord(passWord);
		userService.addUser(user);
		return mav;
	}
}
