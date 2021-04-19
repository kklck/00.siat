package ex2_value_ref;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("ex2_value_ref/applicationContext.xml");
		MemberBean b = (MemberBean)context.getBean("member");// == context.getBean("member", MemberBean.class);
		b.output();
		MemberBean b2 = (MemberBean)context.getBean("member2");
		b2.output();
		
		//ref="member"
		MemberDAO dao = (MemberDAO)context.getBean("dao");
		dao.insert();
		dao.insert(b);
		//ref="member2"
		MemberDAO dao2 = context.getBean("dao2",MemberDAO.class);
		dao2.insert();
		dao2.insert(b2);
	}

}
