package com.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			
			System.out.println("checkPage = " + checkPage);
			switch(checkPage) {
				case "movieTime":
					movieTime(request, response);
					break;
				case "seatSelection":
					seatSelection(request, response);
					break;
				default:
					listMovies(request, response);
			}
		}catch(Exception e) {
			log("error catch", e);
			throw new ServletException(e);
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
	            case "Captin_America" :
	               moviename1 = 4;
	               break;   
	      }
	      List<movie_dto> movieschedule = hcj_model.MovieTime(moviename1);
	      request.setAttribute("scheduleList", movieschedule);
	      
	       RequestDispatcher dispatcher = request.getRequestDispatcher("/MovieTime.jsp");
	         dispatcher.forward(request, response);
	      
//	      PrintWriter out = response.getWriter();
//	      response.setContentType("text/html");
//	      out.println("<html><body>");      
//	      out.println("<h2>here is the servlet</h2>");
//	      out.println("<a href ='MovieTime.jsp'>go to moive Time.jsp</a>");
//	      out.println("</html></body>");
	      //response.sendRedirect(request.getContextPath()+"/hcj_servlet?command=list");
	      
	   }

	
	
	
	
	
	private void seatSelection(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//request.setAttribute("",);
		//request.setAttribute("",);
		//request.setAttribute("",);
		//sch_num을 변수로 받아 좌석을 조회함
		List<seat_dto> seats = hcj_model.loadSeat(1);
		request.setAttribute("select_seat", seats);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/SeatSelection.jsp");	  
		dispatcher.forward(request, response);			
	}
	
	

	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
