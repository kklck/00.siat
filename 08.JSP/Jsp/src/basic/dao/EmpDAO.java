package basic.dao;

import java.sql.*;
import basic.dto.EmpDTO;

public class EmpDAO {
	private static EmpDAO dao = null;
	private EmpDAO() throws ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");		
	}
	public static EmpDAO getInstance() throws ClassNotFoundException{
		if(dao == null) {
			dao = new EmpDAO();
		}
		return dao;
	}
	public void insert(EmpDTO dto) throws SQLException {
		//연결객체 얻어오기
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.94:1521:xe", "SCOTT", "TIGER");
		String sql = "INSERT INTO EMP(EMPNO, ENAME, DEPTNO, JOB, SAL) VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getEmpno());
		ps.setString(2, dto.getEname());
		ps.setInt(3, dto.getDeptno());
		ps.setString(4, dto.getJob());
		ps.setInt(5, dto.getSal());
		int rs = ps.executeUpdate();
		System.out.println(rs + "행");
		//연결객체 닫기
		ps.close();
		con.close();
	}
	public boolean login(EmpDTO dto) throws SQLException {
		boolean login = false;
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.94:1521:xe", "SCOTT", "TIGER");
		String sql = "SELECT * FROM EMP WHERE ENAME=? AND EMPNO=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,dto.getEname());
		ps.setInt(2,dto.getEmpno());
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {//기본 값이 속성명 NEXT로 값을 할당
			login = true;
		}
		ps.close();
		con.close();
		return login;
	}
}
