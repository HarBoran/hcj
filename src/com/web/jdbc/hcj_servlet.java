package com.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;

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
	
//	private movie_model movie_model;
//	
//	//어떤 데이터 베이스와 연결할 것인가?
//	@Resource(name="jdbc/hcj")
//	private DataSource dataSource;
//
//	@Override
	public void init(ServletConfig config) throws ServletException {
//		// TODO Auto-generated method stub
//		movie_model = new movie_model(dataSource);
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

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html><body>");		
		out.println("<h2>here is the servlet</h2>");
		out.println("<a href ='MovieTime.jsp'>go to moive Time.jsp</a>");
		out.println("</html></body>");
		//response.sendRedirect(request.getContextPath()+"/hcj_servlet?command=list");
		
	}
	
	
	
	
	
	private void seatSelection(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html><body>");		
		out.println("<h2>here is the servlet</h2>");
		out.println("<a href ='SeatSelection.jsp'>go to SeatSelection</a>");
		out.println("</html></body>");
		
		
		int i = Integer.parseInt(request.getParameter("seatnumber"));
		out.print("좌석번호" + i +"를 선택하였습니다.");
		
	}
	
	

	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
