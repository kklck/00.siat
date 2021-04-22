package com.javassem.service;

import java.util.List;

import com.javassem.domain.ReplyVO;



public interface ReplyService {
	// CRUD 기능의 메소드 구현
	Integer insertReply(ReplyVO vo);
	
	List<ReplyVO> selectAllReply();
	
	int deleteReply(String rno);
	
}
