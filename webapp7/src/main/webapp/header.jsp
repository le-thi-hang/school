<%@page import="aiwa.model.CategoryModel"%>
<%@page import="aiwa.util.StringUtil"%>
<%@page import="aiwa.entity.User"%>
<%@page import="aiwa.entity.Category"%>
<%@page import="aiwa.entity.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
CategoryModel cm = new CategoryModel(application);
List<Category> categories = cm.findAll(); 
//List<Category> categories = (List<Category>) request.getAttribute("categories");
//Category category = (Category)request.getAttribute("category");

User user = (User) session.getAttribute("loginuser");

%>
<header>
	<nav id="menubar" class="nav-fix-pos">
		<ul class="inner">
			<li><a href="ItemListController?page=1">ホーム<span>Home</span></a>
				<ul class="ddmenu">
					<li><a href="">ユーザー情報<span><%=user == null ? "ゲスト" : user.getUserName()%>さん</span></a></li>
					<%if (user == null) {%>
					<li><a class="login" href="loginView.jsp">ログイン<span>Login</span></a></li>
					<%} else {%>
					<li><a class="login" href="LogoutController">ログアウト<span>Logout</span></a></li>
					<%}%>
					<li><a href="">お問い合わせ<span>Contact</span></a></li>
				</ul></li>
			<li><a href="ItemListController?page=1">情報一覧<span>Category</span></a>
				<ul class="ddmenu">
					<%for (Category c : categories) {%>
					<li><a href="ItemListController?categoryid=<%=c.getCategoryId()%>"><span><%=c.getCategoryName()%></span></a></li>
					<%}%>
				</ul>
			</li>
			<%if(user == null || user.getManager() == 0) {%>
			<li><a href=""><i class="bi bi-bell"></i></a></li>
			<li><a href=""><i class="bi bi-heart"></i></a></li>
			<li><a href="cartListView.jsp"><i class="bi bi-cart"></i></a></li>
			<li><a href=""><i class="bi bi-wechat"></i></a></li>
			<%} %>
		</ul>
	</nav>
	<nav id="menubar-s">
		<ul>
			<li><a href="">ホーム<span>Home</span></a></li>
			<li><a href="">情報一覧<span>Category</span></a></li>
		</ul>
	</nav>
</header>