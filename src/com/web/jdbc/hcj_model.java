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
	
	public void reservation(reservation_dto reservation) throws Exception{
		Connection conn = null;
		PreparedStatement pst = null;
				
		try {
			conn = dataSource.getConnection();
						
			String sql = "INSERT INTO reservation"
			+" (sch_num, seat_index, check_user, nonuser_index, user_index)"
			+" values(?, ?, ?, ?, ?)";
			
			pst = conn.prepareStatement(sql);
			
			pst.setInt(1, reservation.getSch_num());
			pst.setInt(2, reservation.getSeat_index());
			pst.setInt(3, reservation.getCheck_user());
			pst.setInt(4, reservation.getNonuser_index());
			pst.setInt(5, reservation.getUser_index());

			pst.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();		

		}finally{
			//conn.close();
			//pst.close();
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
	
	public void checkId(String id) throws SQLException, ServletException, IOException {
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
      if(!Id.contains(id)) {
         checkId(id);
      }
   }
	
   public List<User_dto> User(String id,String phone_num) throws Exception{
	      List<User_dto> User = new ArrayList<>();
	         Connection conn = null;
	         Statement mySt = null;
	         ResultSet myRs = null;
	         
	         try {
	            conn = dataSource.getConnection();
	            mySt = conn.createStatement();
	            myRs = mySt.executeQuery("select * from user where id="+id);
	            while(myRs.next()) {
	               int user_index = myRs.getInt("user_index");
	               String Id = myRs.getString("id");
	               String name = myRs.getString("name");
	               String birth = myRs.getString("birth");
	               String Phone_num = myRs.getString("phone_num");
	               User_dto user = new User_dto(user_index,Id,name,birth,Phone_num);
	               User.add(user);
	            }
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	         return User;
	         
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

				reservation_dto seat = new reservation_dto(
						myRs.getInt("sch_num"),
						myRs.getInt("seat_index"));
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