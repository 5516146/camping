package com.camping.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.MemberVO;
import com.camping.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CommonController {
	
	@GetMapping("/accessError") // /access를 처리하도록 지정, accessError.jsp를 찾아감
	public void accessDenied(Authentication auth, Model model) { //Authentication은 필요한 경우에 사용자의 정보를 확인할 수 있게 함

		log.info("접근이 제한됩니다!!!! : " + auth);
		
		model.addAttribute("msg", "접근이 제한됩니다!!!!!");
	}

	@GetMapping("/customLogin") // 2. /customLogin을 처리하도록 지정, customLogin.jsp를 찾아감
	public void loginInput(String error, String logout, Model model, MemberVO vo, RedirectAttributes rttr, String mem_id) {

		log.info("error: " + error); //2. home.jsp에서 login 버튼을 누르면 콘솔에 이 두 개의 로그가 찍힘(null)
		log.info("logout: " + logout);
		if (error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

//	@GetMapping("/customLogout") // /customLogout을 처리하도록 지정, customLogout.jsp를 찾아감
//	public void logoutGET()  {
//
//		log.info("겟 로그아웃 겟!!!!!!!!!!!!");
//		
//	//	response.sendRedirect("/question");
//	}
//	
//	@PostMapping("/customLogout")
//	public void logoutPost() {
//		// post에서 넘어와 처리하는 메서드
//		log.info("post custom logout");
//		
//		response.sendRedirect("/question");
//	}

	

}
