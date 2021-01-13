package com.project.shop.myaccount.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberVO;
import com.project.shop.myaccount.MyAccountShippingVO;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Repository("myAccountDAO")
public class MyAccountDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO = (MemberVO)sqlSession.selectOne("mappers.myaccount.selectMyDetailInfo",member_id);
		return memberVO;
	}
	
	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException{
		System.out.println("MyAccountDAO = " + memberMap.get("member_id"));
		sqlSession.update("mappers.myaccount.modifyMemberInfo",memberMap);
	}
	
	public void modifyAddressInfo(HashMap map) throws DataAccessException{
		sqlSession.update("mappers.myaccount.modifyAddressInfo",map);
	}
	
	public List<ProductVO> selectFavList(String member_id) throws Exception {      
	      ArrayList<ProductVO> favList = (ArrayList)sqlSession.selectList("mappers.myaccount.selectFavList",member_id);
	      return favList;
	   }
	public String selectFavItem(HashMap ids) throws Exception{
		String product_id = (String)sqlSession.selectOne("mappers.myaccount.selectFavitem", ids);
		return product_id;
	}
	
	public void deleteFav(HashMap ids) throws Exception{
		sqlSession.delete("mappers.myaccount.deleteFavList",ids);
	}
	
	public void addFav(HashMap ids) throws Exception{
		sqlSession.insert("mappers.myaccount.addFavList",ids);
	}
	
	public List<OrderVO> selectOrderList(HashMap orderHash) throws Exception {   		
	      ArrayList<OrderVO> orderList = (ArrayList)sqlSession.selectList("mappers.order.selectOrderList",orderHash);
	      return orderList;
	   }
	public OrderVO selectOrderDetail(String order_num) throws Exception{
		OrderVO orderVO = (OrderVO)sqlSession.selectOne("mappers.order.selectOrderDetail",order_num);
		return orderVO;
	}
	
	public List<ProductVO> selectOrderDetailProduct(String order_num) throws Exception{
		List<ProductVO> productList = (List)sqlSession.selectList("mappers.order.selectOrderDetailProduct", order_num);
		return productList;
		
	}
	
	public void deleteAccount(String member_id) throws Exception{
		sqlSession.delete("mappers.myaccount.deleteAccount",member_id);
	}
	
	public void addAddress(HashMap map) throws DataAccessException{
		sqlSession.insert("mappers.myaccount.addAddress", map);
	}
	
	public List<MyAccountShippingVO> listshippList(String member_id) throws Exception {
		System.out.println("===================================");
		System.out.println("myAccountDAO // listshippList 아이디 확인" + member_id );
		ArrayList<MyAccountShippingVO> listshippList = (ArrayList)sqlSession.selectList("mappers.myaccount.listshippList",member_id);
	    return listshippList;
	}
	
//	public void deleteShipping(HashMap map) throws Exception{
//		System.out.println("==============  $$$$ 이건 DAO $$$$  =====================");
//		System.out.println("여기 까지 삭제가 잘 되어 지나요??");
//		System.out.println("listshippList 아이디 확인:          " + map.get("member_id"));
//		System.out.println("myAccountService 우편번호:          " + map.get("zipNo"));
//		System.out.println("Account 삭제할 도로명주소:           " + map.get("load_address"));
//		System.out.println("Account 삭제할 지번 주소:          " + map.get("jibun_address"));
//		System.out.println("Account 삭제할 나머지 주소:          " + map.get("rest_address"));
//		sqlSession.delete("mappers.myaccount.deleteShipping", map);
//	}
	
	public void deleteShipping(String zipNo) throws Exception{
		System.out.println("==============  $$$$ 이건 DAO $$$$  =====================");
		System.out.println("여기 삭제할 나머지 주소:          " + zipNo);
		sqlSession.delete("mappers.myaccount.deleteShipping", zipNo);
	}
	
	public void defaultShippingPoint(String member_id) throws Exception{
		System.out.println("==============  $$$$ 이건 DAO $$$$  =====================");
		System.out.println("여기 삭제할 나머지 주소: 여기까지 아이디가 넘어오나요??    "+member_id);
		sqlSession.update("mappers.myaccount.defaultShippingPoint", member_id);
	}
}
