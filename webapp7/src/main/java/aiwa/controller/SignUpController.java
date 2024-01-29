package aiwa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiwa.entity.User;
import aiwa.model.UserModel;

@WebServlet("/SignUpController")
public class SignUpController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//paraement
		String userId = (String) request.getParameter("userid");
		String userName = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");

		//model
		UserModel um = new UserModel(getServletContext());
		User user = um.findById(userId);

		if (user != null) {
			request.setAttribute("mess", "そのEメール存在します");
			request.setAttribute("username", userName);
			request.setAttribute("userid", userId);
			request.getRequestDispatcher("/loginView.jsp").forward(request, response);
			return;
		} else {
			User u = new User();
			u.setUserId(userId);
			u.setUserName(userName);
			u.setPassword(password);

			um.insert(u);
			response.sendRedirect("loginView.jsp");
		}

		//view

	}
}
