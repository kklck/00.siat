package com.javassem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javassem.dao.BoardDAOImpl;
import com.javassem.dao.ReplyDAOImpl;
import com.javassem.domain.BoardVO;
import com.javassem.domain.ReplyVO;


@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAOImpl ReplyDAO;

	@Override
	public Integer insertReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReplyVO> selectAllReply() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReply(String rno) {
		// TODO Auto-generated method stub
		return 0;
	}
}