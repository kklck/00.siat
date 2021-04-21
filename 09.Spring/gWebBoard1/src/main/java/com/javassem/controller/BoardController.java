package com.javassem.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javassem.domain.BoardVO;
import com.javassem.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

		//
		@RequestMapping("/{step}.do")
		public String viewPage(@PathVariable String step) {
			System.out.println("insert동작");
			return step;
		}
	
		// 글 목록 검색
		@RequestMapping("/getBoardList.do")
		public void getBoardList(BoardVO vo, Model model) {
			System.out.println("getBoardList동작");			
			model.addAttribute("boardList", boardService.getBoardList(vo));
			// ViewResolver를 지정하지 않으면 아래처럼 페이지명 지정
			// return "views/getBoardList.jsp"; // View 이름 리턴
		}
	
		// 글 등록
		@RequestMapping(value = "/saveBoard.do")
		public String insertBoard(BoardVO vo) throws IOException {
			System.out.println("saveBoard동작");		
			boardService.insertBoard(vo);
			return "redirect:/getBoardList.do";
		}

		// 글 수정
		@RequestMapping("/updateBoard.do")
		public String updateBoard(@ModelAttribute("board") BoardVO vo) {
			boardService.updateBoard(vo);
			return "redirect:/getBoardList.do";
		}

		// 글 삭제
		@RequestMapping("/deleteBoard.do")
		public String deleteBoard(BoardVO vo) {
			boardService.deleteBoard(vo);
			return "redirect:/getBoardList.do";
		}

		// 글 상세 조회
		@RequestMapping("/getBoard.do")
		public void getBoard(BoardVO vo, Model model) {
			model.addAttribute("board", boardService.getBoard(vo)); // Model 정보 저장			
		}

	}
