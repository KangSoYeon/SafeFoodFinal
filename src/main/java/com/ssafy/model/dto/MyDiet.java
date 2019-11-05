package com.ssafy.model.dto;

public class MyDiet {
	private int dno;
	private String regdate;
	private int amount;
	private String code;
	private String id;
	
	public MyDiet() {}
	
	public MyDiet(int dno, String regdate, int amount, String code, String id) {
		super();
		this.dno = dno;
		this.regdate = regdate;
		this.amount = amount;
		this.code = code;
		this.id = id;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MyDiet [dno=" + dno + ", regdate=" + regdate + ", amount=" + amount + ", code=" + code + ", id=" + id
				+ "]";
	}
	
	
	
}
