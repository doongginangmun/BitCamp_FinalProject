package com.project.shop.orders.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertNewOrder(OrderVO orderVO) throws DataAccessException{
		sqlSession.insert("mappers.order.insertNewOrder", orderVO);
	}
	
	public void insertOrderDetail(List<ProductVO> item) throws DataAccessException{
		sqlSession.insert("mappers.order.insertOrderDetail", item);
		sqlSession.update("mappers.order.downStock",item);
		
	}
	
	public List<OrderVO> selectAdminOrderList(HashMap orderHash) throws Exception {      
	      ArrayList<OrderVO> orderList = (ArrayList)sqlSession.selectList("mappers.order.selectAdminOrderList",orderHash);
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
	
	public void changeOrderStatus(HashMap orderHash) throws Exception {
		sqlSession.update("mappers.order.changeOrderStatus",orderHash);

	}
	
}
