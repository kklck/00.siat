package ex4_annotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("ex4_annotation/applicationContext.xml");
		
		MemberDAO dao = (MemberDAO)context.getBean("memberDAO");//Ŭ������(�� �� �ҹ���)�� bean ȣ��
		dao.insert();
	}

}
