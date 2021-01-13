package com.project.shop.board.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.board.BoardService;
import com.project.shop.board.BoardVO;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getNoticeList(HashMap<String, Object> map) {
		return boardDAO.getNoticeList(map);
	}
	
	@Override
	public BoardVO getNotice(BoardVO vo) {
		return boardDAO.getNotice(vo);
	}

	@Override
	public List<BoardVO> getFAQList(HashMap<String, Object> map) {
		return boardDAO.getFAQList(map);
	}

	@Override
	public BoardVO getFAQ(BoardVO vo) {
		return boardDAO.getFAQ(vo);
	}

	@Override
	public List<BoardVO> getMemQList(HashMap<String, Object> map) {
		return boardDAO.getMemQList(map);
	}

	@Override
	public void memQInsert(HashMap<String, Object> map) {
		boardDAO.memQInsert(map);
	}

	@Override
	public BoardVO getMemQ(BoardVO vo) {
		return boardDAO.getMemQ(vo);
	}

	@Override
	public void memQUpdate(HashMap<String, Object> map) {
		boardDAO.memQUpdate(map);
	}

	@Override
	public List<BoardVO> getMemQListAll(HashMap<String, Object> map) {
		return boardDAO.getMemQListAll(map);
	}

	@Override
	public void noticeInsert(HashMap<String, Object> map) {
		boardDAO.noticeInsert(map);
	}

	@Override
	public void faqInsert(BoardVO vo) {
		boardDAO.faqInsert(vo);
	}

	@Override
	public void noticeUpdate(HashMap<String, Object> map) {
		boardDAO.noticeUpdate(map);
	}

	@Override
	public void faqUpdate(BoardVO vo) {
		boardDAO.faqUpdate(vo);
	}

	@Override
	public void noticeDelete(BoardVO vo) {
		boardDAO.noticeDelete(vo);
	}

	@Override
	public void faqDelete(BoardVO vo) {
		boardDAO.faqDelete(vo);
	}

	@Override
	public void noticeViewUpdate(int notice_num) {
		boardDAO.noticeViewUpdate(notice_num);
	}

	@Override
	public void memqAdminInsert(HashMap<String, Object> map) {
		boardDAO.memqAdminInsert(map);
	}

	@Override
	public void memqAdminUpdate(HashMap<String, Object> map) {
		boardDAO.memqAdminUpdate(map);
	}

	@Override
	public void memqDelete(BoardVO vo) {
		boardDAO.memqDelete(vo);
	}

	@Override
	public List<OrderVO> getMemberOrderList(String member_id) {
		return boardDAO.getMemberOrderList(member_id);
	}

	@Override
	public List<ProductVO> getCategoryList() {
		return boardDAO.getCategoryList();
	}

	@Override
	public void categoryInsert(String product_category_name) {
		boardDAO.categoryInsert(product_category_name);
	}

	@Override
	public void categoryUpdate(ProductVO productVO) {
		boardDAO.categoryUpdate(productVO);
	}

	@Override
	public void categoryDelete(int product_category_num) {
		boardDAO.categoryDelete(product_category_num);
	}

	@Override
	public List<BoardVO> getSearchNoticeList(HashMap<String, Object> map) {
		return boardDAO.getSearchNoticeList(map);
	}

	@Override
	public List<BoardVO> getSearchFAQList(HashMap<String, Object> map) {
		return boardDAO.getSearchFAQList(map);
	}

	@Override
	public List<BoardVO> getSearchMemQAllList(HashMap<String, Object> map) {
		return boardDAO.getSearchMemQAllList(map);
	}

	@Override
	public List<BoardVO> getSearchMemQList(HashMap<String, Object> map) {
		return boardDAO.getSearchMemQList(map);
	}

}
