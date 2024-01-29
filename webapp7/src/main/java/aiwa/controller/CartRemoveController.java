package aiwa.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aiwa.entity.Item;

@WebServlet("/CartRemoveController")
public class CartRemoveController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//session
		HttpSession session = request.getSession();

		//parameter
		String itemId = request.getParameter("itemid");
		String all = request.getParameter("all");

		//model
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
		}
		for (Item i : cart) {
			if (i.getItemId() == Integer.parseInt(itemId)) {

				if (all != null) {
					cart.remove(i);
					break;
				} else {
					i.setCartNum(i.getCartNum() - 1);
					if (i.getCartNum() == 0) {
						cart.remove(i);
						break;
					}
				}
			}
		}

		session.setAttribute("cart", cart);
		//view
		response.sendRedirect("CartListController");
	}

}
