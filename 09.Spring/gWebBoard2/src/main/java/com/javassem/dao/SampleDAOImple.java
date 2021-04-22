package com.javassem.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sampleDAO")
public class SampleDAOImple implements SampleDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public String Simple() {
		return sqlSession.selectOne("ss.getDate");
	}

}
