package com.javaclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.model.MemberVO;
import com.javaclass.model.MemberVOList;

@Controller		//디스파쳐 전달
public class ListController {
	
	@RequestMapping("/multiInsert.do")
	public void list(MemberVOList memberVOList) {
			System.out.println("/multiInsert.do 요청 ");
			for(MemberVO vo : memberVOList.getList()) {
				System.out.println(vo.isState() + "/"+vo.getId()+ "/"+vo.getName()+ "/"+vo.getAge());
			}
	}
	// /multiInsert.do 가 void return 시 /multiInsert.jsp 페이지 보여줌
}
