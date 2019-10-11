package Assignment2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public SearchServlet() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String nextPage = "/SearchResults.jsp";
		String keyword = request.getParameter("Keyword");
		if(keyword == null || keyword.isEmpty()) {
			nextPage = "/HomePage.jsp";
			request.setAttribute("errorMessage1", "Please enter some searching keyword");
		}
		String Check = "";
		if(request.getParameter("Name") == "yes"){
			Check = "intitle";
		}else if(request.getParameter("ISBN") == "yes"){
			Check = "isbn";
		}else if(request.getParameter("Author") == "yes"){
			Check = "inauthor";
		}else if(request.getParameter("Publisher") == "yes"){
			Check = "inpublisher";
		}else {
			nextPage = "/HomePage.jsp";
			request.setAttribute("errorMessage2", "Please check some searching method");			
		}
		if(keyword != null && !keyword.isEmpty() && !Check.isEmpty()) {
			request.setAttribute("keyword", keyword);
			request.setAttribute("searchMethod", Check);
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
