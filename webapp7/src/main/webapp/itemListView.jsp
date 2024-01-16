<%@page import="aiwa.util.StringUtil"%>
<%@page import="aiwa.entity.User"%>
<%@page import="aiwa.entity.Category"%>
<%@page import="aiwa.entity.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>家具</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="ここにサイト説明を入れます">
<meta name="keywords" content="キーワード１,キーワード２,キーワード３,キーワード４,キーワード５">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/search.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<%
List<Item> items = (List<Item>) request.getAttribute("items");
List<Category> categories = (List<Category>) request.getAttribute("categories");
Category category = (Category)request.getAttribute("category");
String word = (String) request.getAttribute("word");
int categoryid = (int) request.getAttribute("categoryid");

User user = (User) session.getAttribute("loginuser");

%>

<style>
	.itemimg {
		height: 200px;
		object-fit:cover;
	}
</style>

<script src="js/openclose.js"></script>
<script src="js/fixmenu.js"></script>
<script src="js/fixmenu_pagetop.js"></script>
<script src="js/ddmenu_min.js"></script>
</head>

<body class="c2">

	<header>
		<nav id="menubar" class="nav-fix-pos">
			<ul class="inner">
				<li><a href="ItemListController">ホーム<span>Home</span></a>
					<ul class="ddmenu">
						<li><a href="">ユーザー情報<span><%= user == null ? "ゲスト" : user.getUserName() %>さん</span></a></li>				
						<% if(user == null) { %>
							<li><a class="login" href="LoginController">ログイン<span>Login</span></a></li>
						<% } else { %>
							<li><a class="login" href="LogoutController">ログアウト<span>Logout</span></a></li>
						<% } %>
						<li><a href="">お問い合わせ<span>Contact</span></a></li>
					</ul></li>
				<li><a href="ItemListController">情報一覧<span>Category</span></a>
					<ul class="ddmenu">
						<%for (Category c : categories) {%>
						<li><a href="ItemListController?categoryid=<%=c.getCategoryId()%>"><span><%=c.getCategoryName()%></span></a></li>
						<%}%>
					</ul>
				</li>			
			</ul>	
		</nav>
		<nav id="menubar-s">
			<ul>
				<li><a href="">ホーム<span>Home</span></a></li>
				<li><a href="">情報一覧<span>Category</span></a></li>
			</ul>
		</nav>
	</header>
	<div id="contents" class="inner">
		<div id="contents-in">
			<aside id="mainimg">
				<a href="#"><img src="images/1.jpg" alt="" id="img1"></a> 
				<a href="#"><img src="images/2.jpg" alt="" id="img2"></a> 
				<a href="#"><img src="images/3.jpg" alt="" id="img3"></a> 
				<a href="#"><img src="images/4.jpg" alt="" id="img4"></a> 
				<a href="#"><img src="images/5.jpg" alt="" id="img5"></a>
			</aside>
			<div id="main">
				<section>
					<h2 class="col-md-6">
					<form method="get" action="ItemListController" class="search_container">
						<input type="hidden" name="categoryid" value="<%= categoryid%>">
						<input style="background-color: #6fbfd1;" 
						class="form-control" type="text" size="25" name="keyword" value="<%=word%>" 
						placeholder="キーワード検索"> <input type="submit" value="&#xf002">					
					</form>				
					</h2>
					<h3>
						<span><%=(category==null) ? "All" :category.getCategoryName() %></span>
					</h3>
					<%for (Item i : items) {%>
					<div class="list-compact">
						<p class="img">
							<a href="ItemDetailController?itemid=<%= i.getItemId()%>"><img src="<%=i.getImage()%>" alt="" class="itemimg"/></a>
						</p>
						<h4>
							<a href="ItemDetailController?itemid=<%= i.getItemId()%>"><%=i.getItemName()%></a>
						</h4>
						<p>\<%=StringUtil.toMoney(i.getPrice()) %></p>
					</div>
					<%}%>
				</section>
			</div>
		
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
			</div>
		</div>
	</div>
	<footer>
		<div id="footermenu" class="inner">
			<ul>
				<li class="title">メニュータイトル</li>
				<li><a href="">ホーム</a></li>
				<li><a href="">お問い合わせ</a></li>
			</ul>			
			
		</div>
	</footer>

	<!--ページの上部に戻る「↑」ボタン-->
	<p class="nav-fix-pos-pagetop">
		<a href="#">↑</a>
	</p>

	<!--メニュー開閉ボタン-->
	<div id="menubar_hdr" class="close"></div>
	<!--メニューの開閉処理条件設定　900px以下-->
	<script>
		if (OCwindowWidth() <= 900) {
			open_close("menubar_hdr", "menubar-s");
		}
	</script>

</body>
</html>
