package ex1_xml1;

public class MessageBeanKoImpl implements MessageBean {
	public MessageBeanKoImpl() {
		System.out.println("�ѱۻ�����");
	}
	@Override
	public void sayHello(String name) {
		System.out.println(name+"�� ����");
	}

}
