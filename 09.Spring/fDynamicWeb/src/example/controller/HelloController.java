package example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//Control은 servlet이 한다고 했으나 컨트롤 클래스를 만드는 이유

@Controller //web.xml에서 지정된 servlet(DispatcherServlet)을 불러오기만 하는 역할
public class HelloController {
	
	@RequestMapping("/start.do")//해당 링크 들어오면 View에 전달하게 컨트롤만 
	public ModelAndView start() {
		System.out.println("start.do 요청 확인");
		//V 지정 후 데이터 전달
		ModelAndView mv = new ModelAndView();
		mv.addObject("name","홍길동");
		mv.addObject("message","ㅎㅇㅌ");
		//mv.setViewName("/WEB-INF/view/hello.jsp");// V 지정
		 // 접두, 접미를 common-serlvet에서 지정해두었기 때문에
		mv.setViewName("hello");
		//WEB-INF/view/hello.jsp 와 같음
		return mv;
	}
}
