package com.project.shop.member.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberVO login(MemberVO user) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.login",user);
		return member;
	}
	
	public MemberVO SnsLogin(MemberVO user) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.SnsLogin",user);
		return member;
	}
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mappers.member.insertNewMember", memberVO);
	}
	
	public String selectOverlappedID(String member_id) throws DataAccessException {
		String result =  sqlSession.selectOne("mappers.member.selectOverlappedID",member_id);
		return result;
	}
	//비밀번호 찾기
	public MemberVO findEmailInfo(String member_id) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.findEmailInfo",member_id);
		return member;
	}
	
	//이메일로 인증받은 비밀번호 수정
	public void updateUserPassword(HashMap<String,String> map) throws DataAccessException{
			System.out.println("비밀번호 수정=====패스워드====== "+ map.get("password"));
			System.out.println("비밀번호 수정=====아이딘====== "+ map.get("member_id"));
			sqlSession.update("mappers.member.updateUserPassword", map);
	}
	
//	비밀번호 수정
	public void modifyPassword(HashMap map) throws DataAccessException{
		sqlSession.selectOne("mappers.member.modifyPassword",map);
	}
	
	//비밀번호 찾기
		public MemberVO PwCheck(String member_id) throws DataAccessException{
			MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.findEmailInfo",member_id);
			return member;
		}

}
