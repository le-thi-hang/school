package aiwa.util;

public class StringUtil {

	public static String toMoney(int num) {
		return String.format("%,d", num);
	}

	public static String toBreak(String str) {
		return str.replace("\r\n", "<br>");
	}

	public static String toRating(int num) {
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < num; i++) {
			sb.append("");
		}
		return sb.toString();
	}

	public static String toImage(String img) {
		if (img != null && !img.equals("")) {
			return "<li><img src='" + img + "'></li>";
		}
		return "";
	}
}
