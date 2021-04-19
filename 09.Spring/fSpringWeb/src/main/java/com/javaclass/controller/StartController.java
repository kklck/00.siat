package com.javaclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller	//새로운 패키지르 만들었기 때문에, servlet-context의 스캔 링크를 잘 보도록 하자.
public class StartController {

	@RequestMapping("/start.do")
	public ModelAndView start() {
		System.out.println("start.do 요청확인");
		ModelAndView mv = new ModelAndView();
		mv.addObject("message","ㅎㅇㅌ");
		mv.setViewName("hello");//servlet-context에 접두미사 지정함
		return mv;
	}
}
