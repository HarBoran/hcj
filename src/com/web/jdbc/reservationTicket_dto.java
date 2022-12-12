package com.web.jdbc;

public class reservationTicket_dto {
	private String title;
	private String date;
	private String running_time;
	private int theater;
	private int seat_index;
	 	 
	public reservationTicket_dto(String title, String date, String running_time, int theater, int seat_index) {
		super();
		this.title = title;
		this.date = date;
		this.running_time = running_time;
		this.theater = theater;
		this.seat_index = seat_index;
	}
	 
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRunning_time() {
		return running_time;
	}
	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}
	public int getTheater() {
		return theater;
	}
	public void setTheater(int theater) {
		this.theater = theater;
	}
	public int getSeat_index() {
		return seat_index;
	}
	public void setSeat_index(int seat_index) {
		this.seat_index = seat_index;
	}

}
