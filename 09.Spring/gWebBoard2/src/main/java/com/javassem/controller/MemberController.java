package com.javassem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javassem.domain.MemberVO;
import com.javassem.service.MemberService;

@Controller
@RequestMapping("user")
public class MemberController {
	
	@Autowired
	MemberService memberService; 

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
			return "user/userLogin.do";
		}else {
			System.out.println("로그인 성공");
			session.setAttribute("id", vo.getUserId());
			return "redirect:/user/login_ok.do";
		}
	}
	
	@RequestMapping("login_ok.do")
	public void login_ok() {
		System.out.println("로그인 끝");
	}
}
