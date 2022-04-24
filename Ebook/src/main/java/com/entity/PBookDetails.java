package com.entity;

public class PBookDetails {
	
	private int pId;
	private String pBookName;
	private String pAuthorName;
	private String pBookLanguage;
	private String pBookIsbn;
	private String pBookYear;
	private String pPrice;
	private String pDiscount;
	private String pPage;
	private String pPhoto;
	private String pBookDescription;
	private String pBookStatus;
	private String pRegNo;
	private String pEmail;
	private String adminDiscount;
	private String adminPrice;
	private String bookCatagory;
	
	public PBookDetails(String pBookName ,String pAuthorName ,String pBookLanguage,String pBookIsbn ,String pBookYear,String pPrice, String pDiscount, String pPage, String pPhoto, String pBookDescription,String pBookStatus,String pRegNo ,String pEmail,String adminDiscount,String adminPrice,String bookCatagory) {
		super();
		// TODO Auto-generated constructor stub
		
		this.pBookName = pBookName ;
		this.pAuthorName = pAuthorName;
		this.pBookLanguage = pBookLanguage ;
		this.pBookIsbn = pBookIsbn ;
		this.pBookYear = pBookYear ;
		this.pPrice = pPrice ;
		this.pDiscount = pDiscount ;
		this.pPage = pPage ;
		this.pPhoto = pPhoto;
		this.pBookDescription = pBookDescription;
		this.pBookStatus = pBookStatus ;
		this.pRegNo = pRegNo;
		this.pEmail = pEmail;
		this.adminDiscount=adminDiscount;
		this.adminPrice=adminPrice;
		this.bookCatagory=bookCatagory;
		
	}



	

	




	public PBookDetails() {
		// TODO Auto-generated constructor stub
	}





	public String getBookCatagory() {
		return bookCatagory;
	}



	public void setBookCatagory(String bookCatagory) {
		this.bookCatagory = bookCatagory;
	}


	public String getAdminPrice() {
		return adminPrice;
	}


	public void setAdminPrice(String adminPrice) {
		this.adminPrice = adminPrice;
	}


	public int getpId() {
		return pId;
	}



	public void setpId(int pId) {
		this.pId = pId;
	}



	public String getpBookName() {
		return pBookName;
	}



	public void setpBookName(String pBookName) {
		this.pBookName = pBookName;
	}



	public String getpAuthorName() {
		return pAuthorName;
	}



	public void setpAuthorName(String pAuthorName) {
		this.pAuthorName = pAuthorName;
	}



	public String getpBookLanguage() {
		return pBookLanguage;
	}



	public void setpBookLanguage(String pBookLanguage) {
		this.pBookLanguage = pBookLanguage;
	}



	public String getpBookIsbn() {
		return pBookIsbn;
	}



	public void setpBookIsbn(String pBookIsbn) {
		this.pBookIsbn = pBookIsbn;
	}



	public String getpBookYear() {
		return pBookYear;
	}



	public void setpBookYear(String pBookYear) {
		this.pBookYear = pBookYear;
	}



	public String getpPrice() {
		return pPrice;
	}



	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}



	public String getpDiscount() {
		return pDiscount;
	}



	public void setpDiscount(String pDiscount) {
		this.pDiscount = pDiscount;
	}

	public String getAdminDiscount() {
		return adminDiscount;
	}





	public void setAdminDiscount(String adminDiscount) {
		this.adminDiscount = adminDiscount;
	}


	public String getpPage() {
		return pPage;
	}



	public void setpPage(String pPage) {
		this.pPage = pPage;
	}



	public String getpPhoto() {
		return pPhoto;
	}



	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}



	public String getpBookDescription() {
		return pBookDescription;
	}



	public void setpBookDescription(String pBookDescription) {
		this.pBookDescription = pBookDescription;
	}



	public String getpBookStatus() {
		return pBookStatus;
	}



	public void setpBookStatus(String pBookStatus) {
		this.pBookStatus = pBookStatus;
	}



	public String getpRegNo() {
		return pRegNo;
	}



	public void setpRegNo(String pRegNo) {
		this.pRegNo = pRegNo;
	}



	public String getpEmail() {
		return pEmail;
	}



	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}



	@Override
	public String toString() {
		return "PBookDetails [pId=" + pId + ", pBookName=" + pBookName + ", pAuthorName=" + pAuthorName
				+ ", pBookLanguage=" + pBookLanguage + ", pBookIsbn=" + pBookIsbn + ", pBookYear=" + pBookYear
				+ ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pPage=" + pPage + ", pPhoto=" + pPhoto
				+ ", pBookDescription=" + pBookDescription + ", pBookStatus=" + pBookStatus + ", pRegNo=" + pRegNo
				+ ", pEmail=" + pEmail + ", adminDiscount=" + adminDiscount + ", adminPrice=" + adminPrice
				+ ", bookCatagory=" + bookCatagory + "]";
	}
	
	
	    public int getPriceAfterDiscount() {
	    	int admindi=Integer.parseInt(adminDiscount);
	    	int price1=Integer.parseInt(pPrice);
	    	int dis=(int)((admindi*price1)/100);
	    	return price1-dis;
	    }
	    
	    public int getPricePublisherDiscount() {
	    	int publisherdis=Integer.parseInt(pDiscount);
	    	int price1=Integer.parseInt(pPrice);
	    	int dis=(int)((publisherdis*price1)/100);
	    	return price1-dis;
	    }
	    
	    public double getPriceAfterDiscount1() {
	    	double admindi=Double.parseDouble(adminDiscount);
	    	double price1=Double.parseDouble(pPrice);
	    	int dis=(int)((admindi*price1)/100);
	    	return price1-dis;
	    }
	   
  
}
