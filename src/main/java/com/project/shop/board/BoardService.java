package com.project.shop.board;

import java.util.HashMap;
import java.util.List;

import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

public interface BoardService {

//	Notice List
	List<BoardVO> getNoticeList(HashMap<String, Object> map);
	List<BoardVO> getSearchNoticeList(HashMap<String, Object> map);
//	FAQ List	
	List<BoardVO> getFAQList(HashMap<String, Object> map);
//	1:1 List (로그인회원 id로 검색)
	List<BoardVO> getMemQList(HashMap<String, Object> map);
//	1:1 List (id가 admin일 때 전체 리스트 불러오기)
	List<BoardVO> getMemQListAll(HashMap<String, Object> map);

//	Notice detail
	BoardVO getNotice(BoardVO vo);
//	FAQ detail
	BoardVO getFAQ(BoardVO vo);
//	1:1 detail
	BoardVO getMemQ(BoardVO vo);
	
//	회원문의 작성
	void memQInsert(HashMap<String, Object> map);
//	회원문의 수정
	void memQUpdate(HashMap<String, Object> map);

//	공지사항 작성
	void noticeInsert(HashMap<String, Object> map);
//	FAQ 작성
	void faqInsert(BoardVO vo);
	
//	공지사항 수정
	void noticeUpdate(HashMap<String, Object> map);
//	FAQ 수정
	void faqUpdate(BoardVO vo);
	
//	삭제
	void noticeDelete(BoardVO vo);
	void faqDelete(BoardVO vo);
	
//	조회수
	void noticeViewUpdate(int notice_num);
	
//	1:1문의 답변 작성
	void memqAdminInsert(HashMap<String, Object> map);
//	답변 수정
	void memqAdminUpdate(HashMap<String, Object> map);
//	1:1문의/답변 삭제
	void memqDelete(BoardVO vo);
	
//	로그인회원의 주문내역
	List<OrderVO> getMemberOrderList(String member_id);
	
//	category
	List<ProductVO> getCategoryList();
	void categoryInsert(String product_category_name);
	void categoryUpdate(ProductVO productVO);
	void categoryDelete(int product_category_num);
	List<BoardVO> getSearchFAQList(HashMap<String, Object> map);
	List<BoardVO> getSearchMemQAllList(HashMap<String, Object> map);
	List<BoardVO> getSearchMemQList(HashMap<String, Object> map);
	
}
