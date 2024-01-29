package aiwa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

import aiwa.entity.User;

public class UserModel extends BaseModel {
	public UserModel(ServletContext context) {
		super(context);
	}

	public User findById(String userid) {
		try {
			Connection conn = super.connect();
			String sql = "select "
					+ "*"
					+ "from "
					+ "users "
					+ "where "
					+ "userid= ?;";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				User login = new User();
				login.setUserId(rs.getString("userid"));
				login.setUserName(rs.getString("username"));
				login.setPassword(rs.getString("password"));
				login.setBirthday(rs.getString("birthday"));
				login.setManager(rs.getInt("manager"));
				login.setZipcode(rs.getString("zipcode"));
				login.setAddress(rs.getString("address"));
				conn.close();
				return login;
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void insert(User user) {
		try {
			Connection conn = super.connect();
			String sql = "insert into "
					+ "users(userid, "
					+ "username, "
					+ "password) "
					+ "values(?,?,?);";
			PreparedStatement stmt = conn.prepareStatement(sql);
			int index = 1;
			stmt.setString(index++, user.getUserId());
			stmt.setString(index++, user.getUserName());
			stmt.setString(index++, user.getPassword());

			stmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User findByIdAndPassword(String userid, String pass) {
		//try with resource
		try (Connection conn = super.connect()) {

			String sql = "select "
					+ "* "
					+ "from "
					+ "users "
					+ "where "
					+ "userid = ? and password = ?;";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, userid);
			stmt.setString(2, pass);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				User login = new User();
				login.setUserId(rs.getString("userid"));
				login.setUserName(rs.getString("username"));
				login.setPassword(rs.getString("password"));
				login.setBirthday(rs.getString("birthday"));
				login.setManager(rs.getInt("manager"));
				login.setZipcode(rs.getString("zipcode"));
				login.setAddress(rs.getString("address"));
				return login;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
