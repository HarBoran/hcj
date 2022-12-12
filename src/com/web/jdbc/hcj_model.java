package com.web.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.sql.DataSource;

public class hcj_model {
	
private DataSource dataSource;

	public hcj_model(DataSource theDataSource){
		dataSource = theDataSource;
	}
	
	public int sessionidChangeUserTable(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet myRs = null;			

		try{
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM user WHERE id = ?";

			pst= conn.prepareStatement(sql);
			pst.setString(1, id);
			myRs = pst.executeQuery();
			myRs.next();
			
			int user_index = myRs.getInt("user_index");
			return user_index;
	
//		}catch(Exception e){
//			System.out.println("Couldn't close connection: " + e.getMessage());
//			e.printStackTrace();
						
		}finally {
			close(conn, pst, myRs);
		}
	}
	
	public List<reservationTicket_dto> reservationTicket (int id) throws Exception{

		List<reservationTicket_dto> reservationTickets = new ArrayList<reservationTicket_dto>();
		Connection conn = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
				
		try{
			conn = dataSource.getConnection();
			String sql = "SELECT title, date, running_time, theater, seat_index"
					+ " FROM reservation LEFT JOIN schedule on reservation.sch_num = schedule.sch_num" 
					+ " LEFT JOIN movie on movie.movie_num = schedule.movie_num WHERE USER_index = ?";
			mySt= conn.prepareStatement(sql);
			mySt.setInt(1, id);
			myRs = mySt.executeQuery();

			while(myRs.next()) {
				

				reservationTicket_dto reservationTicket = new reservationTicket_dto(
						myRs.getString("title"), 
						myRs.getString("date"), 
						myRs.getString("running_time"), 
						myRs.getInt("theater"), 
						myRs.getInt("seat_index"));

				reservationTickets.add(reservationTicket);
				
				}
				return reservationTickets;
	
		}finally{
			close(conn, mySt, myRs);
		}	
	}		
		
	public void nonuser_reservation(reservation_dto reservation) throws Exception{
		Connection conn = null;
		PreparedStatement pst = null;
				
		try {
			conn = dataSource.getConnection();

			String sql = "INSERT INTO reservation"
			+" (sch_num, seat_index, check_user, nonuser_index)"
			+" values(?, ?, ?, ?)";
			
			pst = conn.prepareStatement(sql);
	
			pst.setInt(1, reservation.getSch_num());
			pst.setInt(2, reservation.getSeat_index());
			pst.setInt(3, reservation.getCheck_user());
			pst.setInt(4, reservation.getNonuser_index());		

			pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();		

		}finally{
			close(conn, pst, null);			
		}		
	}
	
	public void user_reservation(reservation_dto reservation) throws Exception{
		Connection conn = null;
		PreparedStatement pst = null;
				
		try {
			conn = dataSource.getConnection();
						
			String sql = "INSERT INTO reservation"
			+" (sch_num, seat_index, check_user, user_index)"
			+" values(?, ?, ?, ?)";
			
			pst = conn.prepareStatement(sql);

			pst.setInt(1, reservation.getSch_num());
			pst.setInt(2, reservation.getSeat_index());
			pst.setInt(3, reservation.getCheck_user());
			pst.setInt(4, reservation.getUser_index());
			

			pst.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();		

		}finally{
			close(conn, pst, null);			
		}		
	}
	
	public List<movie_dto> MovieTime (int moviename1) throws Exception {
	      
	      List<movie_dto> MovieTime = new ArrayList<>();
	      Connection conn = null;
	      Statement mySt = null;
	      ResultSet myRs = null;
	      
	      try {
	         conn = dataSource.getConnection();
	         mySt = conn.createStatement();
	         myRs = mySt.executeQuery("select sch_num,theater,date,time from schedule where movie_num = "+moviename1 );
	         while(myRs.next()) {
	            int sch_num = myRs.getInt("sch_num");
	            int theater = myRs.getInt("theater");
	            String date = myRs.getString("date");
	            String time = myRs.getString("time");
	            movie_dto movietime = new movie_dto(sch_num,theater,date,time);
	            MovieTime.add(movietime);
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return MovieTime;
	      		      
	   }
	
	public void joinMember(String id , String name , String birth , String phone_num) {
	      
      Connection conn;
      PreparedStatement mySt ;
      
      try {
         conn= dataSource.getConnection();
         mySt =conn.prepareStatement("insert into user(id,name,birth,phone_num) values\r\n"
               + "(?,?,?,?);");   
         mySt.setString(1, id);
         mySt.setString(2, name);
         mySt.setString(3, birth);
         mySt.setString(4, phone_num);
         
         mySt.execute();
      }catch(Exception e) {
         
      }
	      
	}
	
	public boolean checkId(String id) throws SQLException, ServletException, IOException {
	      Connection conn;
	      Statement mySt = null;
	      ResultSet myRs = null;
	      
	      conn = dataSource.getConnection();
	      mySt = conn.createStatement();
	      myRs = mySt.executeQuery("select id from user" );
	      
	      List<String> Id = new ArrayList<>();
	      
	      while(myRs.next()) {
	         String id_ = myRs.getString("id");
	         Id.add(id_);
	      }
	      return Id.contains(id);
	   }
	
	public List<reservation_dto> loadSeat(int sch_num) throws Exception{
         //public reservation_dto(int sch_num, int seat_index) {
         List<reservation_dto> seats = new ArrayList<reservation_dto>();
         Connection conn = null;
         //PreparedStatement mySt= null;
         Statement mySt= null;
         ResultSet myRs = null;
         
         try{
            conn = dataSource.getConnection();
            String sql = "SELECT sch_num, seat.seat_index FROM seat"
            +" LEFT JOIN reservation on reservation.seat_index =seat.seat_index and sch_num = " +  sch_num
            +" WHERE theater_num = (SELECT schedule.theater FROM schedule WHERE sch_num = " +  sch_num + ")";
            
            //mySt= conn.prepareStatement(sql);
            //pst.setInt(1, sch_num);
            //pst.setInt(2, sch_num);   
            //myRs = pst.executeQuery();   
            mySt= conn.createStatement();
            myRs = mySt.executeQuery(sql);
            
            while(myRs.next()) {

               reservation_dto seat = new reservation_dto(myRs.getInt("sch_num"),myRs.getInt("seat_index"));
               seats.add(seat);
            }
            return seats;
      
         }finally {
            close(conn, mySt, myRs);
         }
      }
	
	protected void close(Connection conn, Statement mySt, ResultSet myRs) throws Exception{
		try {		
			if(myRs != null)
				myRs.close();
			if(mySt != null)
				mySt.close();
			if(conn != null)
				conn.close();
			
		}catch(Exception e){
			System.out.println("Couldn't close connection: " + e.getMessage());
			e.printStackTrace();
		}
	}

	

	

}