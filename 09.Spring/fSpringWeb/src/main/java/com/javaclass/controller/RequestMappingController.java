package com.javaclass.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.model.MemberVO;

@Controller
@RequestMapping("/re")
public class RequestMappingController {

	@RequestMapping(value= {"a.do","/b.do"})// 두 개 이상 매핑할 때는 value로 감싸기
	public String test() {
		System.out.println("/a.do, /b.do 요청 확인");
		return "hello"; //view 단의 hello.jsp 호출
	}
	/*	뷰 페이지 지정
	 * 	1. ModelAndView에 setViewName()
	 * 	2. Stirng으로 뷰페이지 return, 
	 */
	
	//void return의 경우, 매핑명과 동일한 view의 jsp로 연결
	@RequestMapping("c.do") //이름이 동일한 view의 c.jsp로 이동
	public void xxxx(String id) {//파라미터를 받아옴
		System.out.println("/c.do 요청 확인" + id);
	}
	
	@RequestMapping(value="request.do")
	public void req(@ModelAttribute("vo") MemberVO vo) {
		System.out.println("/re/request.do 요청 확인");
	}
}
