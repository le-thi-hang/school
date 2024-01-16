package aiwa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aiwa.entity.User;
import aiwa.model.UserModel;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user = request.getParameter("userid");
		String pass = request.getParameter("password");

		UserModel lm = new UserModel(getServletContext());
		User login = lm.findByIdAndPassword(user, pass);

		if (login == null) {
			request.setAttribute("message", "Eメールまたはパスワードが違います");
			request.getRequestDispatcher("/loginView.jsp").forward(request, response);
		} else {

			HttpSession session = request.getSession();
			session.setAttribute("loginuser", login);
			//success
			response.sendRedirect("ItemListController");
		}

	}
}
