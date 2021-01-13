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
import com.project.shop.orders.OrderVO;
import com.project.shop.paging.PagingService;

@Controller("boardController")
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	FileController filecon = new FileController();
	
	PagingController pagingCon = new PagingController();

	HashMap<String, Object> map = new HashMap<String, Object>();

//	고객센터 notice-tab 페이지
	@RequestMapping("/notice-tab.do")
	public ModelAndView getNoticeList(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		int count;
		List<BoardVO> noticeList;
		
		if (vo.getDaterange() == null) {
			count = pagingService.getNoticeCount();
			map = pagingCon.getPaging(count, request, response);
			noticeList = boardService.getNoticeList(map);
		} else {
			count = pagingService.getSearchNoticeCount(vo);
			map = pagingCon.getPaging(count, request, response);
			map.put("vo", vo);
			noticeList = boardService.getSearchNoticeList(map);
		}
		
		mav.addObject("vo", vo);
		mav.addObject("paging", map.get("paging"));
		mav.addObject("NoticeList", noticeList);

		return mav;
	}

//	고객센터 faq-tab 페이지
	@RequestMapping("/faq-tab.do")
	public ModelAndView getFAQList(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
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

//	회원 1:1 문의 memberQ-tab 페이지
	@RequestMapping("/memberQ-tab.do")
	public ModelAndView getMemQList(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		int count;
		List<BoardVO> memQList;
		map.put("vo", vo);
		
		if (memberVO != null && memberVO.getMember_id() != null) {
			map.put("member_id", memberVO.getMember_id());
			
			if (vo.getDaterange() == null) {
				count = pagingService.getMemQCount(memberVO);
				map = pagingCon.getPaging(count, request, response);
				memQList = boardService.getMemQList(map);
			} else {
				count = pagingService.getSearchMemQCount(map);
				map = pagingCon.getPaging(count, request, response);
				memQList = boardService.getSearchMemQList(map);
			}
			
			mav.addObject("vo", vo);
			mav.addObject("paging", map.get("paging"));
			mav.addObject("MemQList", memQList);
			mav.setViewName(viewName);
			
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}

//	1:1 문의 글 작성 setViewName
	@RequestMapping(value = "/memQ-insert.do")
	public ModelAndView memQInsertView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		mav.addObject("memberInfo", memberVO);
		
		return mav;
	}

//	1:1 문의 글 작성
	@RequestMapping(value = "/memqAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memQInsert(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		map = filecon.fileUpload(multipartRequest, response);
		boardService.memQInsert(map);
		mav.setViewName("redirect:memberQ-tab.do");

		return mav;
	}

//	1:1 문의 글 수정 setView
	@RequestMapping(value = "/memQ-update.do")
	public ModelAndView memQUpdateView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String cPage = request.getParameter("cPage");
		System.out.println("asdfasdf111111111"+cPage);

		vo.setMember_id(memberVO.getMember_id());
		BoardVO memQ = boardService.getMemQ(vo);
		mav.addObject("memQ", memQ);
		mav.addObject("cPage", cPage);
		
		return mav;
	}

//	1:1 문의 글 수정
	@RequestMapping(value = "/memqUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memQUpdate(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String cPage = multipartRequest.getParameter("cPage");
		System.out.println("asdfasdf222222222"+cPage);
		String member_qna_num = multipartRequest.getParameter("member_qna_num");
		System.out.println("asdfasdf222222222"+member_qna_num);
		map = filecon.fileUpload(multipartRequest, response);
		boardService.memQUpdate(map);
		System.out.println("asdfasdf222222222"+member_qna_num);
		mav.setViewName("redirect:memQ.do?member_qna_num=" + member_qna_num + "&cPage=" + cPage);

		return mav;
	}
				
//	글 상세 불러오기
	@RequestMapping("/notice.do")
	public ModelAndView getNotice(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		boardService.noticeViewUpdate(vo.getNotice_num());
		
		int count;
		List<BoardVO> noticeList;
		BoardVO notice;
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
		
		for (BoardVO noticeVO : noticeList) {
			if (noticeVO.getNotice_num() == vo.getNotice_num() || noticeVO.getR_num() == vo.getR_num()) {
				notice = noticeVO;
				mav.addObject("notice", notice);
			}
		}
		
		mav.addObject("vo", vo);
		mav.addObject("paging", map.get("paging"));

		return mav;
	}

	@RequestMapping("/faq.do")
	public ModelAndView getFAQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		int count;
		List<BoardVO> faqList;
		BoardVO faq;
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
		
		for (BoardVO faqVO : faqList) {
			if (faqVO.getFaq_num() == vo.getFaq_num() || faqVO.getR_num() == vo.getR_num()) {
				faq = faqVO;
				mav.addObject("faq", faq);
			}
		}
		
		return mav;
	}

	@RequestMapping("/memQ.do")
	public ModelAndView getMemQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		map.put("member_id", memberVO.getMember_id());

		int count;
		List<BoardVO> memQList;
		BoardVO memQ;
		map.put("vo", vo);

		if (vo.getDaterange() == null) {
			count = pagingService.getMemQCount(memberVO);
			map = pagingCon.getPaging(count, request, response);
			memQList = boardService.getMemQList(map);
		} else {
			count = pagingService.getSearchMemQCount(map);
			map = pagingCon.getPaging(count, request, response);
			memQList = boardService.getSearchMemQList(map);
		}

		mav.addObject("vo", vo);
		mav.addObject("paging", map.get("paging"));
		
		for (BoardVO memQVO : memQList) {
			if (memQVO.getMember_qna_num() == vo.getMember_qna_num() || memQVO.getR_num() == vo.getR_num()) {
				memQ = memQVO;
				mav.addObject("memQ", memQ);
			}
		}

		return mav;
	}
	
	@RequestMapping("/member_order_list.do")
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String member_id = request.getParameter("member_id");
		List<OrderVO> orderList = boardService.getMemberOrderList(member_id);
		mav.addObject("orderList", orderList);
		return mav;
	}

}
