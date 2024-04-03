package com.camping.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.AuthVO;
import com.camping.domain.MemberVO;
import com.camping.security.CustomUserDetailsService;
import com.camping.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/member/*")
@Controller
@Log4j2
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private CustomUserDetailsService service;

	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwEncoder;

	private String username; //input 태그의 아이디
	
	private int authNumber;
	
	//00. 접근 제한 페이지
	@RequestMapping(value = "/accessError") // /access를 처리하도록 지정, accessError.jsp를 찾아감
	public void accessDenied(Authentication auth, Model model) { // Authentication은 필요한 경우에 사용자의 정보를 확인할 수 있게 함

		log.info("관리자 전용입니다!!!! : " + auth);
		model.addAttribute("msg", "접근 권한이 부족합니다.");
	}
	
	// --------------로그인---------------
	//01. 로그인
	@RequestMapping(value = {"/customLogin"}) // 2. /customLogin을 처리하도록 지정, customLogin.jsp를 찾아감
	public void loginInput(String error, String logout) {
		log.info("accessDenied 페이지 가기 전에 찍고 가는지 확인하는 용");
		log.info("error: " + error); // 2. home.jsp에서 login 버튼을 누르면 콘솔에 이 두 개의 로그가 찍힘(null)
		log.info("logout: " + logout);
	}
	// --------------마이페이지---------------
	//02. 마이페이지 메인
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping("/myInfo")
	public void myPageInfo(HttpServletRequest request) {
		log.info("메인페이지에서 마이페이지로 넘어감");
		request.removeAttribute("chk"); //로그인 성공 메시지 초기화
	}
	
	//03. 내 계정 페이지로 이동
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping("/myAccount")
	public void myAccountGet(@AuthenticationPrincipal ModelMap modelMap, Principal principal) {
		log.info("마이페이지에서 내계정 페이지로 넘어감");
		
		String username = principal.getName(); //get logged in username
		MemberVO member = memberService.getMember(username);
		modelMap.addAttribute("member", member);
		
		log.info("username: "+username);
		log.info("member: "+member);
	}

//	@GetMapping("/myPage/identityVerification")
//	public void identityVerification() {
//		log.info("회원 정보 수정 전 본인 확인");
//	}

	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping("/updateForm")
	public void updateInfoForm(@AuthenticationPrincipal ModelMap modelMap, Principal principal) {
		log.info("회원 정보 수정하겠습니다");
		
		String username = principal.getName(); //get logged in username
		MemberVO member = memberService.getMember(username);
		modelMap.addAttribute("member", member);
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@PostMapping("/updateForm")
	public String modifyInfo(@ModelAttribute("member") MemberVO vo, Model model, HttpServletRequest request) {
		log.info("회원 정보 수정 버튼 눌렀습니다. ");
		String rawPw = request.getParameter("mem_pw");
		String encodePw = ""; //인코딩 후 비번
		
		if (rawPw != null) {
			rawPw = vo.getMem_pw(); //비밀번호 데이터 얻음
			encodePw = pwEncoder.encode(rawPw); //비밀번호 인코딩
			vo.setMem_pw(encodePw); //인코딩 된 비번을 다시 membervo 객체에 넣음
	    }
		if(vo != null && vo.getMem_pw() != null && vo.getMem_email() != null && vo.getMem_tel() != null) {
			memberService.updateForm(vo);
			
			model.addAttribute("result", "succ");
		} else {
			log.error("입력한 정보가 올바르지 않습니다.");
			model.addAttribute("result", "error");
		}
		
		log.info("이메일 업데이트 실행" + vo.getMem_email());
		log.info("전화번호 업데이트 실행" + vo.getMem_tel());
		log.info("아이디 확인" + vo.getMem_id());
		
		return "redirect:/";
	}

	private void sessionReset(String username) {
		UserDetails userDetails = service.loadUserByUsername(username);
		Authentication newAuth = new UsernamePasswordAuthenticationToken(username, null, userDetails.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuth);
	}
	
	//비밀번호 변경(암호화)
//	@PostMapping("/changePw")
//	public String changePw(@RequestParam Map<String, Object> paramMap,
//						   @ModelAttribute("member") MemberVO vo,
//						   RedirectAttributes rttr) {
//		paramMap.put("mem_id",vo.getMem_id());
//		int result = service.changePw(paramMap);
//		
//		String message = null;
//		String path = null;
//		
//		if(result > 0) {
//			message = "비밀번호 변경 성공!";
//			path = "/member/customLogin";
//		} else {
//			message = "현재 비밀번호가 일치하지 않습니다.";
//			path = "changePw";
//		}
//		rttr.addFlashAttribute("message", message);
//		return "redirect:" + path;
//	}
	
	// --------------회원탈퇴---------------
	// 회원 탈퇴를 위한 비밀번호 확인 페이지로 이동
    @GetMapping("/member/checkPassword")
    public void checkPassword(@AuthenticationPrincipal Model model, Principal principal) {
    	log.info("회원탈퇴를 위해 비밀번호 확인 페이지로 넘어갑니다.");
    	String username = principal.getName();
    	MemberVO member = memberService.getMember(username);
    	model.addAttribute("member", member);
    }
	// 회원 탈퇴를 위한 비밀번호 확인 + 탈퇴 메서드
    @PostMapping("/checkPassword")
    public void checkPassword(@AuthenticationPrincipal ModelMap model, Principal principal, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr, @ModelAttribute("member") MemberVO vo) {
    	String username = principal.getName();
    	String inputPassword = request.getParameter("password");
        log.info("비밀번호 확인 칸 입력값 확인: "+inputPassword);
        // 현재 사용자의 인증 정보 가져오기
		MemberVO currentPassword = memberService.getMember(username);
		log.info("currentPassword.getMem_pw() 확인: "+currentPassword.getMem_pw());
		model.addAttribute("currentPassword", currentPassword.getMem_pw());

		
        // 입력된 비밀번호와 현재 사용자의 비밀번호 비교
        boolean passwordMatches = matchPasswords(inputPassword, currentPassword.getMem_pw());
        // 응답 생성
//        request.setAttribute("success", passwordMatches);
        boolean resultAuth = false;
        boolean resultMember = false;
        if(passwordMatches) { //비교가 true일 때
        	try {
        		resultAuth = service.deleteAuth(username);
    			resultMember = service.deleteMember(username);
            	 			
    			if(resultAuth && resultMember) {
    				response.sendRedirect("redirect:/sample/all");
    			}
    			
    		} catch (Exception e) {
    		}
			model.addAttribute("result", "success");
			log.info("입력한 정보가 올바릅니다.");
		} else {
			log.error("입력한 정보가 올바르지 않습니다.");
			rttr.addFlashAttribute("result", "error");
		}
		
		log.info("비밀번호 확인");
    }

    // 비밀번호 일치 여부를 확인하는 메서드
    private boolean matchPasswords(String inputPassword, String currentPassword) {
        // 비밀번호 일치 여부를 적절한 방식으로 확인하여 반환
        return pwEncoder.matches(inputPassword, currentPassword);
    }

    // 다른 회원 관련 메서드들

	
	// --------------회원가입---------------
	@GetMapping("/join")
	public void joinGet() {
		log.info("회원가입 겟 실행");
	}

	@PostMapping("/join")
	public String joinPost(MemberVO vo, RedirectAttributes rttr) {
		log.info("회원가입 포스트 실행: 회원가입 성공 기원");
		log.info("vo" + vo);
		log.info("vo.getMem_id()" + vo.getMem_id());
		log.info("vo.getMem_name()" + vo.getMem_name());
		log.info("vo.getMem_email()" + vo.getMem_email());
		
		String rawPw = ""; //인코딩 전 비번
		String encodePw = ""; //인코딩 후 비번
		
		rawPw = vo.getMem_pw(); //비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); //비밀번호 인코딩
		vo.setMem_pw(encodePw); //인코딩 된 비번을 다시 membervo 객체에 넣음
//		String userName = request.getParameter(mem_id);
//		log.info("겟파라미터를 사용해도 안 넘어오는 거면 jsp 문제다.." + userName);
//		vo.setMem_id(userName);
//		log.info("vo.getMem_id: " + vo.getMem_id());
		// 기본 권한 설정
		// AuthVO 객체 생성
		AuthVO roleUser = new AuthVO();
		roleUser.setAuth("ROLE_USER");
		log.info("기본 권한 설정 확인" + roleUser.getAuth());

		// AuthVO 객체를 리스트에 추가
		List<AuthVO> authList = new ArrayList<>();
		authList.add(roleUser);
		log.info("기본 권한 설정 확인2" + authList);

		// setAuthList() 메서드 호출
		vo.setAuthList(authList);
		log.info("기본 권한 설정 확인3" + vo.getAuthList());

		// 회원가입 서비스 호출
		memberService.registerMember(vo);
		

		rttr.addFlashAttribute("result", "success");

		// 회원가입 성공 시 '/member/customLogin'으로 이동
		return "redirect:/member/customLogin";
	}

	// 아이디 중복 체크
//	@ResponseBody //응답 데이터 직접 반환
//	@PostMapping("/idCheck")
//	public Map idCheck(Principal principal) {
//		
//		String username = principal.getName();
//		MemberVO vo = memberService.getMember(username);
//		
//		boolean flag = (vo == null);
//		
//		Map map = new HashMap();
//		map.put("flag",  flag);
//		
//		return map;
//	}
	@GetMapping("/includes/header")
	public void header() {
		log.info("헤더");
	}
	
	//아이디 중복 체크
//	@ResponseBody
//	@PostMapping("/idCheck")
//	public String idCheck(@RequestParam("mem_id") String mem_id) {
//	    log.info("아이디 중복 체크중");
//
//	    try {
//	        MemberVO foundId = memberService.getIdById(mem_id);
//	        log.info("아이디 잘 찾는지 확인!!!!!: "+ foundId);
//	        if (foundId != null) { // 아이디가 존재하는 경우
//	            return "duplicate"; // 중복되는 아이디일 경우 "duplicate" 반환
//	        } else { // 아이디가 존재하지 않는 경우
//	            return "available"; // 사용 가능한 아이디일 경우 "available" 반환
//	        }
//	    } catch (Exception e) {
//	        // 예외 처리
//	        log.error("아이디를 찾는 중 오류 발생: " + e.getMessage());
//	        return "error";
//	    }
//	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkId(String mem_id) throws Exception {
		log.info("idCheck: " + mem_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean flag = memberService.checkId(mem_id);
		
		if (flag) {
			map.put("flag", flag);
		}
		
//		boolean result = memberService.checkId(mem_id);
//        
//		if(result) {
//			return flag;
//		}
		
		
		
        return map;
    }

	// 인증문자 발송
//	@RequestMapping(value = "sendMessage", method = { RequestMethod.GET })
//	public @ResponseBody void send(HttpServletRequest request) {
//
//		int randomNumber = (int) (Math.random() * 899999) + 100000; // 100000 ~ 999999까지의 무작위 수
//		setAuthNumber(randomNumber); // 나중의 인증코드 검증을 위해 세팅해놓음
//		System.out.println(getAuthNumber()); // (개발자)확인용
//		MessageService ms = new MessageService(); // 인증코드를 보내기 위해 만들어 놓은 객체
//		ms.sendMessage(request, Integer.toString(randomNumber)); // 휴대폰으로 인증코드 발송
//	}
//
//	private void setAuthNumber(int authNumber) {
//		this.authNumber = authNumber;
//	}
//
//	public int getAuthNumber() {
//		return authNumber;
//	}

	
	@GetMapping("/findAccount")
	public void findAcc() {
		log.info("아이디/비밀번호 찾기 페이지로 이동");
	}
	
	@PostMapping("/findId")
	public String findId(HttpServletRequest request, HttpServletResponse response, @AuthenticationPrincipal Model model, RedirectAttributes rttr) {
		log.info("아이디 찾기 버튼 클릭");
		 String mem_name = request.getParameter("mem_name"); // 사용자가 입력한 이름
		 String mem_tel = request.getParameter("mem_tel"); // 사용자가 입력한 전화번호
		 log.info("아이디 찾기!!!!!: "+ mem_name);
		 log.info("아이디 찾기!!!!!: "+ mem_tel);
	        
	        try {
	            // 사용자의 이름과 전화번호를 기반으로 아이디 조회
	            MemberVO foundId = memberService.findIdByNameAndPhoneNumber(mem_name, mem_tel);
	            log.info("아이디 잘 찾는지 확인!!!!!: "+ foundId);
	            if (foundId != null) { // 아이디가 존재하는 경우
	                // 조회된 아이디를 모델에 추가
	            	log.info("foundId.getMem_id(): "+ foundId.getMem_id());
	                model.addAttribute("foundId", foundId.getMem_id());
	                model.addAttribute("mem_name", mem_name);
	                // 아이디를 찾은 페이지로 리다이렉트
	                return "/member/findIdResult";
	            } else { // 아이디가 존재하지 않는 경우
	                // 아이디를 찾지 못한 경우 예외 처리
	                model.addAttribute("error", "아이디를 찾을 수 없습니다.");
	                return "/member/findIdResult";
	            }
	        } catch (Exception e) {
	            // 예외 처리
	            log.error("아이디를 찾는 중 오류 발생: " + e.getMessage());
	            model.addAttribute("error", "아이디를 찾는 중 오류가 발생했습니다.");
	            return "/member/findIdResult";
	        }
	    
		
	}
	
	@GetMapping("/findIdResult")
	public void findIdResult() {
		log.info("아이디찾기 성공");
	}
	
	@GetMapping("/main")
	public void mainPage() {
	}
	
	//휴대폰으로 비밀번호 찾기
	@GetMapping("/generateOTP")
	public void verificationForPhone() {
		
	}
	//이메일로 비밀번호 찾기
	@GetMapping("/sendPasswordResetEmail")
	public void verificationForEmail() {
		
	}
	
//	@RequestMapping(value = "/pw_auth.me")
//	public ModelAndView pw_auth(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws IOException {
//		String email = (String)request.getParameter("email");
//		String name = (String)request.getParameter("name");
//		
//		MemberVO vo = memberService.checkEmail(name, email);
//			
//		if(vo != null) {
//		Random r = new Random();
//		int num = r.nextInt(999999); // 랜덤난수설정
//		
//		if (vo.getMem_name().equals(name)) {
//			modelMap.addAttribute("email", vo.getMem_email());
//
//			String setfrom = "ivedot@naver.com"; // naver 
//			String tomail = email; //받는사람
//			String title = "[별빛누리캠핑장] 비밀번호변경 인증 이메일 입니다"; 
//			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
//					+ "별빛누리캠핑장 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
//
//			try {
//				MimeMessage message = mailSender.createMimeMessage();
//				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
//
//				messageHelper.setFrom(setfrom); 
//				messageHelper.setTo(tomail); 
//				messageHelper.setSubject(title);
//				messageHelper.setText(content); 
//
//				mailSender.send(message);
//			} catch (Exception e) {
//				System.out.println(e.getMessage());
//			}
//
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("YM/pw_auth");
//			mv.addObject("num", num);
//			return mv;
//		}else {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("YM/pw_find");
//			return mv;
//		}
//		}else {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("YM/pw_find");
//			return mv;
//		}
//}
}
