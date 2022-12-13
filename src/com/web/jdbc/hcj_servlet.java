package com.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class hcj_servlet
 */
@WebServlet("/hcj_servlet")
public class hcj_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private hcj_model hcj_model;
	
	//어떤 데이터 베이스와 연결할 것인가?
	@Resource(name="jdbc/project")
	private DataSource dataSource;

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		hcj_model = new hcj_model(dataSource);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		try {	
			String checkPage = request.getParameter("command");
		
			if (checkPage == null) {
				checkPage = "list";
			}
			
			switch(checkPage) {
				case "movieTime":
					movieTime(request, response);
					break;
				case "seatSelection":
					seatSelection(request, response);
					break;
				case "reservation":
					reservation(request, response);
					break;
				case "reservationticket":
					reservationTicket(request, response);
					break;
				case "cancel" :
					cancel(request, response);
					break;
				default:
					listMovies(request, response);
			}
		}catch(Exception e) {
			log("error catch", e);
			throw new ServletException(e);
		}
	}
	
  





      
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	         String CheckPage = request.getParameter("command");
	         
	         switch(CheckPage){
	            case "checkId":
	         try {
	            checkId(request,response);
	         } catch (ServletException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
	         } catch (IOException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
	         } catch (SQLException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
	         }
	               break;
	            case "JOIN" :
	           
	         try {
	            joinMember(request,response);
	         } catch (ServletException | IOException | SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	            break;
	            case "nonUser" :
	         try {
	            nonUser(request,response);
	         } catch (ServletException | IOException | SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         break;
	            case "Login":
	         try {
	            Login(request,response);
	         } catch (ServletException | IOException | SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	               break;
	               
	         }
	      }

	   private void nonUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		   
		      String name = request.getParameter("name");
		      String birth = request.getParameter("birth");
		      String phone_num = request.getParameter("phone_num");
		      
		      
		   
		}
   
	   @SuppressWarnings("unused")
	   private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	         
	         String id = request.getParameter("id");
	         String pw = request.getParameter("password");
	
	        
	         if(hcj_model.Login(id, pw)==true) {
	            request.setAttribute("id",id);
	            request.setAttribute("password",pw);
	            HttpSession session = request.getSession();
	            session.setAttribute("id", id);
	              RequestDispatcher dispatcher = request.getRequestDispatcher("/main2.jsp");     
	              dispatcher.forward(request, response);
	              //만약 로그인 메서드가 트루 이면 Logingo.jsp에서 나머지 작업을 수행 (세션을 /Logingo.jsp에서 저장)
	         }else if (hcj_model.Login(id, pw)==false) {
	             RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");     
	                 dispatcher.forward(request, response);
	         }
	         
	      }

   
   public void checkId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	      String id = request.getParameter("id");
	      if (hcj_model.checkId(id)==true) {
	         RequestDispatcher dispatcher = request.getRequestDispatcher("/CheckId_2.jsp");     
	         dispatcher.forward(request, response);
	      }else if(hcj_model.checkId(id)==false){
	            request.setAttribute("id_", id);   
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/Join_Member.jsp");     
	            dispatcher.forward(request, response);
	      }
	      
	  
	}


   public void joinMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{

       
       String reg = "^[a-zA-Z]*$";
       String regBirthdate = "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$";
       String regPhoneNumber ="^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$";
       String id = request.getParameter("id_check");
       String password = request.getParameter("password");
       String name = request.getParameter("name");
       String birth = request.getParameter("birth");
       String phone_num = request.getParameter("phone_num");
       
       boolean a;
       boolean b;
       boolean c;
       boolean d;
         
       do{
          d = Pattern.matches(reg, name);
        
          b = Pattern.matches(regPhoneNumber, phone_num);
          c = Pattern.matches(regBirthdate, birth);
          if ( b==false || c ==false ||d == false) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/validity_check.jsp");     
                dispatcher.forward(request, response);
          }
         }while(!b && !c && !d);
                
         hcj_model.joinMember(id,name,birth,phone_num,password);
        
       
         RequestDispatcher dispatcher = request.getRequestDispatcher("/MovieList.jsp");     
         dispatcher.forward(request, response);
    }

   
   private void cancel(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int index = Integer.parseInt(request.getParameter("tempindex"));
		hcj_model.cancel(index);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/reservationCheck.jsp");	  
		dispatcher.forward(request, response);
		}
   
   
   private void reservationTicket(HttpServletRequest request, HttpServletResponse response) throws Exception{
	   //새션에서 (Stirng)id 값 받기
	   HttpSession session = request.getSession();
	   String id = (String)session.getAttribute("id"); 
	   //id 값  (int)index로 변경 
	   int user_id = hcj_model.sessionidChangeUserTable(id);


	  List<reservationTicket_dto> reservationTicket = hcj_model.reservationTicket(user_id);
	  request.setAttribute("reservationTicketTemp", reservationTicket);

	  RequestDispatcher dispatcher = request.getRequestDispatcher("/reservationCheck.jsp");
	  dispatcher.forward(request, response);
	  

   }	
	 

	
   private void reservation(HttpServletRequest request, HttpServletResponse response) throws Exception{
		 //새션에서 (Stirng)id 값 받기

	   	HttpSession session = request.getSession();

	String id = (String)session.getAttribute("id"); 

		   //id 값  (int)index로 변경 
	

	      //if (id.equals("null")) {
		//if(id== null || id.length() == 0) {
		if(id == null) {
	    	//response.sendRedirect(request.getContextPath()+"/User_nonUser.jsp");
	         RequestDispatcher dispatcher = request.getRequestDispatcher("/User_nonUser.jsp");
	         dispatcher.forward(request, response);//만약 받아온 세션아이디가 null이면 User_nonUser page로가서 로그인이나 비회원 로그인을 하도록 유도
	    
	      }else if(!id.equals("null")) {
	    	  int user_id = hcj_model.sessionidChangeUserTable(id);
	         // 세션 아이디가 null이 아닐 경우에 reservation 메서드 내용이 실행됨
	         int sch_num = Integer.parseInt(request.getParameter("sch_num"));
	         int seat_index = Integer.parseInt(request.getParameter("seat_to_reserve"));
	   
	         int check_user = 1;
	         int nonuser_index = 0;
	         int user_index = user_id;
		      
	         reservation_dto reservation = new reservation_dto(sch_num, seat_index, check_user, nonuser_index, user_index);
	         request.setAttribute("reservationConfirm", reservation);

	      
	         if(check_user == 0) {
	            hcj_model.nonuser_reservation(reservation);
	         }else if(check_user == 1) {         
	            hcj_model.user_reservation(reservation);
	         }      
	      
	   
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/reservationConfirm.jsp");
	            dispatcher.forward(request, response);
	      } 
	   }


	public void listMovies(HttpServletRequest request, HttpServletResponse response) throws Exception{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/MovieList.jsp");	  
		dispatcher.forward(request, response);
	}
	
	

	
   public void movieTime(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      
	      String moviename = request.getParameter("moviename");
	      int moviename1 = 0;
	      switch(moviename) {
	            case "Iron_Man" :
	               moviename1 = 1;
	               break;
	            case "Spider_Man":
	               moviename1 = 2;
	               break;
	            case "Thor" :
	               moviename1 = 3;
	               break;
	            case "Captain_America" :
	               moviename1 = 4;
	               break;   
	      }
	      
	      List<movie_dto> movieschedule = hcj_model.MovieTime(moviename1);
	      request.setAttribute("scheduleList", movieschedule);
	      
	       RequestDispatcher dispatcher = request.getRequestDispatcher("/MovieTime.jsp");
	         dispatcher.forward(request, response);
	     
	      
	   }
		   
	
	
	private void seatSelection(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//schedule테이블의 sch_num을 변수로 받아 좌석을 조회함
		int sch_num = Integer.parseInt(request.getParameter("sch_num"));
		request.setAttribute("sch_num", sch_num);
		
		List<reservation_dto> seats = hcj_model.loadSeat(sch_num);
		request.setAttribute("select_seat", seats);	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/SeatSelection.jsp");	  
		dispatcher.forward(request, response);
	}
}