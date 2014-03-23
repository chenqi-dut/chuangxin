package cx.learningcenter.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/problem/{problemId}", method = RequestMethod.GET)
	public @ResponseBody String getProblem(@PathVariable int problemId) {
 		
		Problem problem = new Problem();
		problem = problemMapper.selectProblemById(problemId);
//		return problem;
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = "";
		try {
			json = ow.writeValueAsString(problem);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
 
	}
	
	@RequestMapping(value="/problems", method = RequestMethod.GET)
	public @ResponseBody String getProblems() {
 		
		List<Problem> problems = new ArrayList<Problem>();
		problems = problemMapper.selectProblems();
//		return problem;
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = "";
		try {
			json = ow.writeValueAsString(problems);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
 
	}
	
/*	@RequestMapping(value="/getproblemids/{hardness}/{category}",method = RequestMethod.GET)
	public @ResponseBody String getProblemIds(@PathVariable int hardness,@PathVariable int category){
		
	}*/
}





