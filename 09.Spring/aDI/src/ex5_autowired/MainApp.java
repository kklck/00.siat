package ex5_autowired;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import ex5_autowired.MessageBean;

public class MainApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("ex5_autowired/app.xml");
		
		MessageBean bean = (MessageBean)context.getBean("message");
		bean.sayHello();

	}

}
