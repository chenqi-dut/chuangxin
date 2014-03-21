package cx.learningcenter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cx.learningcenter.inter.IProblemOperation;
import cx.learningcenter.model.Problem;

@Controller
@RequestMapping(value="/user")
public class UserProblemController {
	
	@Autowired
	IProblemOperation problemMapper;
	
	@RequestMapping(value="/testproblem", method = RequestMethod.GET)
	public ModelAndView printWelcome(HttpServletRequest request,HttpServletResponse response ) {
 		
		ModelAndView mav=new ModelAndView("testproblem");
		Problem problem = new Problem();
		problem = problemMapper.selectProblemById(1);
		mav.addObject("problem", problem);
		return mav;
 
	}
	
	@RequestMapping(value="/testprimary", method = RequestMethod.GET)
	public ModelAndView primary(HttpServletRequest request,HttpServletResponse response ) {
 		
		ModelAndView mav=new ModelAndView("testprimary");
		Problem problem = new Problem();
		problem = problemMapper.selectProblemById(1);
		mav.addObject("problem", problem);
		return mav;
 
	}
}