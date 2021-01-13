package com.project.shop.view.orders;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.cart.CartVO;
import com.project.shop.cart.service.CartService;
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;
import com.project.shop.orders.OrderService;
import com.project.shop.orders.OrderVO;

@Controller
@RequestMapping(value="/orders")
public class OrdersController extends BaseController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	
	@RequestMapping(value="/checkout.do")
	public ModelAndView checkout(HttpServletRequest request) throws Exception {
		//로그인이면 checkout-logged로, 로그인이 아니면 checkout으로.
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		MemberVO memberVo = (MemberVO)session.getAttribute("memberInfo");
		Map<String,List> cartMap = (Map)session.getAttribute("cartMap");

		if(isLogOn !=null && isLogOn.equals(true) && memberVo !=null) {
			//checkout-logged일땐 member정보 연동
			mav.addObject("memberInfo", memberVo);
			mav.setViewName("/orders/checkout-logged");
			String member_id = memberVo.getMember_id();
			cartVO.setMember_id(member_id);
			cartMap = cartService.myCartList(cartVO);
			session.setAttribute("cartMap", cartMap);
		}
		
		if(cartMap==null) {
			mav.setViewName("main/main");
			
		}
		
		//둘다 product정보 연동
		return mav;
		
	}
	
	@RequestMapping(value="/import.do")
	public ModelAndView memberList(@ModelAttribute("OrderVO") OrderVO orderVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		System.out.println("viewName: " + viewName);
		ModelAndView mav = new ModelAndView(viewName);
		
		System.out.println("import: "+orderVO);
		String address = orderVO.getLoad_address() +" "+ orderVO.getRest_address();
		orderVO.setAddress(address);
		mav.addObject(orderVO);
		return mav;
	
	}
	
	@RequestMapping(value="/addOrder.do")
	public void orderComplete(@ModelAttribute("OrderVO") OrderVO orderVO,HttpServletRequest request) throws Exception {
		System.out.println("결제성공: "+orderVO);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		if(memberInfo!=null) {
		String member_id = memberInfo.getMember_id();
		orderVO.setMember_id(member_id);
		}
		Map<String,List> cartMap = (Map)session.getAttribute("cartMap");
		orderService.addOrder(orderVO, cartMap);
		
	}
	

	@RequestMapping(value="/paySuccess.do")
	public ModelAndView paySuccess(@ModelAttribute("order_num") String order_num,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		cartService.deleteAllProduct(cartVO);
		
		return mav;
	}
	
	

}
