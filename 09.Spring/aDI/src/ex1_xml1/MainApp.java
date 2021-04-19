package ex1_xml1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {

	public static void main(String[] args) {
		//기본 POJO(순수 Java) 방식
		/*
		 * MessageBean bean = new MessageBeanKoImpl(); bean.sayHello("홍길동");
		 * MessageBean bean2 = new MessageBeanEnImpl(); bean2.sayHello("john");
		 */
		
		//스프링 방식
		//1. 스프링 설정 파일 연결
		ApplicationContext context = new ClassPathXmlApplicationContext("ex1_xml1/applicationContext.xml");
		//2. 컨테이너에서 빈 가져오기
			//한글은 싱글톤, 디폴트값, 위 xml 연결 시 생성
		MessageBean bean = (MessageBean)context.getBean("ko");//반환하는 빈은 사용자가 만들었으니 그 것에 맞게 형변환을 해줌
		bean.sayHello("댕댕이");
		MessageBean bean1 = (MessageBean)context.getBean("ko");
		bean1.sayHello("더기덕");
			//영어는 프로토타입, 빈 가져올 때마다 생성
		MessageBean bean2 = (MessageBean)context.getBean("en");
		bean2.sayHello("떼껄룩");
		MessageBean bean3 = (MessageBean)context.getBean("en");
		bean3.sayHello("냥");
	}
}
