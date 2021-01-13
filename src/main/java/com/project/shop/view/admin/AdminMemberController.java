package com.project.shop.view.admin;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.admin.member.AdminMemberService;
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;
import com.project.shop.product.Paging;
import com.project.shop.product.ProductService;

@Controller("adminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberController extends BaseController {
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	ProductService service;
	
	@Autowired
	private Paging p;
	
	@RequestMapping(value="memberList.do")
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
				
		//검색 날짜
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()){
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			condMap.put(name, value);
			System.out.println(name+":"+value);
		}
		
		//페이징 처리
		p= service.pageList(request.getParameter("cPage"));
		mav.addObject("pvo", p);
		condMap.put("begin", p.getBegin());
		condMap.put("end", p.getEnd());
		
		
		ArrayList<MemberVO> member_list=adminMemberService.listMember(condMap);
		mav.addObject("member_list", member_list);
		
		
		return mav;
	
	}
	
	@RequestMapping(value="/memberDetail.do")
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String member_id=request.getParameter("member_id");
		MemberVO member_info=adminMemberService.memberDetail(member_id);
		mav.addObject("member_info",member_info);
		return mav;
	}
	
	
	@RequestMapping(value="/deleteMember.do")
	public ModelAndView removeGoodsImage( @RequestParam("member_id") String member_id,
			                      HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		adminMemberService.deleteMember(member_id);
		mav.setViewName("redirect:/admin/member/memberList.do");
		return mav;
		
		
	}
	
	@RequestMapping(value="/modifyMemberInfo.do")
	public ModelAndView modifyMemberInfo(
			@RequestParam HashMap<String, String> memberMap,
			HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("memberID = " + memberMap.get("member_id"));
		System.out.println("member_date = " + memberMap.get("member_date"));
		adminMemberService.modifyMemberInfo(memberMap);
		
		mav.setViewName("redirect:/admin/member/memberList.do");
		return mav;
	}
	
	

}
