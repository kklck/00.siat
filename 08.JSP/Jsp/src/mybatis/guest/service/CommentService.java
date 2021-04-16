package mybatis.guest.service;

import java.util.*;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	
	private static CommentService service;
	
	private CommentService() {}
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	private CommentRepository repo = new CommentRepository();//세션 클래스

	public List<Comment> selectComment(){
		return repo.selectComment();	
	}
	public Comment selectCommentByPrimaryKey(long commentNo){
		return repo.selectCommentByPrimaryKey(commentNo);	
	}
	
	public void insertComment(Comment comment) {
		repo.insertComment(comment);
	}
	
	public void updateComment(Comment comment) {
		repo.updateComment(comment);
	}
	
	public void deleteComment(int commentNo) {
		repo.deleteComment(commentNo);
	}

}