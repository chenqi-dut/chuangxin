package cx.learningcenter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import cx.learningcenter.inter.IUserOperation;
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
	@Autowired
	IUserOperation userMapper;
	
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
	
	@RequestMapping(value="/userinfopage", method = RequestMethod.GET)
	public ModelAndView userinfo(HttpServletRequest request,HttpServletResponse response ) {
 		
		ModelAndView mav=new ModelAndView("userinfo");
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
	
	@RequestMapping(value="/problemids/{hardness}/{category}", method = RequestMethod.GET)
	public @ResponseBody String getProblemids(@PathVariable int hardness,@PathVariable int category) {
 		
		List<Integer> ids = new ArrayList<Integer>();
		ids = problemMapper.selectProblemids(hardness,category);
		String json = JsonHelper.convertToJson(ids);
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
	
	@RequestMapping(value="/categories/{hardness}", method = RequestMethod.GET)
	public @ResponseBody String getCategories(@PathVariable int hardness) {
 		
		List<Category> categories = new ArrayList<Category>();
		categories = categoryMapper.selectCategories(hardness);
		String json = JsonHelper.convertToJson(categories);
		return json;
	}
	
	@RequestMapping(value="/progress/{username}", method = RequestMethod.GET)
	public @ResponseBody String getProgressByUserName(@PathVariable String username) {
 		
		cx.learningcenter.model.User user = new cx.learningcenter.model.User();
		// todo: 将两次查询通过resultmap关联压缩成一次，以提高效率，减少查询次数
		user = userMapper.selectUserByUsername(username);
		if(user == null){
			return "null";
		}
		ProgressRecord pr = progressrecordMapper.selectProgressRecordByUserid(user.getId());
		
		if(pr == null){
			return "null";
		}
		Category cat = categoryMapper.selectCategoryById(pr.getProblem().getCategory());
		
		Hardness hard = hardnessMapper.selectHardnessById(pr.getProblem().getHardness());
		
		Map<String,Object> a = new HashMap<String,Object>();
		a.put("progressRecord", pr);
		a.put("category", cat);
		a.put("hardness", hard);
		
		String json = JsonHelper.convertToJson(a);
		return json;
	}
	
	@RequestMapping(value="/progress", method = RequestMethod.GET)
	public @ResponseBody String getProgress(Authentication auth) {
 		
		User user =(User) auth.getPrincipal();
		String json = getProgressByUserName(user.getUsername());
		return json;
	}
	
	@RequestMapping(value="/setprogress/{problemid}", method = RequestMethod.GET)
	public @ResponseBody void setProgress(Authentication auth,@PathVariable int problemid) {
 		
		User user =(User) auth.getPrincipal();
		// todo: 将两次查询通过resultmap关联压缩成一次，以提高效率，减少查询次数
		cx.learningcenter.model.User dbuser = new cx.learningcenter.model.User();
		dbuser = userMapper.selectUserByUsername(user.getUsername());
		progressrecordMapper.setProgressRecordByUserid(dbuser.getId(),problemid);
/*		String json = "";
		return json;*/
	}
/*	@RequestMapping(value="/getproblemids/{hardness}/{category}",method = RequestMethod.GET)
	public @ResponseBody String getProblemIds(@PathVariable int hardness,@PathVariable int category){
		
	}*/
	

}





