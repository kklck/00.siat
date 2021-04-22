package com.javassem.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javassem.domain.MemberVO;
import com.javassem.service.MemberService;

@Controller
@RequestMapping("user")
public class MemberController {
	
	@Autowired
	MemberService memberService; 
	
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		System.out.println("자신 반환하는 모든 동작 : " + step);
		return "user/"+step;
	}

	@RequestMapping("userJoin.do")
	public void userJoin() {
		System.out.println("회원가입 실행");
	}
	
	@RequestMapping("userInsert.do")
	public String userInsert(MemberVO vo) {
		int result = memberService.userInsert(vo);
		System.out.println("회원가입 성공");
		return "redirect:/user/userJoin_ok.do";
	}
	
	@RequestMapping("userJoin_ok.do")
	public void userJoin_ok() {
		System.out.println("회원가입 성공 페이지로");
	}
	
	@RequestMapping("userLogin.do")
	public void userLogin() {
		System.out.println("로그인 실행");
	}
	
	@RequestMapping("login.do")
	public String login(MemberVO vo, HttpSession session) {
		MemberVO result = memberService.idCheck_Login(vo);
		if(result == null) {
			System.out.println("로그인 실패");
			return "user/userLogin";
		}else {
			System.out.println("로그인 성공");
			session.setAttribute("id", vo.getUserId());
			return "user/login_ok";
		}
	}
	
	@RequestMapping("login_ok.do")
	public void login_ok() {
		System.out.println("로그인 끝");
	}
	
	@RequestMapping("Main.do")
	public void mainn(Model m) {
		m.addAttribute("list",memberService.getMemberList());
	}
	
	@RequestMapping("memberInfo.do")
	public void info(Model m, HttpSession session, MemberVO vo) {
		vo.setUserId((String)session.getAttribute("id"));
		m.addAttribute("mem",memberService.idCheck_Login(vo));
	}
	
	@RequestMapping(value="userSearch.do",produces="application/text; charset=utf-8")//아약스 인코딩
	@ResponseBody	//아약스 필수
	public String userSearch(Model m, String key, String val) {
		HashMap map = new HashMap();
		map.put("key", key);//제목 : 에취
		map.put("val", val);
		List<MemberVO> List = memberService.getMemberList(map);
		
		return "user/";
	}
	
	@RequestMapping(value="idCheck.do",produces="application/text; charset=utf-8")//아약스 인코딩
	@ResponseBody	//아약스 필수
	public String idCheck(Model m, MemberVO vo) {
		String message = "중복입니다";
		if(memberService.idCheck_Login(vo)==null) {
			message = "사용 쌉가능";
		}
		return message;
	}
}
