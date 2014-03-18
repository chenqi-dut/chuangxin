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
@RequestMapping("/user")
public class UserController {
	@Autowired
	IUserOperation userMapper;

	@RequestMapping("/select")
	public ModelAndView listall(HttpServletRequest request,HttpServletResponse response){
		User user=userMapper.selectUserById(1); 
		ModelAndView mav=new ModelAndView("welcome");
		mav.addObject("user",user);
		return mav;
	}
}