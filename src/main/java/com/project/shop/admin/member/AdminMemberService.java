package com.project.shop.admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.project.shop.member.MemberVO;

public interface AdminMemberService {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception;
	public MemberVO memberDetail(String member_id) throws Exception;
	public void  modifyMemberInfo(HashMap memberMap) throws Exception;
	public void  deleteMember(String member_id) throws Exception;
	

}