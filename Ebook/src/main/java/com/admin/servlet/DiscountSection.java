package com.admin.servlet;

public class DiscountSection {

	
	public static int getFinalPrice(int discount,int price) {
		int disprice=(int)((price*discount)/100);
		int finalPrice=price-disprice;
		return finalPrice;
	}
}
