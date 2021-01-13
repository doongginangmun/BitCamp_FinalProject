package com.project.shop.orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrderService {
	public void addOrder(OrderVO orderVO, Map<String,List> cartMap) throws Exception;
	public List<OrderVO> selectAdminOrderList(HashMap orderHash) throws Exception;
	public Map<String,Object> selectAdminOrderDetail(String order_num) throws Exception;
	public void changeOrderStatus(HashMap orderHash) throws Exception;

}
