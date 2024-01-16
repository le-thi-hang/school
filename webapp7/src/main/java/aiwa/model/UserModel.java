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

	public User findByIdAndPassword(String userid, String pass) {
		try {
			Connection conn = super.connect();
			String sql = "select "
					+ "*"
					+ "from "
					+ "users "
					+ "where "
					+ "userid= ? and password= ?;";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, userid);
			stmt.setString(2, pass);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				User login = new User();
				login.setUserId(rs.getString("userid"));
				login.setUserName(rs.getString("username"));
				login.setPassword(rs.getString("password"));

				return login;
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
}
