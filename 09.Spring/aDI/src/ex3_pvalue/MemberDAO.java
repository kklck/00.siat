package ex3_pvalue;

public class MemberDAO {

	private MemberBean bean;
	//��,���� ���� �⺻�����ڴ� ������
	public MemberDAO() {}
	//������
	public MemberDAO(MemberBean bean) {
		this.bean = bean;
	}
	//setter
	public void setBean(MemberBean bean) {
		this.bean = bean;
	}
	public MemberBean getBean() {
		return bean;
	}
	public void insert(MemberBean bean) {
		System.out.println(bean.getName()+"���� �޽��� '" + bean.getMessage()+"'��(��) �Է��ϼ̽��ϴ�.");
	}
	public void insert() {
		System.out.println(bean.getName()+"���� �޽��� '" + bean.getMessage()+"'��(��) �Է��ϼ̽��ϴ�.");
	}
}
