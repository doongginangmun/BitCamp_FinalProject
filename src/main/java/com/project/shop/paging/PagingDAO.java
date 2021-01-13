package com.project.shop.paging;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.board.BoardVO;
import com.project.shop.member.MemberVO;

@Repository
public class PagingDAO {

	@Autowired
	private SqlSessionTemplate board;
	
//	공지사항 전체 건수 조회
	public int getNoticeCount() {
		return board.selectOne("mapper.board.getNoticeCount");
	}
	
//	FAQ 전체 건수 조회
	public int getFAQCount() {
		return board.selectOne("mapper.board.getFAQCount");
	}

	public int getMemQCount(MemberVO memberVO) {
		return board.selectOne("mapper.board.getMemQCount", memberVO);
	}

	public int getMemQCountAll() {
		return board.selectOne("mapper.board.getMemQCountAll");
	}

	public int getSearchNoticeCount(BoardVO vo) {
		return board.selectOne("mapper.board.getSearchNoticeCount", vo);
	}

	public int getSearchFAQCount(BoardVO vo) {
		return board.selectOne("mapper.board.getSearchFAQCount", vo);
	}

	public int getSearchMemQAllCount(BoardVO vo) {
		return board.selectOne("mapper.board.getSearchMemQCountAll", vo);
	}

	public int getSearchMemQCount(HashMap<String, Object> map) {
		return board.selectOne("mapper.board.getSearchMemQCount", map);
	}

}
