package com.project.shop.member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
//발송할 이메일 내용(정보)를 저장할 Dto 생성
@Getter
@Setter
@NoArgsConstructor
public class MailDto {
    private String address;
    private String title;
    private String message;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
