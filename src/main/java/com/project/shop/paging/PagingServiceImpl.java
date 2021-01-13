package com.project.shop.paging;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.board.BoardVO;
import com.project.shop.member.MemberVO;

@Service("pagingService")
public class PagingServiceImpl implements PagingService {

	@Autowired
	private PagingDAO pagingDAO;
	
	@Override
	public int getNoticeCount() {
		return pagingDAO.getNoticeCount();
	}

	@Override
	public int getFAQCount() {
		return pagingDAO.getFAQCount();
	}

	@Override
	public int getMemQCount(MemberVO memberVO) {
		return pagingDAO.getMemQCount(memberVO);
	}

	@Override
	public int getMemQCountAll() {
		return pagingDAO.getMemQCountAll();
	}

	@Override
	public int getSearchNoticeCount(BoardVO vo) {
		return pagingDAO.getSearchNoticeCount(vo);
	}

	@Override
	public int getSearchFAQCount(BoardVO vo) {
		return pagingDAO.getSearchFAQCount(vo);
	}

	@Override
	public int getSearchMemQAllCount(BoardVO vo) {
		return pagingDAO.getSearchMemQAllCount(vo);
	}

	@Override
	public int getSearchMemQCount(HashMap<String, Object> map) {
		return pagingDAO.getSearchMemQCount(map);
	}

}
