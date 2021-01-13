package com.project.shop.product.board;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {//상품 후기 

	private int review_num; // 후기 번호
	private String product_id; // 상품 아이디
	private String member_id; // 회원 아이디
	private String title; // 제목
	private String contents; // 내용
	private String image1; // 이미지1
	private int views; // 조회수
	private int rated; // 별점
	private Date reg_date; // 등록 날짜
	private String image2; // 이미지2
	private String image3; // 이미지3
	private int rowNum;
	public ReviewVO() {

	}

	public ReviewVO(int review_num, String product_id, String member_id, String title, String contents,
			String image1, int views, int rated, Date reg_date, String image2, String image3) {
		this.review_num = review_num;
		this.product_id = product_id;
		this.member_id = member_id;
		this.title = title;
		this.contents = contents;
		this.image1 = image1;
		this.views = views;
		this.rated = rated;
		this.reg_date = reg_date;
		this.image2 = image2;
		this.image3 = image3;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getreview_num() {
		return review_num;
	}

	public void setreview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getproduct_id() {
		return product_id;
	}

	public void setproduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getmember_id() {
		return member_id;
	}

	public void setmember_id(String member_id) {
		this.member_id = member_id;
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

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getRated() {
		return rated;
	}

	public void setRated(int rated) {
		this.rated = rated;
	}

	public Date getreg_date() {
		return reg_date;
	}

	public void setreg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	@Override
	public String toString() {
		return "ProductBoardReviewVO [review_num=" + review_num + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", title=" + title + ", contents=" + contents + ", image1=" + image1 + ", views=" + views + ", rated="
				+ rated + ", reg_date=" + reg_date + ", image2=" + image2 + ", image3=" + image3 + "]";
	}

}