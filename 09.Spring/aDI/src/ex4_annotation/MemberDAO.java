package ex4_annotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {
	@Autowired
	private MemberBean bean;
	
	//��,���� ���� �⺻�����ڴ� ������
//	public MemberDAO() {}
	
	//������
//	public MemberDAO(MemberBean bean) {
//		this.bean = bean;
//	}
	
	//setter
//	public void setBean(MemberBean bean) {
//		this.bean = bean;
//	}
//	public MemberBean getBean() {
//		return bean;
//	}
	public void insert(MemberBean bean) {
		System.out.println(bean.getName()+"���� �޽��� '" + bean.getMessage()+"'��(��) �Է��ϼ̽��ϴ�.");
	}
	public void insert() {
		System.out.println(bean.getName()+"���� �޽��� '" + bean.getMessage()+"'��(��) �Է��ϼ̽��ϴ�.");
	}
}
