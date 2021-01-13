package com.project.shop.view.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.board.BoardService;
import com.project.shop.board.BoardVO;
import com.project.shop.member.MemberVO;
import com.project.shop.paging.PagingService;
import com.project.shop.product.ProductVO;

@Controller("adminBoardController")
@RequestMapping(value = "/adminboard")
public class AdminBoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private PagingService pagingService;

	FileController filecon = new FileController();

	PagingController pagingCon = new PagingController();

	HashMap<String, Object> map = new HashMap<String, Object>();

//	관리자 공지사항
	@RequestMapping(value = "noticeList.do")
	public ModelAndView getNoticeList(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		int count;
		List<BoardVO> noticeList;
		map.put("vo", vo);

		if (vo.getDaterange() == null) {
			count = pagingService.getNoticeCount();
			map = pagingCon.getPaging(count, request, response);
			noticeList = boardService.getNoticeList(map);
		} else {
			count = pagingService.getSearchNoticeCount(vo);
			map = pagingCon.getPaging(count, request, response);
			noticeList = boardService.getSearchNoticeList(map);
		}

		mav.addObject("vo", vo);
		mav.addObject("paging", map.get("paging"));
		mav.addObject("NoticeList", noticeList);

		return mav;
	}

//	관리자 FAQ
	@RequestMapping(value = "/faqList.do")
	public ModelAndView getFAQList(BoardVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		int count;
		List<BoardVO> faqList;
		map.put("vo", vo);

		if (vo.getSearchKeyword() == null) {
			count = pagingService.getFAQCount();
			map = pagingCon.getPaging(count, request, response);
			faqList = boardService.getFAQList(map);
		} else {
			count = pagingService.getSearchFAQCount(vo);
			map = pagingCon.getPaging(count, request, response);
			faqList = boardService.getSearchFAQList(map);
		}

		mav.addObject("vo", vo);
		mav.addObject("paging", map.get("paging"));
		mav.addObject("FAQList", faqList);

		return mav;
	}

//	관리자 1:1 문의
	@RequestMapping(value = "/memberQnaList.do")
	public ModelAndView memQList(BoardVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		int count;
		List<BoardVO> memQList;
		map.put("vo", vo);

		if (vo.getDaterange() == null) {
			count = pagingService.getMemQCountAll();
			map = pagingCon.getPaging(count, request, response);
			memQList = boardService.getMemQListAll(map);
		} else {
			count = pagingService.getSearchMemQAllCount(vo);
			map = pagingCon.getPaging(count, request, response);
			memQList = boardService.getSearchMemQAllList(map);
		}

		mav.addObject("vo", vo);
		mav.addObject("paging", map.get("paging"));
		mav.addObject("MemQList", memQList);

		return mav;
	}

//	글 상세 불러오기
	@RequestMapping("/notice.do")
	public ModelAndView getNotice(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		mav.addObject("member_id", memberVO.getMember_id());
		
		int count = pagingService.getNoticeCount();
		map = pagingCon.getPaging(count, request, response);
		
		boardService.noticeViewUpdate(vo.getNotice_num());
		BoardVO notice = boardService.getNotice(vo);
		
		mav.addObject("vo", vo);
		mav.addObject("notice", notice);
		mav.addObject("paging", map.get("paging"));
		return mav;
	}

	@RequestMapping("/faq.do")
	public ModelAndView getFAQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		mav.addObject("member_id", memberVO.getMember_id());

		int count = pagingService.getFAQCount();
		map = pagingCon.getPaging(count, request, response);

		BoardVO faq = boardService.getFAQ(vo);

		mav.addObject("vo", vo);
		mav.addObject("faq", faq);
		mav.addObject("paging", map.get("paging"));
		
		return mav;
	}

	@RequestMapping("/memQ.do")
	public ModelAndView getMemQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		int count = pagingService.getMemQCountAll();
		map = pagingCon.getPaging(count, request, response);

		BoardVO memQ = boardService.getMemQ(vo);

		mav.addObject("vo", vo);
		mav.addObject("memQ", memQ);
		mav.addObject("paging", map.get("paging"));
		
		return mav;
	}

//	관리자 공지사항 등록 setViewName
	@RequestMapping(value = "/noticeInsert.do")
	public ModelAndView noticeInsertView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

//	관리자 공지사항 등록
	@RequestMapping(value = "/noticeAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeInsert(BoardVO vo, MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		map = filecon.fileUpload(multipartRequest, response);
		boardService.noticeInsert(map);
		mav.setViewName("redirect:/adminboard/noticeList.do");
		return mav;
	}

//	관리자 FAQ 등록
	@RequestMapping(value = "/faqInsert.do")
	public ModelAndView FAQInsert(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		String action = request.getParameter("action");
		
		if (action != null && action.equals("faqAdd")) {
			boardService.faqInsert(vo);
			mav.setViewName("redirect:/adminboard/faqList.do");
		}
	
		return mav;
	}

