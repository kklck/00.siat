package ex1_xml1;

public class MessageBeanEnImpl implements MessageBean{
	public MessageBeanEnImpl() {
		System.out.println("���������");
	}
	
	@Override
	public void sayHello(String name) {
		System.out.println(name+", ���̽� �� ��");
	}

}
