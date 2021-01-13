package com.project.shop.member.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED) 
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO user) throws Exception {
		return memberDAO.login(user);
	}
	
	@Override
	public MemberVO SnsLogin(MemberVO user) throws Exception {
		return memberDAO.SnsLogin(user);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}

	@Override
	public boolean memberEmailCheck(String member_id, String email) throws Exception {
		MemberVO memberVO = memberDAO.findEmailInfo(member_id);
		//정보가 없거나 id와 이메일이 일치하지 않는다면
		if(memberVO != null && memberVO.getMember_id().equals(member_id) && memberVO.getEmail().equals(email)) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void modifyPassword(HashMap map) throws Exception {
		memberDAO.modifyPassword(map);
	}
	
	//이메일로 인증받은 비밀번호 확인
//	@Override
//	public boolean findPw(String member_id, String email) throws Exception {
//		MemberVO memberVO = memberDAO.findEmailInfo(member_id);
//		//정보가 없거나 id와 이메일이 일치하지 않는다면
//		if(memberVO != null && memberVO.getMember_id().equals(member_id) && memberVO.getEmail().equals(email)) {
//			return true;
//		}else {
//			return false;
//		}
//	}
	@Override
	public boolean PwCheck(String member_id, String password) throws Exception {
		MemberVO memberVO = memberDAO.PwCheck(member_id);
		//정보가 없거나 id와 이메일이 일치하지 않는다면
		if(memberVO != null && memberVO.getPassword().equals(password)) {
			return true;
		}else {
			return false;
		}
	}
}
