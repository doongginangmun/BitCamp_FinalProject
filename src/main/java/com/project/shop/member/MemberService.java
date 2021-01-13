package com.project.shop.member;

import java.util.HashMap;
import java.util.Map;

public interface MemberService {
	public MemberVO login(MemberVO user) throws Exception;
	MemberVO SnsLogin(MemberVO user) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	boolean memberEmailCheck(String member_id,String email) throws Exception;
	public void modifyPassword(HashMap map) throws Exception;
	boolean PwCheck(String member_id,String password) throws Exception;
}
