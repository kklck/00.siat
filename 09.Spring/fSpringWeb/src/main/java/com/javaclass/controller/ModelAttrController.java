package com.javaclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.model.MemberVO;

@Controller
public class ModelAttrController {

	@RequestMapping("modelAttr.do")
	public void modelAttr() {
		System.out.println("modelAttr.do 요청 확인");
	}
	
	@ModelAttribute("message")//별도의 선언 없이 매개변수 별칭 붙히는 것 처럼 같이 옴
	public String str() {
		return "행복한 버거킹";
	}
	
	@ModelAttribute("memberVO")
	public MemberVO obj() {
		MemberVO vo = new MemberVO();
		vo.setId("kklck");
		vo.setName("김광운");
		vo.setAge(25);
		return vo;
	}
}
