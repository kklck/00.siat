package com.javassem.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javassem.dao.BoardDAOImpl;
import com.javassem.domain.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAOImpl boardDAO;

	public void insertBoard(BoardVO vo) {

		boardDAO.insertBoard(vo);
	}

	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	public List<BoardVO> getBoardList(HashMap map) {
		return boardDAO.getBoardList(map);
	}
	public void updateCnt(BoardVO vo) {
		boardDAO.updateCnt(vo);
	}
}