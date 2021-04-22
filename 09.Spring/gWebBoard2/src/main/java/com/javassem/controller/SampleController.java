package com.javassem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javassem.service.SampleService;

@Controller
public class SampleController {
	
	@Autowired
	SampleService sampleService;
	
	@RequestMapping("sample.do")
	public void sample(Model m) {
		m.addAttribute("sample",sampleService.sample());
	}


}
