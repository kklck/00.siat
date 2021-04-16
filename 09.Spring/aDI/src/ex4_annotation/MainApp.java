package ex4_annotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("ex4_annotation/applicationContext.xml");
		
		MemberDAO dao = (MemberDAO)context.getBean("memberDAO");//클래스명(맨 앞 소문자)로 bean 호출
		dao.insert();
	}

}
