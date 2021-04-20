package com.javassem.basic;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//import lombok.extern.log4j.Log4j;


public class MybatisTest {

	
	private DataSource dataSource;
	
	
	private SqlSessionFactory sqlSessionFactory;
	
	
	public void timeTest() {
		try {
		
			SqlSession session = sqlSessionFactory.openSession();
			Connection con = session.getConnection();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
