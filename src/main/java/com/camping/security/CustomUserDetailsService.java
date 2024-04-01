package com.camping.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.camping.domain.MemberVO;
import com.camping.mapper.MemberMapper;
import com.camping.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomUserDetailsService implements UserDetailsService { //추상 메서드 하나만 가지고 있고 리턴 타입은 org.springframework.security.core.userdetails.UserDetails
//사용자 정보와 권한 정보를 가짐
	@Setter(onMethod_ = { @Autowired }) //의존성 주입
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String mem_id) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + mem_id);
		log.info("@@@@@@@@@@@"+mem_id);
		// userName means userid
		MemberVO vo = memberMapper.read(mem_id); //MemberMapper를 이용해 MemberVO 조회

		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo); //vo가 null이면 null 반환, null이 아니면 CustomUser(vo) 객체 반환
	} 

}
