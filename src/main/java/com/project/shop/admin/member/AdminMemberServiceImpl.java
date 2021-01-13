package com.project.shop.admin.member;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberVO;


@Service("adminMemberService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception{
		ArrayList<MemberVO> memberList = null;
		if(condMap.get("search_daterange")==null) {			
			memberList = adminMemberDAO.listMember(condMap);
		} else {
			String daterange = (String)condMap.get("search_daterange");
			String[] date = daterange.split(" - ");
			condMap.put("beginDate", date[0]);
			condMap.put("endDate", date[1]);
			memberList= adminMemberDAO.searchMember(condMap);
		}
		return memberList;
	}

	@Override
	public MemberVO memberDetail(String member_id) throws Exception{
		 return adminMemberDAO.memberDetail(member_id);
	}
	
	@Override
	public void  modifyMemberInfo(HashMap memberMap) throws Exception{
		 adminMemberDAO.modifyMemberInfo(memberMap);
	}
	
	public void  deleteMember(String member_id) throws Exception{		 
		 adminMemberDAO.deleteMember(member_id);
	}

}
