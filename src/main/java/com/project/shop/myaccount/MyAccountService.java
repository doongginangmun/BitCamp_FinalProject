package com.project.shop.myaccount;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.shop.member.MemberVO;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

public interface MyAccountService{
	public MemberVO accountSettingsInfo(String member_id) throws Exception;
	public MemberVO modifyMemberInfo(HashMap memberMap) throws Exception;
	public MemberVO modifyAddressInfo(HashMap map) throws Exception;
	public HashMap<String, Object> selectFavList(String member_id) throws Exception;
	public void deleteFav(HashMap ids) throws Exception;
	public void addFav(HashMap ids) throws Exception;
	public List<OrderVO> selectOrderList(HashMap orderHash) throws Exception;
	public Map<String,Object> selectOrderDetail(String order_num) throws Exception;
	public void deleteAccount(String member_id) throws Exception;
	public void addAddress(HashMap map) throws Exception;
	public List<MyAccountShippingVO> listshippList(String member_id) throws Exception;
//	public void deleteShipping(HashMap map) throws Exception;
	public void deleteShipping(String zipNo) throws Exception;
	public void defaultShippingPoint(String member_id) throws Exception;

}
