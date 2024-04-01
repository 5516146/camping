package com.camping.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler { //로그인 한 사용자에게 부여되는 권한 객체를 이용해 사용자가 가진 모든 권한을 문자열로 체크
//로그인 성공 후 동작할 클래스
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		log.warn("Login Success");

		List<String> roleNames = new ArrayList<>(); //String 타입의 roleNames에 ArrayList<> 객체를 생성해 List 배열에 담음

		auth.getAuthorities().forEach(authority -> { //auth의 getAuthorities()를 반복 출력 시킴 -> 배열 객체에 반복되는 authority를 각각 추가함

			roleNames.add(authority.getAuthority());

		});

		log.warn("ROLE NAMES: " + roleNames);

		/*
		 * if (roleNames.contains("ROLE_ADMIN")) { //ROLE_ADMIN 권한을 가졌으면 로그인 후 바로
		 * /sample/admin으로 이동
		 * 
		 * response.sendRedirect("/sample/admin"); return; }
		 * 
		 * if (roleNames.contains("ROLE_MEMBER")) { //ROLE_ADMIN 권한을 가졌으면 로그인 후 바로
		 * /sample/member로 이동
		 * 
		 * response.sendRedirect("/sample/member"); return; }
		 */
		
		
		response.sendRedirect("/");
	}
}


