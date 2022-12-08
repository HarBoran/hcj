package com.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class hcj_model {
	
private DataSource dataSource;

	public hcj_model(DataSource theDataSource){
		dataSource = theDataSource;
	}
	
	public List<movie_dto> MovieTime (int moviename1) throws Exception {
	      
	      List<movie_dto> MovieTime = new ArrayList<>();
	      Connection conn = null;
	      Statement mySt = null;
	      ResultSet myRs = null;
	      
	      try {
	         conn = dataSource.getConnection();
	         mySt = conn.createStatement();
	         myRs = mySt.executeQuery("select theater,date,time from schedule where movie_num = "+moviename1 );
	         while(myRs.next()) {
	            int theater = myRs.getInt("theater");
	            String date = myRs.getString("date");
	            String time = myRs.getString("time");
	            movie_dto movietime = new movie_dto(theater,date,time);
	            MovieTime.add(movietime);
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return MovieTime;           
	      
	   }

			
	
	public List<seat_dto> loadSeat(int sch_num) throws Exception{
		
		List<seat_dto> seats = new ArrayList<seat_dto>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet myRs = null;
		
		try{
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM seat WHERE sch_num = + ?";
			pst= conn.prepareStatement(sql);
			pst.setInt(1, sch_num);
			myRs = pst.executeQuery();
	
				
			while(myRs.next()) {

				seat_dto seat = new seat_dto(
						myRs.getInt("seat_index"),
						myRs.getString("seat_name"),
						myRs.getString("seat_unique_num"),
						myRs.getString("reservation_check"),
						sch_num);
				seats.add(seat);
			}
			return seats;
	
		}finally {
			close(conn, pst, myRs);
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