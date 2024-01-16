package aiwa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import aiwa.entity.Category;
import aiwa.entity.Item;

public class ItemModel extends BaseModel {

	public ItemModel(ServletContext context) {
		super(context);
	}

	public Item findById(int id) {

		try {
			Connection conn = super.connect();
			String sql = "select  "
					+ "	*  "
					+ "from "
					+ "	items i "
					+ "inner join  "
					+ "	categories c "
					+ "on "
					+ "	i.categoryid=c.categoryid "
					+ "where "
					+ "	itemid = ? ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
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
				conn.close();
				return i;
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public List<Item> findByCondition(String word, int categoryId) {
		List<Item> result = new ArrayList<>();
		try {
			Connection conn = super.connect();
			String sql = "select  "
					+ "	*  "
					+ "from "
					+ "	items i "
					+ "inner join  "
					+ "	categories c "
					+ "on "
					+ "	i.categoryid = c.categoryid "
					+ "where"
					+ "(itemname like ? or detail like ?)";
			if (categoryId > 0) {
				sql += "and i.categoryid = ? ";
			}
			sql += "order by itemid";
			PreparedStatement stmt = conn.prepareStatement(sql);
			int index = 1;
			stmt.setString(index++, "%" + word + "%");
			stmt.setString(index++, "%" + word + "%");

			if (categoryId > 0) {
				stmt.setInt(index++, categoryId);
			}
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
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

				result.add(i);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> findAll() {
		List<Item> result = new ArrayList<>();

		try {
			Connection conn = super.connect();
			String sql = "select  "
					+ "	*  "
					+ "from "
					+ "	items i "
					+ "inner join  "
					+ "	categories c "
					+ "on "
					+ "	i.categoryid=c.categoryid "
					+ "order by "
					+ "	itemid";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
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

				result.add(i);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

}
