package com.project.shop.board;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardVO {
	
	private String[] dateArray;
	private String daterange;
	private String dateBegin;
	private String dateEnd;
	private String searchCondition;
	private String searchKeyword;
	
	public String getDateBegin() {
		return dateBegin;
		
	}

	public void setDateBegin(String dateBegin) {
		this.dateBegin = dateBegin;
	}

	public String getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	
	public String[] getDateArray() {
		return dateArray;
	}

	public void setDateArray(String[] dateArray) {
		this.dateArray = dateArray;
		setDateBegin(dateArray[0]);
		System.out.println(dateBegin);
		setDateEnd(dateArray[1]);
		System.out.println(dateEnd);
	}

	public String getDaterange() {
		return daterange;
	}

	public void setDaterange(String daterange) {
		this.daterange = daterange.replaceAll(" ", "");
		dateArray = daterange.split("-");
		setDateArray(dateArray);
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
		System.out.println(searchCondition);
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
		System.out.println(searchKeyword);
	}

	@Override
	public String toString() {
		return "BoardVO [image=" + image + ", r_num=" + r_num + ", parent_num=" + parent_num + ", notice_num="
				+ notice_num + ", next_no=" + next_no + ", pre_no=" + pre_no + ", title=" + title + ", contents="
				+ contents + ", reg_date=" + reg_date + ", views=" + views + ", faq_num=" + faq_num
				+ ", qna_category_num=" + qna_category_num + ", qna_category_name=" + qna_category_name
				+ ", product_qna_num=" + product_qna_num + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", product_name=" + product_name + ", member_qna_num=" + member_qna_num + ", order_num=" + order_num
				+ ", email=" + email + ", phone=" + phone + "]";
	}

	private String image;
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

//	row_num
	private int r_num;
	private int parent_num;

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

//	공지사항
	private int notice_num;
	private int next_no;
	private int pre_no;
	private String title;
	private String contents;
	private Date reg_date;
	private int views;

//	FAQ
	private int faq_num;
	private int qna_category_num;
	private String qna_category_name;

// 상품문의
	private int product_qna_num;
	private String product_id;
	private String member_id;
	private String product_name;

//	1:1 문의
	private int member_qna_num;
	private String order_num;
	private String email;
	private String phone;
	
	public String getProduct_name() {
		return product_name;
	}
	
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public int getQna_category_num() {
		return qna_category_num;
	}
	
	public void setQna_category_num(String qna_category_num) {
		this.qna_category_num = Integer.parseInt(qna_category_num);
	}
	
	public void setQna_category_num(int qna_category_num) {
		this.qna_category_num = qna_category_num;
	}

	public int getProduct_qna_num() {
		return product_qna_num;
	}

	public void setProduct_qna_num(int product_qna_num) {
		this.product_qna_num = product_qna_num;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getParent_num() {
		return parent_num;
	}

	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}

	public int getMember_qna_num() {
		return member_qna_num;
	}

	public void setMember_qna_num(int member_qna_num) {
		this.member_qna_num = member_qna_num;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQna_category_name() {
		return qna_category_name;
	}

	public void setQna_category_name(String qna_category_name) {
		this.qna_category_name = qna_category_name;
	}

	public int getNext_no() {
		return next_no;
	}

	public void setNext_no(int next_no) {
		this.next_no = next_no;
	}

	public int getPre_no() {
		return pre_no;
	}

	public void setPre_no(int pre_no) {
		this.pre_no = pre_no;
	}
	
}
