package aiwa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import aiwa.entity.Category;
import aiwa.entity.Item;
import aiwa.entity.Order;
import aiwa.entity.User;

public class OrderModel extends BaseModel {
	public OrderModel(ServletContext context) {
		super(context);
	}

	public List<Order> findByUserId(User u) {
		List<Order> result = new ArrayList<>();
		try (Connection conn = super.connect()) {

			String sql = "select "
					+ "* "
					+ "from "
					+ "orders o "
					+ "inner join "
					+ "items i "
					+ "on "
					+ "o.itemid = i.itemid "
					+ "inner join "
					+ "categories c "
					+ "on "
					+ "i.categoryid = c.categoryid "
					+ "inner join "
					+ "users u "
					+ "on "
					+ "o.userid = u.userid ";
			if (u.getManager() == 0) {
				sql += "where "
						+ "userid = ? ";
			}
			sql += "order by "
					+ "orderdate desc, userid, orderid;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			if (u.getManager() == 0) {
				stmt.setString(1, u.getUserId());
			}
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Order od = new Order();
				od.setOrderId(rs.getInt("oderid"));
				od.setOrderDate(rs.getString("orderdate"));
				od.setAmount(rs.getInt("amount"));

				Item i = new Item();
				i.setItemId(rs.getInt("itemid"));
				i.setItemName(rs.getString("itemname"));
				i.setPrice(rs.getInt("price"));
				i.setDetail(rs.getString("detail"));
				i.setImage(rs.getString("image"));
				i.setImage1(rs.getString("image1"));
				i.setImage2(rs.getString("image2"));
				i.setImage3(rs.getString("image3"));
				i.setImage4(rs.getString("image4"));
				i.setImage5(rs.getString("image5"));

				Category c = new Category();
				c.setCategoryId(rs.getInt("categoryid"));
				c.setCategoryName(rs.getString("categoryname"));
				i.setCategory(c);
				od.setItem(i);

				User user = new User();
				user.setUserId(rs.getString("userid"));
				user.setUserName(rs.getString("username"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setManager(rs.getInt("manager"));
				user.setPassword(rs.getString("password"));
				user.setZipcode(rs.getString("zipcode"));
				od.setUser(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void insert(Order order) {
		try (Connection conn = super.connect()) {
			String sql = "insert into "
					+ "orders(orderdate, amount, itemid, userid) "
					+ "value (datetime('now','localtime'), ?, ?, ?);";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, order.getAmount());
			stmt.setInt(2, order.getItem().getItemId());
			stmt.setString(3, order.getUser().getUserId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
