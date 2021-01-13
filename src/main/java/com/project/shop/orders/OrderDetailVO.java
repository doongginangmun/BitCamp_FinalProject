package com.project.shop.orders;

import org.springframework.stereotype.Component;

@Component("orderDetailVO")
public class OrderDetailVO {
	String order_num;
	String product_id;
	int order_quantity;
	int price;
	
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	@Override
	public String toString() {
		return "OrderDetailVO [order_num=" + order_num + ", item_num=" + product_id + ", price=" + price
				+ ", order_quantity=" + order_quantity + "]";
	}
	
	

}
