package ex3_pvalue;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("ex3_pvalue/applicationContext.xml");
		
		MemberDAO dao = (MemberDAO)context.getBean("dao");
		dao.insert();
	}

}
