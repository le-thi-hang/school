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

@WebServlet("/ItemUpdateController")
public class ItemUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//parameter
		String itemId = request.getParameter("itemid");
		//model
		ItemModel im = new ItemModel(getServletContext());
		Item item = im.findById(Integer.parseInt(itemId));

		CategoryModel cm = new CategoryModel(getServletContext());
		List<Category> categories = cm.findAll();
		//view
		request.setAttribute("item", item);
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("/itemUpdateView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//parament
		String itemName = (String) request.getParameter("itemname");
		String price = (String) request.getParameter("price");
		String detail = (String) request.getParameter("detail");
		String image = (String) request.getParameter("image");
		String image1 = (String) request.getParameter("image1");
		String image2 = (String) request.getParameter("image2");
		String image3 = (String) request.getParameter("image3");
		String image4 = (String) request.getParameter("image4");
		String image5 = (String) request.getParameter("image5");
		String categoryId = (String) request.getParameter("categoryid");
		String itemId = (String) request.getParameter("itemid");

		//model
		ItemModel im = new ItemModel(getServletContext());
		Item item = new Item();
		item.setItemName(itemName);
		item.setPrice(Integer.parseInt(price));
		item.setDetail(detail);
		item.setImage(image);
		item.setImage(image1);
		item.setImage(image2);
		item.setImage(image3);
		item.setImage(image4);
		item.setImage(image5);
		Category category = new Category();
		category.setCategoryId(Integer.parseInt(categoryId));
		item.setCategory(category);
		item.setItemId(Integer.parseInt(itemId));

		im.update(item);

		//view
		response.sendRedirect("ItemListController");
	}

}
