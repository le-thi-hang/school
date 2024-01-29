<%@page import="aiwa.model.CategoryModel"%>
<%@page import="aiwa.entity.User"%>
<%@page import="aiwa.entity.Item"%>
<%@page import="aiwa.entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
CategoryModel cm = new CategoryModel(application);
List<Category> categories = cm.findAll();
Item item = (Item)request.getAttribute("Item");
//List<Category> categories = (List<Category>) request.getAttribute("categories");
User user = (User) session.getAttribute("loginuser");
%>
<div id="sub">
	<nav>
		<h2>
			<a href="ItemListController" style="text-decoration: none;">情報一覧</a>
		</h2>
		<ul class="submenu">
			<%for (Category c : categories) {%>
			<li><a href="ItemListController?categoryid=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></li>
			<%}%>
		</ul>
	</nav>
	<nav>
	<%if(user != null && user.getManager() == 1) {%>
		<h2><a href="ItemInsertController" style="text-decoration: none;">新規登録</a></h2>
	<%} %>	
	</nav>
	
</div>