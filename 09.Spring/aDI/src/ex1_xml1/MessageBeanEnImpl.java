package ex1_xml1;

public class MessageBeanEnImpl implements MessageBean{
	public MessageBeanEnImpl() {
		System.out.println("영어생성자");
	}
	
	@Override
	public void sayHello(String name) {
		System.out.println(name+", 나이스 밋 츄");
	}

}
