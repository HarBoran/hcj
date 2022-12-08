package com.web.jdbc;

public class seat_dto {
	
	private int seat_index;	
	private String seat_name;
	private String seat_unique_num;	
	private String reservation_check;
	private int sch_num;
	
	public seat_dto(){		
	}
	
	public int getSeat_index() {
		return seat_index;
	}
	public void setSeat_index(int seat_index) {
		this.seat_index = seat_index;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public String getSeat_unique_num() {
		return seat_unique_num;
	}
	public void setSeat_unique_num(String seat_unique_num) {
		this.seat_unique_num = seat_unique_num;
	}
	public String getReservation_check() {
		return reservation_check;
	}
	public void setReservation_check(String reservation_check) {
		this.reservation_check = reservation_check;
	}
	public int getSch_num() {
		return sch_num;
	}
	public void setSch_num(int sch_num) {
		this.sch_num = sch_num;
	}
	public seat_dto(int seat_index, String seat_name, String seat_unique_num, String reservation_check, int sch_num) {
		this.seat_index = seat_index;
		this.seat_name = seat_name;
		this.seat_unique_num = seat_unique_num;
		this.reservation_check = reservation_check;
		this.sch_num = sch_num;
	}
	
		
}
