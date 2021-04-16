package ex5_autowired;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import ex5_autowired.MessageBean;

@Component
public class MessageBeanImpl implements MessageBean{

	private String name;
	private String message;
	
	public MessageBeanImpl() {}
	
//	@Autowired
//	@Qualifier("out2")
	@Resource(name="out2")
	private Outputer out;

	
	public void setName(String name) {
		this.name = name;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public void sayHello() {
		// TODO Auto-generated method stub
		System.out.println(name+"´Ô²²... " +message);
		try {
			out.wirteMessage(name+"´Ô²²... " +message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}