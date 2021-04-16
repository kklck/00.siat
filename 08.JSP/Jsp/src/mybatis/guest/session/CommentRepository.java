package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository {
	//	private final String namespace = "CommentMapper";
	private SqlSessionFactory getSqlSessionFactory() {		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");//연동 6단계를 읽어 관리
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	/*
	JDBC의 Connection = Mybatis의 SqlSeesion 
	*/
	
	public List<Comment> selectComment() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();//연결 객체 얻어 오기
		try {
			return sqlSess.selectList("CommentMapper.selectComment");//전송 후 select 값 반환, List<Comment> 형식
		}finally {
			sqlSess.close();//닫는 동작이 아닌 반환 동작
		}
	}
	public Comment selectCommentByPrimaryKey(long commentNo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();//연결 객체 얻어 오기
		try {
			return sqlSess.selectOne("CommentMapper.selectCommentByPrimaryKey",commentNo);//전송 후 select 값 반환
		}finally {
			sqlSess.close();//닫는 동작이 아닌 반환 동작
		}
	}
	public void insertComment(Comment comment) {
		SqlSession sqlSess = getSqlSessionFactory().openSession(true);//연결 객체 얻어 오기
		try {
			int result = sqlSess.insert("CommentMapper.insertComment",comment);
			if(result == 1){
				sqlSess.commit();
			}
		}finally {
			sqlSess.close();//닫는 동작이 아닌 반환 동작
		}		
	}
	public void updateComment(Comment comment) {
		SqlSession sqlSess = getSqlSessionFactory().openSession(true);//연결 객체 얻어 오기
		try {
			sqlSess.update("CommentMapper.updateComment", comment);
		}finally {
			sqlSess.close();
		}
	}
	public void deleteComment(int commentNo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession(true);//연결 객체 얻어 오기
		try {
			sqlSess.update("CommentMapper.deleteComment", commentNo);
		}finally {
			sqlSess.close();
		}
		
	}
}