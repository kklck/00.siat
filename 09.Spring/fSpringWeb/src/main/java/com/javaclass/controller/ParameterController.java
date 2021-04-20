package com.javaclass.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaclass.model.MemberVO;

@Controller
public class ParameterController {

	
	@RequestMapping("/param.do")
	public void param(String id, @RequestParam(defaultValue = "0") int age) {
		System.out.println("param.do 요청 확인");
	}
	
	@RequestMapping(value="/paramForm.do",method = RequestMethod.POST)
	public void paramForm(MemberVO memberVO, HttpSession session) {
		System.out.println("paramForm.do 요청 확인");
		String id = "kklck";//후에 M에서 가져올 예정
		String name = "김광운";
		if(memberVO.getId().equals(id) && memberVO.getName().equals(name)) {
			//로그인 확인되면 세션 처리
			session.setAttribute("login", id+"님 로그인 중");
		}
	}
}
