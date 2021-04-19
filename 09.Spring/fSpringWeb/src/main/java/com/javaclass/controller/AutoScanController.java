package com.javaclass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javaclass.model.MemberVO;

@Controller
public class AutoScanController {
	
	
  /*VO 지정법
	1. 생성자(xml 컨스트럭터 아규)
	2. 세터(xml 프로퍼티)
	3. annotation
  */
	@Autowired
	private MemberVO vo;//xml의 id 값과 같게

	@RequestMapping("/autoScan.do")
	public ModelAndView auto() {
		System.out.println("autoScan.do 요청 확인");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("autoScan");
		mv.addObject("vo",vo);
		return mv;
	}
}
