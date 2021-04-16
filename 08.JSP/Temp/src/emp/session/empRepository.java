package emp.session;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import model.EmpVO;

public class empRepository {
	//	private final String namespace = "CommentMapper";
	private SqlSessionFactory getSqlSessionFactory() {		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("emp-config.xml");//연동 6단계를 읽어 관리
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	/*
	JDBC의 Connection = Mybatis의 SqlSeesion 
	*/
	
	public List<HashMap> selectEmp() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();//연결 객체 얻어 오기
		try {
			return sqlSess.selectList("EmpMapper.selectEmp");//전송 후 select 값 반환, List<Comment> 형식
		}finally {
			sqlSess.close();//닫는 동작이 아닌 반환 동작
		}
	}
}