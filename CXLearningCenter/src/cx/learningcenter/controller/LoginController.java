package cx.learningcenter.controller;

import java.security.Principal;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class LoginController {

	@RequestMapping(value="/welcome", method = RequestMethod.GET)
	public View printWelcome(HttpServletRequest request,HttpServletResponse response ) {
 
//		String name = principal.getName();
		
		//ModelAndView mav = new ModelAndView("user/progresspage");
		Set<String> roles = AuthorityUtils
                .authorityListToSet(SecurityContextHolder.getContext()
                        .getAuthentication().getAuthorities());
        if (roles.contains("ROLE_ADMIN")) {
        	return new RedirectView("admin/adminpage.html");
        }
        return new RedirectView("user/progresspage.html");
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