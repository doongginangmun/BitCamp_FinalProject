package com.project.shop.product.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.product.board.ProductBoardService;
import com.project.shop.product.board.ReviewVO;
import com.project.shop.product.Paging;
import com.project.shop.product.board.ProductBoardQnaVO;

@Service("productBoardService")
public class ProductBoardServiceImpl implements ProductBoardService{
	@Autowired
	private Paging p;
	
	@Autowired
	private ProductBoardDAO productBoardDAO;
	
	//============================ Q&A ==========================
	@Override
	public int qnaTotalCount(String product_id) throws Exception {
		int totalCount = productBoardDAO.selectTotalCountProductQna(product_id);
		return totalCount;
	}

	@Override
	public List<ProductBoardQnaVO> getListQna(Map map) throws Exception {
		List<ProductBoardQnaVO> productQnaList = productBoardDAO.selectProductQnaList(map);
		return productQnaList;
	}
	@Override
	public ProductBoardQnaVO getProductQna(int product_qna_num) throws Exception {
		ProductBoardQnaVO productQna = productBoardDAO.selectProductQna(product_qna_num);
		return productQna;
	} 
	@Override
	public Paging pagingInfo(String poduct_id, String cPage) throws Exception {
		int totalCount = qnaTotalCount(poduct_id);
		// 1. 전체 게시물의 수를 구하기
		p.setTotalRecord(totalCount); 
		p.setTotalPage(); // 전체 페이지 갯수 구하기
	
		// 2. 현재 페이지 구하기
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
	
		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
		// 4. 블록(block) 계산하기(블록의 시작, 끝페이지 구하기)
		int nowPage = p.getNowPage();
		int currentBlock = (nowPage - 1) / p.getPagePerBlock() + 1;
		p.setEndPage(currentBlock * p.getPagePerBlock());
		p.setBeginPage(p.getEndPage() - p.getPagePerBlock() + 1);
	
		// 5. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지 값을 전체페이지수로 변경처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		return p;
	}

	@Override
	public void addBoardQna(Map map) throws Exception {
		productBoardDAO.insertBoardQna(map);
	}

	@Override
	public void editBoaardQna(Map map) throws Exception {
		productBoardDAO.updateBoardQna(map);
		
	}

	@Override
	public void deleteBoardQna(int product_qna_num) throws Exception {
		productBoardDAO.deleteBoardQna(product_qna_num);
		
	}
	// ======================= REVIEW ======================
	@Override
	public int reviewTotalCount(String product_id) throws Exception {
		return productBoardDAO.selectReviewTotalCount(product_id);
	}

	@Override
	public List<ReviewVO> getListReview(Map map) throws Exception {
		List<ReviewVO> reviewList = productBoardDAO.selectReviewList(map);
		return reviewList;
	}

	@Override
	public void addReview(Map map) throws Exception {
		productBoardDAO.insertReview(map);
	}

	@Override
	public ReviewVO getReview(int review_num) throws Exception {
		return productBoardDAO.selectReview(review_num);
	}

	@Override
	public void editReview(Map map) throws Exception {
		productBoardDAO.updateReview(map);
		
	}

	@Override
	public void deleteReview(int review_num) throws Exception {
		productBoardDAO.deleteReview(review_num);
	}

	
}
