package com.web.epictrip.vo;
// com.web.epictrip.vo.Admin_Month_Vo
public class Admin_Month_Vo {

	private String sales_day;
	private int daily_sales;
	private int tot_cnt;
	
	public Admin_Month_Vo() {
		super();
	}
	
	public Admin_Month_Vo(String sales_day, int daily_sales, int tot_cnt) {
		super();
		this.sales_day = sales_day;
		this.daily_sales = daily_sales;
		this.tot_cnt = tot_cnt;
	}
	
	public String getSales_day() {
		return sales_day;
	}
	public void setSales_day(String sales_day) {
		this.sales_day = sales_day;
	}
	public int getDaily_sales() {
		return daily_sales;
	}
	public void setDaily_sales(int daily_sales) {
		this.daily_sales = daily_sales;
	}
	public int getTot_cnt() {
		return tot_cnt;
	}
	public void setTot_cnt(int tot_cnt) {
		this.tot_cnt = tot_cnt;
	}
	
}
