package aiwa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiwa.entity.Category;
import aiwa.entity.Item;
import aiwa.model.CategoryModel;
import aiwa.model.ItemModel;

@WebServlet("/ItemListController")
public class ItemListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//session
		//		HttpSession session = request.getSession();
		//		User user = (User) session.getAttribute("loginuser");
		//		if (user == null) {
		//			response.sendRedirect("loginView.jsp");
		//			return;
		//		}

		//parameter
		String word = request.getParameter("keyword");
		if (word == null) {
			word = "";
		}
		String categoryId = request.getParameter("categoryid");
		if (categoryId == null) {
			categoryId = "0";
		}
		//model

		ItemModel im = new ItemModel(getServletContext());
		List<Item> items = im.findByCondition(word, Integer.parseInt(categoryId));
		CategoryModel cm = new CategoryModel(getServletContext());
		List<Category> categories = cm.findAll();
		Category category = cm.findByIdl(Integer.parseInt(categoryId));

		//view
		request.setAttribute("items", items);
		request.setAttribute("word", word);
		request.setAttribute("categoryid", Integer.parseInt(categoryId));
		request.setAttribute("categories", categories);
		request.setAttribute("category", category);
		request.getRequestDispatcher("/itemListView.jsp").forward(request, response);
	}

}
