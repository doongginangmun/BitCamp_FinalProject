package com.project.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MailDto;
import com.project.shop.member.SendEmailService;
import com.project.shop.product.Paging;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController extends BaseController {
	@Autowired
	ProductService service;
	List<ProductVO> bestlist, newlist;
	
	@Autowired
	private SendEmailService sendEmailService;

	@Autowired
	private Paging p;

	@RequestMapping(value = "/main/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		bestlist = service.bestList();
		mav.addObject("bestlist", bestlist);
		newlist = service.newList();
		mav.addObject("newlist", newlist);

		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
	}

	@RequestMapping(value = "/main/searchResult.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchResult(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav.setViewName((String) request.getAttribute("viewName"));
		String search_word = request.getParameter("search_word");

		if (search_word != "") {
			mav.addObject("search_word", search_word);
		}
		// 페이징 처리
		p = service.searchList(request.getParameter("cPage"), search_word);
		mav.addObject("pvo", p);
		// 상품리스트 가져오기
		mav.addObject("list", service.searchProduct(p.getBegin(), p.getEnd(), search_word));
		return mav;
	}
	
	@RequestMapping(value="/main/newProduct.do")
	public ModelAndView newProduct(ModelAndView mav,HttpServletRequest request, HttpServletResponse response) throws Exception{
		newlist = service.newList();
		mav.addObject("list", newlist);
		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
	}
	
	@RequestMapping(value="/main/bestProduct.do")
	public ModelAndView bestProduct(ModelAndView mav,HttpServletRequest request, HttpServletResponse response) throws Exception{
		bestlist = service.bestList();
		mav.addObject("list", bestlist);
		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
	}
	
	@RequestMapping(value="/main/discountProduct.do")
	public ModelAndView discountProduct(ModelAndView mav,HttpServletRequest request, HttpServletResponse response) throws Exception{
		mav.addObject("list", service.discountList());
		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
	}
	
	//이메일과 아이디(id)의 일치여부를 check하는 컨트롤러
	 @RequestMapping(value = "/main/sendEmail.do")
	   public @ResponseBody void sendEmail(String email){
		 	System.out.println("이메일 확인"+email);
	       MailDto dto = sendEmailService.sendEmailAdvertise(email);
	       sendEmailService.mailSend(dto);
	   }
}
