package com.project.shop.view.member;

import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;


@Controller
@RequestMapping(value="/snsMember")
public class SnsMemberController extends BaseController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberController memberController;
	private String CLIENT_ID = "1090287714877-qd2ikq55m2grble3eltcrr4h9s1dpu6b.apps.googleusercontent.com";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	
	@RequestMapping(value="/googleLogin.do", produces="application/x-www-form-urlencoded; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String googleLogin(@RequestBody String param, HttpServletRequest request, HttpServletResponse response) {
		ObjectMapper mapper = new ObjectMapper();
		String jsonMember = null;
		HttpSession session = request.getSession();
		
		try {
			NetHttpTransport transport = GoogleNetHttpTransport.newTrustedTransport();
			String idTokenString = param.split("=")[1];

			GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, JSON_FACTORY)
					.setAudience(Collections.singletonList(CLIENT_ID))
					.build();

			GoogleIdToken idToken = verifier.verify(idTokenString);
			if (idToken != null) {
				Payload payload = idToken.getPayload();

				String member_id = payload.getSubject();
				System.out.println("구글로그인의 User ID: " + member_id);

				String email = payload.getEmail();
				String member_name = (String) payload.get("name");
				System.out.println(email);
				
				MemberVO vo = new MemberVO();
				vo.setMember_id(member_id);
				vo.setMember_name(member_name);
				vo.setEmail(email);				

				System.out.println("가기전 memberVO"+vo);
				
				//DB에서 로그인 값이 있는지 확인
				MemberVO memberVO = memberService.SnsLogin(vo);
				
				//vo에 값이 있으면 바로 로그인, 아니면 회원가입창으로 이동
				if(memberVO!= null && memberVO.getMember_name()!=null) {				
					jsonMember = mapper.writeValueAsString(memberVO);
					memberController.login(memberVO, request, response);
					
				} else {
					vo.setPassword("0000");
					session.setAttribute("memberInfo", vo);
					jsonMember = mapper.writeValueAsString(vo);
				}							

			}

		}catch(Exception e) {
//			System.out.println(e);
		}

		return jsonMember;
	}

}
