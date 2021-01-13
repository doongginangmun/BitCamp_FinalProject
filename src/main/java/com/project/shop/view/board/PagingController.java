package com.project.shop.view.board;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.project.shop.paging.Paging;

public class PagingController {
	
	Paging paging = new Paging();
	HashMap<String, Object> map = new HashMap<String, Object>();
	
//	Paging
	public HashMap<String, Object> getPaging(int count, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("까꿍");
		System.out.println(count);
		
		if (count != 0) {
			paging.setTotalRecord(count);
		}

//		전체 게시물의 수 구하기
		paging.setTotalPage();

//		현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		System.out.println("adsfsadf"+cPage);
		if (cPage != null) {
			paging.setNowPage(Integer.parseInt(cPage));
		} else {
			paging.setNowPage(1);
		}
		
//		begin, end
		paging.setEnd(paging.getNowPage() * paging.getNumPerPage());
		paging.setBegin(paging.getEnd() - paging.getNumPerPage() + 1);
		
		System.out.println("관리자검색: "+ paging.getEnd());
		System.out.println("관리자 검색: " + paging.getBegin());
		
//		블록
		int nowPage = paging.getNowPage();
		int currentBlock = (nowPage - 1) / paging.getPagePerBlock() + 1;

		paging.setEndPage(currentBlock * paging.getPagePerBlock());
		paging.setBeginPage(paging.getEndPage() - paging.getPagePerBlock() + 1);

//		끝페이지가 전체페이지수보다 크면 끝페이지값 전체페이지수로 변경
		if (paging.getEndPage() > paging.getTotalPage()) {
			paging.setEndPage(paging.getTotalPage());
		}
		
		map.put("paging", paging);
		
		return map;
	}
}
