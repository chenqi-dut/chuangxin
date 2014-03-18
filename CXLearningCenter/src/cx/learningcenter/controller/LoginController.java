package cx.learningcenter.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value="/welcome", method = RequestMethod.GET)
	public ModelAndView printWelcome(HttpServletRequest request,HttpServletResponse response ) {
 
//		String name = principal.getName();
		
		ModelAndView mav=new ModelAndView("hello");
//		mav.addObject("user",user);
/*		mav.addObject("username", name);
		mav.addObject("message", "Spring Security Custom Form example");*/
		return mav;
 
	}
    
    @RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
 
    	ModelAndView mav=new ModelAndView("login");
		return mav;
 
	}
 
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public ModelAndView loginerror(HttpServletRequest request,HttpServletResponse response) {
 
		ModelAndView mav=new ModelAndView("login");
		return mav;
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response) {
 
		ModelAndView mav=new ModelAndView("login");
		return mav;
 
	}
	
}