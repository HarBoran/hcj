package com.web.jdbc;

public class reservation_dto {
	
	private int index;
	private int sch_num;
	private int seat_index;
	private int check_user;
	private int nonuser_index;
	private int user_index;		
	

	public reservation_dto(int sch_num, int seat_index, int check_user, int nonuser_index, int user_index) {
		super();
		this.sch_num = sch_num;
		this.seat_index = seat_index;
		this.check_user = check_user;
		this.nonuser_index = nonuser_index;
		this.user_index = user_index;
	}

	public reservation_dto(int sch_num, int seat_index) {
		super();
		this.sch_num = sch_num;
		this.seat_index = seat_index;
	}
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getSch_num() {
		return sch_num;
	}
	public void setSch_num(int sch_num) {
		this.sch_num = sch_num;
	}
	public int getSeat_index() {
		return seat_index;
	}
	public void setSeat_index(int seat_index) {
		this.seat_index = seat_index;
	}
	public int getCheck_user() {
		return check_user;
	}
	public void setCheck_user(int check_user) {
		this.check_user = check_user;
	}
	public int getNonuser_index() {
		return nonuser_index;
	}
	public void setNonuser_index(int nonuser_index) {
		this.nonuser_index = nonuser_index;
	}
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}

}
