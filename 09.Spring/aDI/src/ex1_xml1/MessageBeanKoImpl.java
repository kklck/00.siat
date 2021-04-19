package ex1_xml1;

public class MessageBeanKoImpl implements MessageBean {
	public MessageBeanKoImpl() {
		System.out.println("ÇÑ±Û»ı¼ºÀÚ");
	}
	@Override
	public void sayHello(String name) {
		System.out.println(name+"´Ô ¸ÀÁ¡");
	}

}
