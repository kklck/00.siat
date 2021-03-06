package com.javassem.dao;

import java.util.HashMap;
import java.util.List;

import com.javassem.domain.MemberVO;

public interface MemberDAO {
	/**
	 * id 중복체트 기능 구현
	 */	
	MemberVO  idCheck( MemberVO vo );
	
	/**
	 * 회원가입기능 구현
	 */
	int memberInsert(MemberVO vo);
	
	/**
	 * 로그인 확인 기능 구현
	 */
	MemberVO memberLogin(MemberVO vo);
	
	List<MemberVO> getMemeberList();
	List<MemberVO> getMemeberList(HashMap map);
	
}
