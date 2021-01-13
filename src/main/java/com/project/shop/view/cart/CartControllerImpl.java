package com.project.shop.view.cart;

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
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.cart.CartController;
import com.project.shop.cart.CartVO;
import com.project.shop.cart.service.CartService;
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartVO cartVO;
	
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value="/myCartList.do", method=RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		 
		
		if(memberVO == null) {
			mav.setViewName("/cart/nonMemberCart");
			System.out.println("mav:"+mav);
			return mav;
		}else {
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		Map<String,List> cartMap = cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);
		
		return mav;
		}
	}

	@Override
	@RequestMapping(value="/addProductInCart.do", method= RequestMethod.POST, produces="application/text; charset=utf8")
	public String addProductInCart(@RequestParam("product_name") String product_name,
								   @RequestParam("quantity")   int quantity,
								   @RequestParam("option_name") String option_name,
															   HttpServletRequest request, 
															   HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		boolean isAreadyExisted;
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		if(memberVO!= null && memberVO.getMember_id()!=null){
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		cartVO.setQuantity(quantity);
		cartVO.setOption_name(option_name);
		cartVO.setProduct_name(product_name);
		}else {
			String member_id = session.getId();
			cartVO.setMember_id(member_id);
			cartVO.setQuantity(quantity);
			cartVO.setOption_name(option_name);
			cartVO.setProduct_name(product_name);
			session.setAttribute("cartVO", cartVO);
			
			if(option_name=="") {
			 isAreadyExisted = cartService.findCartProducts(cartVO);
			}else {
			 isAreadyExisted = cartService.findCartProduct(cartVO);
			}
			//return "logingo";
			if(isAreadyExisted==true) {
				return "already_existed";
			}else {
				return "add_success";
			}
		}
		//boolean isAreadyExisted;
		if(option_name=="") {
		 isAreadyExisted = cartService.findCartProducts(cartVO);
		}else {
		 isAreadyExisted = cartService.findCartProduct(cartVO);
		}
		if(isAreadyExisted==true) {
			return "already_existed";
		}else {
			cartService.addProductInCart(cartVO);
			return "add_success";
		}
	}
		
	@Override
	@RequestMapping(value="plusQuantity.do", method=RequestMethod.POST, produces="application/text; charset=utf8")
	public String plusQuantity(@RequestParam("product_name") String product_name,
							   @RequestParam("cart_id") int cart_id,
														HttpServletRequest request, 
														HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		cartVO.setCart_id(cart_id);
		cartVO.setProduct_name(product_name);
		cartService.plusQuantity(cartVO);
		
		return "add_success";
	}
	@Override
	@RequestMapping(value="minusQuantity.do", method=RequestMethod.POST, produces="application/text; charset=utf8")
	public String minusQuantity(@RequestParam("product_name") String product_name, 
								@RequestParam("cart_id") int cart_id,
								 HttpServletRequest request,HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		cartVO.setCart_id(cart_id);
		cartVO.setProduct_name(product_name);
		cartService.minusQuantity(cartVO);
		
		return "add_success1";
	}
	@Override
	@RequestMapping(value="/removeCartProduct.do", method=RequestMethod.POST, produces="application/text; charset=utf8")
	public String removeCartProduct(@RequestParam("cart_id") int cart_id,
									@RequestParam("product_name") String product_name,
										   HttpServletRequest request,HttpServletResponse response)throws Exception {
		
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		cartVO.setCart_id(cart_id);
		cartVO.setProduct_name(product_name);
		cartService.deleteProductInCart(cartVO);
		
		return "add_success";
	}

	@Override
	@RequestMapping(value="/deleteAllProduct.do", method=RequestMethod.GET)
	public ModelAndView deleteAllProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/cart/myCartList.do");
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		cartService.deleteAllProduct(cartVO);
		return mav;
	}

	@Override
	@RequestMapping(value="/cartChkCount.do", method=RequestMethod.POST, produces="application/text; charset=utf8")
	public String cartChkCount(@RequestParam("member_id") String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//HttpSession session = request.getSession();
		//memberVO = (MemberVO)session.getAttribute("memberInfo");
		cartVO.setMember_id(member_id);
		
		String result = (String)cartService.cartChkCount(cartVO);
		return result;
	}


	
	


	
}
