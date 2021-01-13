package com.project.shop.view.admin;

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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {
	@Autowired
	ProductService service;
	
	@Autowired
	ProductBoardService boardService;
	
	@Autowired
	private Paging p;

	@RequestMapping(value = "/productAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productAdd(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public String add(ModelAndView mav,ProductVO vo ,MultipartHttpServletRequest request) throws Exception {
		if(vo != null && request != null) {
			service.insertProduct(vo,request);
		}
		return "redirect:productList.do";
	}
	
	@RequestMapping(value = "/productList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productList(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav.setViewName((String) request.getAttribute("viewName"));
		//페이징 처리
		p = service.pageList(request.getParameter("cPage"));
		mav.addObject("pvo", p);
		//상품리스트 가져오기
		mav.addObject("list", service.listProduct(p.getBegin(),p.getEnd()));		
		return mav;
	}
	
	@RequestMapping(value = "/productDelete.do",method=RequestMethod.GET)
	public String productDelete(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(request.getParameter("product_id") != null) {
			service.deleteProduct(request.getParameter("product_id"));
		}
		return "redirect:productList.do";
	}
	
	@RequestMapping(value = "/productUpdate.do",method=RequestMethod.GET)
	public ModelAndView productUpdate(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(request.getParameter("product_id") == null) {
			mav.addObject("list",service.allList());
			mav.setViewName("/admin/productList");
			return mav;
		}else {
			List<ProductVO> vo = service.loadOne(request.getParameter("product_id"));
			mav.addObject("one", vo );
			mav.setViewName((String) request.getAttribute("viewName"));
			return mav;
		}
		
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(ModelAndView mav,ProductVO vo ,MultipartHttpServletRequest request) throws Exception {
		if(vo != null && request != null) {
			service.updateProduct(vo,request);
		}
		return "redirect:productList.do";
	}
	
	@RequestMapping(value = "/productOption.do",method=RequestMethod.GET)
	public ModelAndView productOption(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(request.getParameter("product_id") == null) {
			mav.setViewName("/admin/productList");
			return mav;
		}else {
			mav.addObject("list",service.loadOption(request.getParameter("product_id")));
			mav.addObject("id",request.getParameter("product_id"));
			mav.setViewName((String) request.getAttribute("viewName"));
			return mav;
		}
	}
	
	@RequestMapping(value = "/productOptionDelete.do",method=RequestMethod.GET)
	public String productOptionDelete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("product_id");
		if(id != null) {
			service.deleteOption(request.getParameter("option_name"));
		}
		return "redirect:productOption.do?product_id="+id;
	}
	
	@RequestMapping(value = "/productOptionAdd.do",method=RequestMethod.GET)
	public String productOptionAdd(ProductVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("product_id");
		if(vo != null) {
			service.insertOption(vo);
		}
		return "redirect:productOption.do?product_id="+id;
	}
	
	@RequestMapping(value = "/checkProduct.do",method=RequestMethod.POST)
	public ResponseEntity checkProduct(@RequestParam("id") String id) throws Exception{
		  ResponseEntity resEntity = null;
	      String result = service.checkProduct(id);
	      resEntity =new ResponseEntity(result, HttpStatus.OK);
	      return resEntity;
	}
	
	@RequestMapping(value = "/checkItem.do",method=RequestMethod.POST)
	public ResponseEntity checkItem(@RequestParam("id") String id) throws Exception{
		  ResponseEntity resEntity = null;
	      String result = service.checkItem(id);
	      resEntity =new ResponseEntity(result, HttpStatus.OK);
	      return resEntity;
	}
	
	@RequestMapping(value = "/search.do",method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView search(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav.setViewName((String) request.getAttribute("viewName"));
		String search_type = request.getParameter("search_type");
		String search_word = request.getParameter("search_word");
		
		if(search_type !="" && search_word !="") {
			mav.addObject("search_type",search_type);
			mav.addObject("search_word",search_word);
		}
		//페이징 처리
		p = service.searchList(request.getParameter("cPage"),search_type,search_word);
		mav.addObject("pvo", p);
		//상품리스트 가져오기
		mav.addObject("list", service.searchProduct(p.getBegin(),p.getEnd(),search_type,search_word));
		return mav;
	}
	//아진
	@RequestMapping(value="/productQnaList.do")
	public ModelAndView productQnaList(@RequestParam(value="cPage", defaultValue="1") String cPage,
						HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Paging p = boardService.pagingInfo(null, cPage);
		mav.addObject("pvo", p);
		
		Map map = new HashMap();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		List<ProductBoardQnaVO> qnaList = boardService.getListQna(map);
		mav.addObject("qnaList", qnaList);
		
		return mav;
	}
	@RequestMapping(value="/productQnaForm.do")
	public ModelAndView productQnaForm(@RequestParam("product_qna_num") String product_qna_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		int qnaNo = Integer.parseInt(product_qna_num);
		ProductBoardQnaVO qna = boardService.getProductQna(qnaNo);
		mav.addObject("qna", qna);
		return mav;
	}
	@RequestMapping(value="productQnaReForm.do")
	public ModelAndView productQnaReForm(@RequestParam("product_id") String product_id,
									@RequestParam("parent_num") String parent_num,
									@RequestParam("title") String title,
									HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		if(memberInfo ==null) {
			mav.setViewName("/member/loginForm");
		}
		mav.addObject("product_id", product_id);
		mav.addObject("parent_num", parent_num);
		mav.addObject("title", title);
		mav.addObject("memberInfo", memberInfo);
		
		return mav;
	}
	@RequestMapping("/productQnaReInsert.do")
	public ModelAndView productQnaReInser(@RequestParam Map<String, String> info,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		
		//파일타입 파라미터 얻어오기 
		String path = "C:\\users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\images\\product_qna\\";
		List<String> fileList = fileProcess(multipartRequest, path);//이미지 이름 리스트
		System.out.println("fileList : "+fileList);
		
		int i=1;
		if(fileList !=null) {
			for(String image : fileList) {
				if(image != null) {
					System.out.println("i: "+i);
					info.put("image"+i, image);
					i++;
				}
			}
		}
		System.out.println("엥");
		boardService.addBoardQna(info);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin/productQnaList.do");
		return mav;
	}
	@RequestMapping("/productQnaReUpdateForm.do")
	public ModelAndView productQnaReUpdateForm(@RequestParam Map<String,String> info,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("info", info);
		
		return mav;
	}
	@RequestMapping("/productQnaReUpdate.do")
	public ModelAndView productQnaReUpdate(@RequestParam Map<String, String> info,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		
		//파일타입 파라미터 얻어오기 
		String path = "C:\\users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\images\\product_qna\\";
		List<String> fileList = fileProcess(multipartRequest, path);//이미지 이름 리스트
		
		int i=1;
		if(fileList !=null) {
			for(String image : fileList) {
				if(image != null) {
					info.put("image"+i, image);
					i++;
				}
			}
		}
		boardService.editBoaardQna(info);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin/productQnaList.do");
		return mav;
	}
	@RequestMapping("/productQnaDelete.do")
	public ModelAndView productQnaDelete(@RequestParam("product_qna_num") String product_qna_num,
				HttpServletRequest request, HttpServletResponse response) throws Exception{
		int qnaNo = Integer.parseInt(product_qna_num);
		boardService.deleteBoardQna(qnaNo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin/productQnaList.do");
		return mav;
	}
	// 파일타입 파라미터 얻어오기
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest, String path)
			throws Exception {
		List<String> fileNameList = new ArrayList<String>();

		List<MultipartFile> fileList = multipartRequest.getFiles("file[]");

		for (MultipartFile mfile : fileList) {
			String originalFileName = mfile.getOriginalFilename();
			fileNameList.add(originalFileName);
			System.out.println("파일이름: "+originalFileName);
			if(originalFileName == "") {
				System.out.println("null인갑쇼");
				return null;
			}
			String saveFile = path + originalFileName;
			File file = new File(saveFile);
			if (!file.exists()) {
				file.mkdirs();
				try {
					mfile.transferTo(new File(saveFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return fileNameList;
	}
}
