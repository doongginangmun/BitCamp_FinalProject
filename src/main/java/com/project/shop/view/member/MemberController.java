package com.project.shop.view.member;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MailDto;
import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;
import com.project.shop.member.SendEmailService;


@Controller
@RequestMapping(value="/member")
public class MemberController extends BaseController{
   @Autowired
   private MemberService memberService;
   @Autowired
   private MemberVO memberVO;
   @Autowired
   private SendEmailService sendEmailService;
   
   //이메일과 아이디(id)의 일치여부를 check하는 컨트롤러
   @RequestMapping(value = "/signinCheck.do")
   public @ResponseBody Map<String, Boolean> passwordfind(String member_id, String email) throws Exception {
		Map<String, Boolean> json = new HashMap<String, Boolean>();
		boolean pwFindCheck = memberService.memberEmailCheck(member_id, email);

		System.out.println(pwFindCheck);
		json.put("check", pwFindCheck);
		return json;
	}
   
 //등록된 이메일로 임시비밀번호를 발송하고 발송된 임시비밀번호로 사용자의 pw를 변경하는 컨트롤러
   @RequestMapping(value = "/findPwSendEmail.do")
   public @ResponseBody void sendEmail(String member_id, String email){
       MailDto dto = sendEmailService.createMailAndChangePassword(member_id, email);
       sendEmailService.mailSend(dto);
   }
   
 //이메일 인증 비밀번호
   @RequestMapping(value = "/PwCheck.do")
   public @ResponseBody Map<String, Boolean> PwCheck(String member_id, String password) throws Exception {
 		Map<String, Boolean> json = new HashMap<String, Boolean>();
 		boolean pwFindCheck = memberService.PwCheck(member_id, password);
 		System.out.println("db안에 있는 아이디를 확인하고 싶다!! " + member_id);
 		System.out.println("db안에 있는 비밀번호를 확인하고 싶다!! " + password);
 		System.out.println("이메일로 받은 비밀번호 확인");
 		System.out.println(pwFindCheck);
 		json.put("check", pwFindCheck);
		return json;
 	}
   
   //이메일에서 인증받은 비밀번호 수정
   @RequestMapping(value = "/modifyPassword.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView modifyPassword(/* @RequestParam("member_id") String member_id, */
			   HttpServletRequest request, HttpServletResponse response) throws Exception{
	   		System.out.println("잘 실행되었습니다.");
			ModelAndView mav = new ModelAndView();
			String member_id = request.getParameter("member_id");
			String password = request.getParameter("password");
			System.out.println("아이디가 잘 넘어갔나요??  " + member_id);
			System.out.println("패스워드가 잘 넘어갔나요?? "+ password);

			HashMap<String,String> map = new HashMap<String, String>();
			map.put("member_id",member_id);
			map.put("password",password);
			memberService.modifyPassword(map);
			System.out.println("비밀번호 수정 완료!!");
			
			String messagePw="비밀번호 변경이 완료되었습니다."; 
	        mav.addObject("messagePw", messagePw);
			mav.setViewName("/member/loginForm");
			return mav;
   }
   
   @RequestMapping(value="/login.do" ,method = RequestMethod.POST)
   public ModelAndView login(MemberVO user ,
                           HttpServletRequest request, 
                           HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      memberVO = memberService.login(user);
      System.out.println("sql 실행");
      if(memberVO!= null && memberVO.getMember_name()!=null){
         HttpSession session = request.getSession();
         session = request.getSession();
         session.setAttribute("isLogOn", true);
         session.setAttribute("memberInfo",memberVO);
         
         String _action = (String)request.getParameter("_action");
         String action=(String)session.getAttribute("action");
         
         if(action!=null && action.equals("/order/orderEachGoods.do")){
            mav.setViewName("forward:"+action);
         }else if(_action!=null && _action.equals("productDetail")){
        	 String product_id = (String)request.getParameter("product_id");
        	 mav.setViewName("redirect:/product/productDetail.do?product_id="+product_id);
        	 
         }else{         
            mav.setViewName("redirect:/main/main.do");
         }            
      }else{
         String message="아이디와 비밀번호가 틀립니다. 다시 로그인해주세요"; 
         mav.addObject("message", message);
         mav.setViewName("/member/loginForm");
      }
      return mav;
   }
   
   @RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
   public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      HttpSession session=request.getSession();
      session.setAttribute("isLogOn", false);
      session.removeAttribute("memberInfo");
      mav.setViewName("redirect:/main/main.do");
      return mav;
   }

   @RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
   public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
                         HttpServletRequest request, HttpServletResponse response) throws Exception {
      response.setContentType("text/html; charset=utf-8");
      response.setHeader("Context-Type", "text/html; charset=utf-8");
      request.setCharacterEncoding("utf-8");
      String message = null;
      ResponseEntity resEntity = null;
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "text/html; charset=utf-8");
      try {
          memberService.addMember(_memberVO);
          message  = "<script>";
          message +=" alert('회원 가입을 마쳤습니다. 로그인창으로 이동합니다.');";
          message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
          message += " </script>";       
      }catch(Exception e) {
         message  = "<script>";
          message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
          message += " location.href='"+request.getContextPath()+"/member/signupForm.do';";
          message += " </script>";
         e.printStackTrace();
      }
      resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
      return resEntity;
   }
   
   @RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)//id 
   public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
      ResponseEntity resEntity = null;
      String result = memberService.overlapped(id);
      resEntity =new ResponseEntity(result, HttpStatus.OK);
      return resEntity;
   }

   
}
