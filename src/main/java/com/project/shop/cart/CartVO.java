package com.project.shop.cart;

import org.springframework.stereotype.Component;

@Component
public class CartVO {
 private int cart_id;
 private String member_id;
 private String product_id;
 private int quantity;
 private String option_name;
 private String product_name;
 private String session_id;
public String getSession_id() {
	return session_id;
}
public void setSession_id(String session_id) {
	this.session_id = session_id;
}
@Override
public String toString() {
	return "CartVO [cart_id=" + cart_id + ", member_id=" + member_id + ", product_id=" + product_id + ", quantity="
			+ quantity + ", option_name=" + option_name + ", product_name=" + product_name + ", session_id="
			+ session_id + "]";
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public String getMember_id() {
	return member_id;
}
public String getOption_name() {
	return option_name;
}
public void setOption_name(String option_name) {
	this.option_name = option_name;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}
public String getProduct_id() {
	return product_id;
}
public void setProduct_id(String product_id) {
	this.product_id = product_id;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getCart_id() {
	return cart_id;
}
public void setCart_id(int cart_id) {
	this.cart_id = cart_id;
}
 
}
