package com.entity;


public class PCart {

	
	private int pcid;
	private int pbid;
	private int uuserId;
	private String pregNo;
	private String pBookName;
	private String pAuthor;
	private Double pPrice;
	private Double pTotalPrice;
	private String aDiscount;
	private String originalPrice;
	//private Double pDiscountPrice;
	//add pDiscountprice;
	//private String pPrice;
	
	
	
	
//	public PCart(int pcid, int pbid, int uuserId, String pregNo, String pBookName, String pAuthor, Double pPrice,
//			Double pTotalPrice, Double pDiscountPrice) {
//		super();
//		this.pcid = pcid;
//		this.pbid = pbid;
//		this.uuserId = uuserId;
//		this.pregNo = pregNo;
//		this.pBookName = pBookName;
//		this.pAuthor = pAuthor;
//		this.pPrice = pPrice;
//		this.pTotalPrice = pTotalPrice;
//		this.pDiscountPrice = pDiscountPrice;
//	}
	
	
	
//	public Double getpDiscountPrice() {
//		return pDiscountPrice;
//	}
//
//
//
//	public void setpDiscountPrice(Double pDiscountPrice) {
//		this.pDiscountPrice = pDiscountPrice;
//	}

PBookDetails pb=new PBookDetails();


   
	public String getOriginalPrice() {
	return originalPrice;
}
public void setOriginalPrice(String originalPrice) {
	this.originalPrice = originalPrice;
}
	public String getaDiscount() {
	return aDiscount;
}
  public void setaDiscount(String aDiscount) {
	this.aDiscount = aDiscount;
}
	public int getPcid() {
		return pcid;
	}
	public void setPcid(int pcid) {
		this.pcid = pcid;
	}
	public int getPbid() {
		return pbid;
	}
	public void setPbid(int pbid) {
		this.pbid = pbid;
	}
	public int getUuserId() {
		return uuserId;
	}
	public void setUuserId(int uuserId) {
		this.uuserId = uuserId;
	}
	public String getPregNo() {
		return pregNo;
	}
	public void setPregNo(String pregNo) {
		this.pregNo = pregNo;
	}
	public String getpBookName() {
		return pBookName;
	}
	public void setpBookName(String pBookName) {
		this.pBookName = pBookName;
	}
	public String getpAuthor() {
		return pAuthor;
	}
	public void setpAuthor(String pAuthor) {
		this.pAuthor = pAuthor;
	}
	public Double getpPrice() {
		return pPrice;
	}
	public void setpPrice(Double pPrice) {
		this.pPrice = pPrice;
	}
	public Double getpTotalPrice() {
		return pTotalPrice;
	}
	public void setpTotalPrice(Double pTotalPrice) {
		this.pTotalPrice = pTotalPrice;
	}
 
	
	
	

	
	@Override
	public String toString() {
		return "PCart [pcid=" + pcid + ", pbid=" + pbid + ", uuserId=" + uuserId + ", pregNo=" + pregNo + ", pBookName="
				+ pBookName + ", pAuthor=" + pAuthor + ", pPrice=" + pPrice + ", pTotalPrice=" + pTotalPrice
				+ ", aDiscount=" + aDiscount + ", originalPrice=" + originalPrice + "]";
	}
	
	 public int getPriceAfterDiscount3() {
	    	int admindi=Integer.parseInt(aDiscount);
	    	int price1=Integer.parseInt(originalPrice);
	    	int dis=(int)((admindi*price1)/100);
	    	return price1-dis;
	    }

	 
	
}
