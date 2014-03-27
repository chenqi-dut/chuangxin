package cx.learningcenter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.authentication.AuthenticationManagerFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import cx.learningcenter.inter.IUserOperation;
import cx.learningcenter.model.User;

@Controller
// @RequestMapping("/signup")
public class SignupController {

	@Autowired
	IUserOperation userMapper;
	@Autowired
	protected AuthenticationManager authenticationManager;

	@RequestMapping("/signup")
	public ModelAndView show(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "message", required = false) String message) {

		ModelAndView mav = new ModelAndView("signup");
		if (message != null) {
			message = "用户名已存在，请重新注册！";
			mav.addObject("message", message);
		}
		return mav;
	}

	@RequestMapping("/signup/adduser")
	public ModelAndView addUser(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		User user = new User();
		user.setUserName(userName);
		user.setPassWord(passWord);

		User dbuser = new User();
		dbuser = userMapper.selectUserByUsername(userName);
		if (dbuser != null) {
			ModelAndView mav = new ModelAndView(new RedirectView(
					"../signup.html"));
			mav.addObject("message", "signup failed");
			return mav;
		}
		userMapper.addUser(user);
		authenticateUserAndSetSession(user, request);
		return new ModelAndView(new RedirectView("../user/progresspage.html"));
	}

	private void authenticateUserAndSetSession(User user,
			HttpServletRequest request) {
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(
				user.getUserName(), user.getPassWord());

		// generate session if one doesn't exist
		request.getSession();

		token.setDetails(new WebAuthenticationDetails(request));
		try {
			Authentication authenticatedUser = authenticationManager
					.authenticate(token);

			SecurityContextHolder.getContext().setAuthentication(
					authenticatedUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
