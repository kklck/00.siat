package ex3_pvalue;

public class MemberDAO {

	private MemberBean bean;
	//겟,셋을 위해 기본생성자는 무조건
	public MemberDAO() {}
	//생성자
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
		System.out.println(bean.getName()+"님의 메시지 '" + bean.getMessage()+"'을(를) 입력하셨습니다.");
	}
	public void insert() {
		System.out.println(bean.getName()+"님의 메시지 '" + bean.getMessage()+"'을(를) 입력하셨습니다.");
	}
}
