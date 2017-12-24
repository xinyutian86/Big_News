package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.scenario.effect.impl.state.LinearConvolveRenderState.PassType;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")  
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String user=request.getParameter("username");
		String pass=request.getParameter("password");
		String id=request.getParameter("send_id");
		RequestDispatcher rd=null;
		if(user!=null&&user.equals("admin")&&pass.equals("guest")){
			request.getSession().setAttribute("login", "yes");
			request.getSession().setAttribute("user", "π‹¿Ì‘±");
			rd=request.getRequestDispatcher("jump.jsp");
			rd.forward(request, response);
		}else if(id!=null){
			request.getSession().setAttribute("login", "no");
			rd=request.getRequestDispatcher("./jsp/jump_login.jsp?id="+id);
			rd.forward(request, response);
		}else {
			request.getSession().setAttribute("login", "no");
			rd=request.getRequestDispatcher("./jsp/login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
