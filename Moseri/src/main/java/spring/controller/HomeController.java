package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.MemberDto;
import spring.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberservice;
	//home
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	// 회원가입(get)
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
	// 회원가입(post)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest request, @ModelAttribute MemberDto memberDto) throws Exception {
		
		memberservice.register(request, memberDto);
		
		return "redirect:/home";
	}
	
	// 로그인(get)
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	// 로그인(post)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, @ModelAttribute MemberDto memberDto)
			throws Exception {
		
		boolean result = memberservice.login(request, response, memberDto);
		if (result) {
			return "redirect:/home";
		} else {
			return "redirect:/login";
		}
		
	}
	@RequestMapping("/info/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	@RequestMapping("/info/request")
	public String request() {
		
		return "mypage/request";
		
	}
	
	
}