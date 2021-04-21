package com.javassem.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javassem.domain.BoardVO;
import com.javassem.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("insertBoard.do")
	public void insertBoard() {
		System.out.println("insertBoard 요청");
	}
	
	@RequestMapping("saveBoard.do")
	public String saveBoard(BoardVO vo) {//insert 폼으로부터 가져온 값
		System.out.println("saveBoard 요청"+vo.getTitle() + " "+ vo.getWriter() + " " +vo.getContent());
		boardService.insertBoard(vo);
		return "redirect:/getBoardList.do";
	}

	//후에 HashMap으로 검색 기능에 사용하려고 vo 매개변수 넣음
	@RequestMapping("getBoardList.do")
	public void getBoardLsit(Model m, String searchCondition, String searchKeyword) {
		System.out.println("getBoardList 요청"+searchCondition + " : " + searchKeyword);
		HashMap map = new HashMap();
		map.put("searchCondition", searchCondition);//제목 : 에취
		map.put("searchKeyword", searchKeyword);
		m.addAttribute("boardList",boardService.getBoardList(map));//List<Board>를 반환
	}
	
	@RequestMapping("getBoard.do")
	public void getBoard(Model m, BoardVO vo) {
		System.out.println("getBoard 요청");
		BoardVO vo2 = boardService.getBoard(vo);
		boardService.updateCnt(vo2);
		m.addAttribute("board",vo2);
	}  
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(Model m, BoardVO vo) {
		System.out.println("updateBoard 요청");
		boardService.updateBoard(vo);
		return "redirect:/getBoardList.do";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int seq) {
		BoardVO vo = new BoardVO();
		vo.setSeq(seq);
		boardService.deleteBoard(vo);
		return "redirect:/getBoardList.do";
	}

}
