package com.project.shop.board.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.board.BoardVO;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate board;
	
	public List<BoardVO> getNoticeList(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getNoticeList", map);
	}
	
	public BoardVO getNotice(BoardVO vo) {
		return board.selectOne("mapper.board.getNotice", vo);
	}

	public List<BoardVO> getFAQList(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getFAQList", map);
	}
	
	public BoardVO getFAQ(BoardVO vo) {
		return board.selectOne("mapper.board.getFAQ", vo);
	}

	public List<BoardVO> getMemQList(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getMemQList", map);
	}

	public void memQInsert(HashMap<String, Object> map) {
		board.insert("mapper.board.memqInsert", map);
	}

	public BoardVO getMemQ(BoardVO vo) {
		return board.selectOne("mapper.board.getMemQ", vo);
	}

	public void memQUpdate(HashMap<String, Object> map) {
		board.update("mapper.board.memqUpdate", map);
	}

	public List<BoardVO> getMemQListAll(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getMemQListAll", map);
	}

	public void noticeInsert(HashMap<String, Object> map) {
		board.insert("mapper.board.noticeInsert", map);
	}

	public void faqInsert(BoardVO vo) {
		board.insert("mapper.board.faqInsert", vo);
	}

	public void noticeUpdate(HashMap<String, Object> map) {
		board.update("mapper.board.noticeUpdate", map);
	}

	public void faqUpdate(BoardVO vo) {
		board.update("mapper.board.faqUpdate", vo);
	}

	public void noticeDelete(BoardVO vo) {
		board.delete("mapper.board.noticeDelete", vo);
	}

	public void faqDelete(BoardVO vo) {
		board.delete("mapper.board.faqDelete", vo);
	}

	public void noticeViewUpdate(int notice_num) {
		board.update("mapper.board.noticeViewUpdate", notice_num);
	}

	public void memqAdminInsert(HashMap<String, Object> map) {
		board.insert("mapper.board.memqAdminInsert", map);
	}

	public void memqAdminUpdate(HashMap<String, Object> map) {
		board.update("mapper.board.memqAdminUpdate", map);
	}

	public void memqDelete(BoardVO vo) {
		board.delete("mapper.board.memqDelete", vo);
	}

	public List<OrderVO> getMemberOrderList(String member_id) {
		return board.selectList("mapper.board.member_order_list", member_id);
	}

	public List<ProductVO> getCategoryList() {
		return board.selectList("mapper.board.productCategoryList");
	}

	public void categoryInsert(String product_category_name) {
		board.insert("mapper.board.proCategoryInsert", product_category_name);
	}

	public void categoryUpdate(ProductVO productVO) {
		board.update("mapper.board.proCategoryUpdate", productVO);
	}

	public void categoryDelete(int product_category_num) {
		board.delete("mapper.board.proCategoryDelete", product_category_num);
	}
	
	public List<BoardVO> getSearchNoticeList(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getSearchNoticeList", map);
	}

	public List<BoardVO> getSearchFAQList(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getSearchFAQList", map);
	}

	public List<BoardVO> getSearchMemQAllList(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getSearchMemQListAll", map);
	}

	public List<BoardVO> getSearchMemQList(HashMap<String, Object> map) {
		return board.selectList("mapper.board.getSearchMemQList", map);
	}
	
}
