package com.project.shop.view.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;
import com.project.shop.product.Paging;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;
import com.project.shop.product.board.ProductBoardQnaVO;
import com.project.shop.product.board.ProductBoardService;
import com.project.shop.product.board.ReviewVO;

@Controller
@RequestMapping(value="/product")
public class ProductController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductBoardService productBoardService;
	
	
	@RequestMapping(value="/productList.do")
	public ModelAndView productList(@RequestParam(value="listKey", defaultValue="reg_date") String listKey,
									@RequestParam(value="orderKey", defaultValue="desc") String orderKey,
									@RequestParam Map<String, String> info,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러");
		//뷰정보
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//카테고리이름
		int product_category_num = Integer.parseInt(info.get("product_category_num"));
		String product_category_name = productService.productCategoryName(product_category_num);
		
		mav.addObject("product_category_num", product_category_num);
		mav.addObject("product_category_name", product_category_name);
		
		//정렬
		if(listKey.equals("reg_date")){
			mav.addObject("sortby", "신상품순");
		}else if(listKey.equals("price") && orderKey.equals("asc")) {
			mav.addObject("sortby", "낮은가격순");
		}else if(listKey.equals("price") && orderKey.equals("desc")) {
			mav.addObject("sortby", "높은가격순");
		}
		
		//페이징 처리
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			cPage="1";
		}
		Paging productP = productService.pagingInfo(product_category_num, cPage);
		mav.addObject("pvo", productP);
		
		
		//상품리스트 가져오기
		Map map = new HashMap();
		map.put("product_category_num", product_category_num );
		map.put("listKey", listKey);
		map.put("orderKey", orderKey);
		map.put("begin", productP.getBegin());
		map.put("end", productP.getEnd());
		
		List<ProductVO> productList = productService.listProduct(product_category_num, map);
		mav.addObject("productList", productList);
		
		return mav;
	}
	
	
	@RequestMapping(value="/productDetail.do")
	public ModelAndView productDetail(@RequestParam(value="product_id") String product_id,
								
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		//뷰정보
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);
		
		//상품정보
		ProductVO productVO =productService.productDetail(product_id);
		mav.addObject("vo", productVO);
		
		//옵션정보
		List<ProductVO> optionList = productService.productOption(product_id);
		mav.addObject("optionList", optionList);
		
		//Q&A 페이징 처리
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			cPage="1";
		}
		
		Paging qnaP = productBoardService.pagingInfo(product_id, cPage );
		mav.addObject("pvo", qnaP);
		
		
		//Q&A 글 가져오기
		Map map = new HashMap();
		map.put("product_id", product_id);
		map.put("begin", qnaP.getBegin());
		map.put("end", qnaP.getEnd());
		List<ProductBoardQnaVO> productBoardQnaList = productBoardService.getListQna(map);
		mav.addObject("qnaList", productBoardQnaList);
		
		//관리자 로그인
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		MemberVO vo = (MemberVO)session.getAttribute("memberInfo");

		if(isLogOn !=null && isLogOn.equals(true) && vo !=null) {
			if(vo.getMember_id().equals("admin")) {
				mav.addObject("member_id", vo.getMember_id());
			}
		}
		
		if(request.getParameter("msg") !=null) {
			mav.addObject("msg", request.getParameter("msg"));
		}
		
		
		//REVIEW 페이징 처리
		String nPage = request.getParameter("nPage");
		if(nPage == null) {
			nPage="1";
		}
		
		Paging reviewP = productBoardService.pagingInfo(product_id, nPage);
		mav.addObject("rePvo", reviewP);
		
		//REVIEW 글 가져오기
		map = new HashMap();
		map.put("product_id", product_id);
		map.put("begin", reviewP.getBegin());
		map.put("end", reviewP.getEnd());
		
		List<ReviewVO> reviewList = productBoardService.getListReview(map);
		mav.addObject("reviewList", reviewList);
		return mav;
	}
	
	// ========================== 상품 문의  ==============================
	// 상품QNA 글쓰기 폼 요청
	@RequestMapping(value="/insertQnaForm.do", method=RequestMethod.GET)
	public ModelAndView boardQnaForm(@RequestParam(value="product_id") String product_id,
			@RequestParam(value="product_qna_num", required=false ) String product_qna_num,
						HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		mav.addObject("product_id", product_id);

		if(isLogOn == null || isLogOn.equals(false) || memberInfo == null) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn.equals(true)) {
			if(memberInfo.getMember_id().equals("admin")) {
				//부모글번호 전송
				mav.addObject("parent_num", product_qna_num);
			}else {
				mav.addObject("parent_num", 0);
			}
			mav.addObject("memberInfo", memberInfo);
		}
		return mav;
	}
	// 상품QNA 글쓰기
	@RequestMapping(value="/insertQna.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addBoardQna(MultipartHttpServletRequest multipartRequest, 
								HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		
		String product_id = null;
		
		//일반타입 파라미터 얻어오기
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
			if(name.equals("product_id")) {
				product_id = multipartRequest.getParameter("product_id");
			}
		}
		//파일타입 파라미터 얻어오기 
		String path = "C:\\users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\images\\product_qna\\";
		List<String> fileList = fileProcess(multipartRequest, product_id, path);//이미지 이름 리스트
		
		int i=1;
		if(fileList !=null) {
			for(String image : fileList) {
				if(image != null) {
					map.put("image"+i, image);
					i++;
				}
			}
		}
		productBoardService.addBoardQna(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/product/productDetail.do?product_id="+product_id);
		return mav;
	}
	//상품QNA 글 수정폼 요청
	@RequestMapping(value="/updateQnaForm.do", method=RequestMethod.POST)
	public ModelAndView updateQnaForm(@RequestParam(value="product_id") String product_id,
			@RequestParam(value="product_qna_num") String product_qna_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//뷰정보 가져오기
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);

		//세션 멤버정보 가져오기
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		mav.addObject("memberInfo", memberInfo);
		mav.addObject("product_id", product_id );
		
		if(isLogOn == null || isLogOn == false || memberInfo ==null) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true && memberInfo !=null && product_qna_num !=null && product_qna_num !="") {
			//수정하기 버튼 => 해당글에 대한 정보 가졍
			ProductBoardQnaVO qna =productBoardService.getProductQna(Integer.parseInt(product_qna_num));
			if(qna.getmember_id().equals(memberInfo.getMember_id())) {
				mav.addObject("qna", qna);
			}else { //게시글작성자와 현재유저와 다를 경우
				mav.setViewName("redirect:/product/productDetail.do?");
				mav.addObject("msg", "게시글 작성자가 아닙니다.");
			}
		}
		return mav;
	}
	//상품QNA 수정하기
	@RequestMapping(value="/updateQna.do")
	public ModelAndView updateQna(@RequestParam Map<String, String> map,
									@RequestParam("product_id") String product_id,
								MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		String path = "C:\\users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\images\\product_qna\\";
		List<String> imageList = fileProcess(multipartRequest, product_id, path);
		int i=1;
		for(String image : imageList) {
			System.out.println("image : "+image);
			map.put("image"+i, image);
			i++;
		}
		productBoardService.editBoaardQna(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/product/productDetail.do");
		mav.addObject("product_id", product_id);
		return mav;
	}
	
	//상품QNA 삭제하기
	@RequestMapping(value="/deleteBoardQna.do")
	public ModelAndView deleteBoardQna(@RequestParam("product_qna_num") String product_qna_num,
										@RequestParam("product_id") String product_id,
						HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//세션 멤버정보 가져오기
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		System.out.println("isLogOn: "+isLogOn);
		System.out.println("memberInfo: "+memberInfo);
		mav.addObject("memberInfo", memberInfo);
		mav.addObject("product_id", product_id );
				
		if(isLogOn == null || isLogOn == false || memberInfo == null ) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true && product_qna_num !=null && product_qna_num !="") {
			mav.setViewName( "redirect:/product/productDetail.do");
			//삭제하기 버튼 => 해당글에 대한 정보 가졍
			int qna_num = Integer.parseInt(product_qna_num);
			ProductBoardQnaVO qna =productBoardService.getProductQna(qna_num);
			if(qna.getmember_id().equals(memberInfo.getMember_id())) {
				productBoardService.deleteBoardQna(qna_num);	
			}else { //게시글작성자와 현재유저와 다를 경우
				mav.addObject("msg", "게시글 작성자가 아닙니다.");
			}
		}
		return mav;
	}
	
	//파일타입 파라미터 얻어오기 
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest, 
								String product_id, String path) throws Exception{
		System.out.println("fileproceess 시작");
		List<String> fileNameList = new ArrayList<String>();
	   
		List<MultipartFile> fileList = multipartRequest.getFiles("file[]");
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		if(fileList.isEmpty()) {
			return null;
		}
		for(MultipartFile mfile : fileList) {
			String originalFileName = mfile.getOriginalFilename();
			fileNameList.add(originalFileName);
			
			String saveFile = path + originalFileName;
			File file = new File(saveFile);
			if(!file.exists()) {
				file.mkdirs();
				try {
					mfile.transferTo(new File(saveFile));
				}catch(IllegalStateException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		return fileNameList;
	}
	
	//=========================== 상품 후기 ==========================
	//상품후기 글쓰기 폼 요청
	@RequestMapping("/insertReviewForm.do")
	public ModelAndView reviewForm(@RequestParam("product_id") String product_id, 
					HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		if(isLogOn == null || memberInfo == null) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true && memberInfo != null) {
			mav.setViewName(viewName);
			mav.addObject("memberInfo", memberInfo);
			mav.addObject("product_id", product_id);
		}
		return mav;
	}
	//상품후기 글쓰기
	@RequestMapping("/insertReview.do")
	public ModelAndView insertReview(@RequestParam Map<String, String> info, 
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		
		multipartRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		
		//일반타입 파라미터 얻어오기
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		
		//파일타입 파라미터 얻어오기 
		String product_id = multipartRequest.getParameter("product_id");
		String path = "C:\\users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\images\\review\\";
		List<String> fileList = fileProcess(multipartRequest, product_id, path);//이미지 이름 리스트
		
		int i=1;
		if(fileList !=null) {
			for(String image : fileList) {
				if(image != null) {
					map.put("image"+i, image);
					i++;
				}
			}
		}
		productBoardService.addReview(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/product/productDetail.do?product_id="+product_id);
		return mav;
	}
	//상품후기 수정 폼 요청
	@RequestMapping("/updateReviewForm.do")
	public ModelAndView updateReviewForm(@RequestParam("product_id") String product_id,
					@RequestParam("review_num") String review_num ,
					HttpServletRequest request, HttpServletResponse response ) throws Exception {
		//뷰정보 가져오기
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);

		//세션 멤버정보 가져오기
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		mav.addObject("memberInfo", memberInfo);
		mav.addObject("product_id", product_id );
				
		if(isLogOn == null || isLogOn == false || memberInfo ==null) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true && memberInfo !=null && review_num !=null && review_num !="") {
			//수정하기 버튼 => 해당글에 대한 정보 가져오기
			ReviewVO review =productBoardService.getReview(Integer.parseInt(review_num));
			if(review.getmember_id().equals(memberInfo.getMember_id())) {
				mav.addObject("review", review);
			}else { //게시글작성자와 현재유저와 다를 경우
				mav.setViewName("redirect:/product/productDetail.do?");
				mav.addObject("msg", "게시글 작성자가 아닙니다.");
			}
		}
		return mav;
	}
	//상품후기 수정하기
	@RequestMapping("/updateReview.do")
	public ModelAndView updateReview(@RequestParam Map<String, String> info, 
						@RequestParam ("product_id") String product_id,
						MultipartHttpServletRequest multipartRequest, HttpServletResponse response ) throws Exception {
		String path = "C:\\users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\images\\review\\";
		List<String> imageList = fileProcess(multipartRequest, product_id, path);
		int i=1;
		if(imageList !=null ) {
			for(String image : imageList) {
				System.out.println("image"+i+": " +image);
				info.put("image"+i, image);
				i++;
			}
		}
		productBoardService.editReview(info);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/product/productDetail.do");
		mav.addObject("product_id", product_id);
		return mav;
	}
	//상품후기 삭제하기
	@RequestMapping(value="/deleteReview.do")
	public ModelAndView deleteReview(@RequestParam("review_num") String review_num,
										@RequestParam("product_id") String product_id,
						HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//세션 멤버정보 가져오기
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		
		mav.addObject("memberInfo", memberInfo);
		mav.addObject("product_id", product_id );
				
		if(isLogOn == null || isLogOn == false || memberInfo == null ) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true && memberInfo !=null && review_num !=null && review_num !="") {
			mav.setViewName( "redirect:/product/productDetail.do");
			//삭제하기 버튼 => 해당글에 대한 정보 가졍
			int reviewNum = Integer.parseInt(review_num);
			ReviewVO review =productBoardService.getReview(reviewNum);
			if(review.getmember_id().equals(memberInfo.getMember_id())) {
				productBoardService.deleteReview(reviewNum);	
			}else { //게시글작성자와 현재유저와 다를 경우
				mav.addObject("msg", "게시글 작성자가 아닙니다.");
			}
		}
		return mav;
	}
} 