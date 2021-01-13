package com.project.shop.view.board;

public class main {

	public static void main(String[] args) {
		String date = "20/11/27 - 20/12/03";
		System.out.println("20/11/27 - 20/12/03");
		date = date.replaceAll(" ", "");
		System.out.println(date);
		String[] reg_date = date.split("-");
		for (String re : reg_date) {
			System.out.println(re);
		}
	}

}
