package cx.learningcenter.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cx.learningcenter.helper.JsonHelper;
import cx.learningcenter.inter.ICategoryOperation;
import cx.learningcenter.inter.IHardnessOperation;
import cx.learningcenter.inter.IProblemOperation;
import cx.learningcenter.inter.IProgressRecordOperation;
import cx.learningcenter.model.Category;
import cx.learningcenter.model.Hardness;
import cx.learningcenter.model.Problem;
import cx.learningcenter.model.ProgressRecord;

@Controller
@RequestMapping(value="/user")
public class UserProblemController {
	
	@Autowired
	IProblemOperation problemMapper;
	@Autowired
	IHardnessOperation hardnessMapper;
	@Autowired
	ICategoryOperation categoryMapper;
	@Autowired
	IProgressRecordOperation progressrecordMapper;
	
	@RequestMapping(value="/testproblem", method = RequestMethod.GET)
	public ModelAndView printWelcome(HttpServletRequest request,HttpServletResponse response ) {
 		
		ModelAndView mav=new ModelAndView("testproblem");
		Problem problem = new Problem();
		problem = problemMapper.selectProblemById(1);
		mav.addObject("problem", problem);
		return mav;
 
	}
	
	@RequestMapping(value="/progresspage", method = RequestMethod.GET)
	public ModelAndView userprogress(HttpServletRequest request,HttpServletResponse response ) {
 		
		ModelAndView mav=new ModelAndView("userprogress");
		return mav;
 
	}
	
	@RequestMapping(value="/learningcenterpage", method = RequestMethod.GET)
	public ModelAndView userlearningcenter(HttpServletRequest request,HttpServletResponse response ) {
 		
		ModelAndView mav=new ModelAndView("userlearningcenter");
		return mav;
 
	}
	
	@RequestMapping(value="/menupage", method = RequestMethod.GET)
	public ModelAndView usercontent(HttpServletRequest request,HttpServletResponse response ) {
 		
		ModelAndView mav=new ModelAndView("usermenu");
		return mav;
 
	}
	
	@RequestMapping(value="/problem/{problemId}", method = RequestMethod.GET)
	public @ResponseBody String getProblem(@PathVariable int problemId) {
 		
		Problem problem = new Problem();
		problem = problemMapper.selectProblemById(problemId);
		String json = JsonHelper.convertToJson(problem);
		return json;
 
	}
	
	@RequestMapping(value="/problems", method = RequestMethod.GET)
	public @ResponseBody String getProblems() {
 		
		List<Problem> problems = new ArrayList<Problem>();
		problems = problemMapper.selectProblems();
		String json = JsonHelper.convertToJson(problems);
		return json;
	}
	
	@RequestMapping(value="/hardnesses", method = RequestMethod.GET)
	public @ResponseBody String getHardnesses() {
 		
		List<Hardness> hardnesses = new ArrayList<Hardness>();
		hardnesses = hardnessMapper.selectHardnesses();
		String json = JsonHelper.convertToJson(hardnesses);
		return json;
	}
	
	@RequestMapping(value="/categories", method = RequestMethod.GET)
	public @ResponseBody String getCategories() {
 		
		List<Category> categories = new ArrayList<Category>();
		categories = categoryMapper.selectCategories();
		String json = JsonHelper.convertToJson(categories);
		return json;
	}
	
	@RequestMapping(value="/progress/{username}", method = RequestMethod.GET)
	public @ResponseBody String getProgressByUserName(@PathVariable String username) {
 		
		ProgressRecord pr = new ProgressRecord();
		pr = progressrecordMapper.selectProgressRecordByUserid(3);
		String json = JsonHelper.convertToJson(pr);
		return json;
	}
	
	@RequestMapping(value="/progress", method = RequestMethod.GET)
	public @ResponseBody String getProgress(Authentication auth) {
 		
		User user =(User) auth.getPrincipal();
		String json = getProgressByUserName(user.getUsername());
		return json;
	}
/*	@RequestMapping(value="/getproblemids/{hardness}/{category}",method = RequestMethod.GET)
	public @ResponseBody String getProblemIds(@PathVariable int hardness,@PathVariable int category){
		
	}*/
}





