package com.javaclass.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReturnTypeController {

	@RequestMapping("modelandview.do")
	public ModelAndView MAV() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "모앤뷰 맛 점");
		mv.addObject("addr","모앤뷰 갓거킹");
		mv.setViewName("test");
		return mv;
	}
	
	@RequestMapping("map.do")//맵은 같은 이름.jsp 생성에 의존할 수 밖에, 잘 안씀
	public Map map() {
		Map m = new HashMap();
		m.put("message", " 맵 맛 점");
		m.put("addr"," 맵 갓거킹");
		return m;
	}
	
	//리턴이 아닌 인자 지정하는 방식, 값을 넘겨주지 않아도 됌
	@RequestMapping("model.do")
	public String model(Model m) {//ModelAndView 에서 setView가 없는 형태
		m.addAttribute("message", " 모델 맛 점");
		m.addAttribute("addr"," 모델 갓거킹");
		return "test";
	}

	
}
