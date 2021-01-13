package com.project.shop.myaccount;

import org.springframework.stereotype.Component;

@Component("myAccountShippingVO")
public class MyAccountShippingVO {
	private String member_id;
	private String zipNo; 
	private String load_address; 
	private String jibun_address;
	private String rest_address;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	public String getLoad_address() {
		return load_address;
	}
	public void setLoad_address(String load_address) {
		this.load_address = load_address;
	}
	public String getJibun_address() {
		return jibun_address;
	}
	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}
	public String getRest_address() {
		return rest_address;
	}
	public void setRest_address(String rest_address) {
		this.rest_address = rest_address;
	} 

}