//	공지사항 글 수정 setView
	@RequestMapping(value = "/noticeUpdate.do")
	public ModelAndView noticeUpdateView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		int count = pagingService.getNoticeCount();
		map = pagingCon.getPaging(count, request, response);
		
		mav.addObject("paging", map.get("paging"));

		BoardVO notice = boardService.getNotice(vo);
		mav.addObject("notice", notice);
		mav.addObject("vo", vo);
		
		return mav;
	}

//	공지사항 글 수정
	@RequestMapping(value = "/noticeUpdating.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeUpdate(BoardVO vo, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		map = filecon.fileUpload(multipartRequest, response);
		boardService.noticeUpdate(map);
		
		mav.setViewName("redirect:/adminboard/notice.do?notice_num=" + vo.getNotice_num() + "&cPage=" + multipartRequest.getParameter("cPage"));
		
		return mav;
	}

//	관리자 FAQ 수정
	@RequestMapping(value = "/faqUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FAQUpdateView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		int count = pagingService.getFAQCount();
		map = pagingCon.getPaging(count, request, response);
		
		mav.addObject("paging", map.get("paging"));
		
		BoardVO faq = boardService.getFAQ(vo);
		mav.addObject("faq", faq);
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping(value = "/faqUpdating.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FAQUpdate(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.faqUpdate(vo);
		mav.setViewName("redirect:/adminboard/faq.do?faq_num=" + vo.getFaq_num() + "&cPage=" + request.getParameter("cPage"));
		return mav;
	}

//	관리자 공지사항 삭제
	@RequestMapping(value = "/noticeDelete.do")
	public ModelAndView noticeDelete(BoardVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.noticeDelete(vo);
		mav.setViewName("redirect:/adminboard/noticeList.do");
		return mav;
	}

//	관리자 FAQ 삭제
	@RequestMapping(value = "/faqDelete.do")
	public ModelAndView faqDelete(BoardVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.faqDelete(vo);
		mav.setViewName("redirect:/adminboard/faqList.do");
		return mav;
	}

//	관리자 1:1 문의/답변 삭제
	@RequestMapping(value = "/memqDelete.do")
	public ModelAndView memqDelete(BoardVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.memqDelete(vo);
		mav.setViewName("redirect:/adminboard/memberQnaList.do");
		return mav;
	}

//	관리자 1:1 답변 등록 setViewName
	@RequestMapping(value = "/memqAdminInsert.do")
	public ModelAndView FAQInsertView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		mav.addObject("memberInfo", memberVO);

		BoardVO memQ = boardService.getMemQ(vo);
		mav.addObject("memQ", memQ);
		
		String cPage = request.getParameter("cPage");
		mav.addObject("cPage", cPage);

		return mav;
	}

//	관리자 1:1 답변 등록
	@RequestMapping(value = "/memqAdminAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FAQInsert(BoardVO vo, MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		map = filecon.fileUpload(multipartRequest, response);
		boardService.memqAdminInsert(map);
		mav.setViewName("redirect:/adminboard/memberQnaList.do?cPage=" + multipartRequest.getParameter("cPage"));

		return mav;
	}

//	관리자 답변 글 수정 setView
	@RequestMapping(value = "/memqAdminUpdate.do")
	public ModelAndView memQAdminUpdateView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String cPage = request.getParameter("cPage");

		BoardVO memQ = boardService.getMemQ(vo);
		mav.addObject("memQ", memQ);
		mav.addObject("cPage", cPage);
		return mav;
	}

//	관리자 답변 수정
	@RequestMapping(value = "/memqAdminUpdating.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memQUpdate(BoardVO vo, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String member_qna_num = multipartRequest.getParameter("member_qna_num");

		map = filecon.fileUpload(multipartRequest, response);
		boardService.memqAdminUpdate(map);
		mav.setViewName("redirect:/adminboard/memQ.do?member_qna_num=" + member_qna_num 
												+ "&cPage=" + multipartRequest.getParameter("cPage")
												+ "&member_id=" + multipartRequest.getParameter("member_id"));

		return mav;
	}

	/* 냐아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ */
	@RequestMapping(value = "productCategoryList.do")
	public ModelAndView productCategoryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<ProductVO> categoryList = boardService.getCategoryList();
		mav.addObject("categoryList", categoryList);
		return mav;
	}

	@RequestMapping(value = "proCategoryInsert.do")
	public ModelAndView proCategoryInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String product_category_name = request.getParameter("product_category_name");
		boardService.categoryInsert(product_category_name);
		mav.setViewName("redirect:/adminboard/productCategoryList.do");
		return mav;
	}

	@RequestMapping(value = "proCategoryUpdate.do")
	public ModelAndView proCategoryUpdate(ProductVO productVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.categoryUpdate(productVO);
		mav.setViewName("redirect:/adminboard/productCategoryList.do");
		return mav;
	}

	@RequestMapping(value = "proCategoryDelete.do")
	public ModelAndView proCategoryDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		int product_category_num = Integer.parseInt(request.getParameter("product_category_num"));
		boardService.categoryDelete(product_category_num);
		mav.setViewName("redirect:/adminboard/productCategoryList.do");
		return mav;
	}

}
