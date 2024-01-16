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

<link rel="stylesheet" type="text/css" href="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/reset.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link rel="stylesheet" type="text/css" href="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-2-4/css/6-2-4.css">
<link rel="stylesheet" type="text/css" href="css/image.css">
<%
List<Category> categories = (List<Category>) request.getAttribute("categories");
Item item = (Item) request.getAttribute("item");

User user = (User) session.getAttribute("loginuser");
%>
<style>
th {
	font-family: serif;
	font-size: 25px;
}

@media ( min-width :751px) {
	/*PC版のみ*/
	.yokonarabe {
		display: flex;
		width: 100%;
		margin: 0;
	}
	.yokonarabe>div {
		width: 48%;
	}
}
/*PC・スマホ共通*/
.yokonarabe>div {
	margin: 0 1%;
	background: #FFF;
}

.text-center {
	text-align: center;
}

.col-md-4 {
	width: 33.33%; /* Adjust width as needed */
	/* Other styling properties for a col-md-4 class */
}

/* Additional styling for the input */
input[type="number"] {
	/* Add your styling properties here */
	/* For example: */
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 8px;
	margin: 5px;
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
						<li><a href="">ユーザー情報<span><%=user == null ? "ゲスト" : user.getUserName()%>さん</span></a></li>
						<%if (user == null) {%>
						<li><a class="login" href="LoginController">ログイン<span>Login</span></a></li>
						<%} else {%>
						<li><a class="login" href="LogoutController">ログアウト<span>Logout</span></a></li>
						<%}%>
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
				<a href="#"><img src="images/1.jpg" alt="飲食店を探す" id="img1"></a> <a href="#"><img src="images/2.jpg" alt="病院を探す" id="img2"></a> <a href="#"><img src="images/3.jpg" alt="美容院を探す" id="img3"></a> <a href="#"><img src="images/4.jpg" alt="習い事を探す" id="img4"></a> <a href="#"><img src="images/5.jpg" alt="介護施設を探す" id="img5"></a>
			</aside>
			<div id="main">
				<section>
					<h3>
						<span><%=item.getItemName()%></span>
					</h3>				
					<div class="container col-md-12 col-sm-10">
						<a href="#" onclick="history.back()"><i class="bi bi-x-lg"></i></a>
						<div class="yokonarabe">
							<div class="col-md-6">
								<ul class="gallery">
									<%= StringUtil.toImage(item.getImage()) %>
									<%= StringUtil.toImage(item.getImage1()) %>
									<%= StringUtil.toImage(item.getImage2()) %>
									<%= StringUtil.toImage(item.getImage3()) %>
									<%= StringUtil.toImage(item.getImage4()) %>
									<%= StringUtil.toImage(item.getImage5()) %>
								</ul>
								<ul class="slider">
									<%= StringUtil.toImage(item.getImage()) %>
									<%= StringUtil.toImage(item.getImage1()) %>
									<%= StringUtil.toImage(item.getImage2()) %>
									<%= StringUtil.toImage(item.getImage3()) %>
									<%= StringUtil.toImage(item.getImage4()) %>
									<%= StringUtil.toImage(item.getImage5()) %>
								</ul>
							</div>
							<div class="col-md-6">				
								<table>
									<tr>
										<th colspan="2" style="text-align: left;"><%=item.getItemName()%></th>
									</tr>
									<tr>
										<th colspan="2" style="text-align:left ;">\<%=StringUtil.toMoney(item.getPrice())%>(税込)</th>
									</tr>
									<tr>
										<td style="width: 30%;vertical-align: top">商品詳細について</td>
										<td><%=StringUtil.toBreak(item.getDetail())%></td>				
									</tr>
									<tr>
										<th colspan="2" style="text-align:left ;">数量</th>
									</tr>
									<tr>
										<td colspan="2">
											<input type="number" min="1" class="text-center col-md-4" value="1" name="quantity"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;color:#fff;">		
											<div class="button001">		
												<a class="search_container" style="display:block;background: #6fbfd1;text-decoration: none;color:#fff;" href="#">カートに追加する</a>
											</div>							
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;color:#fff;">
											<div class="button001">					
												<a class="search_container" style="display:block; background: #6fbfd1;text-decoration: none;color:#fff;" href="#">お気に入りに追加</a>	
											</div>									
										</td>
									</tr>						
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
			<div id="sub">
				<nav>
					<h2>情報一覧</h2>
					<ul class="submenu" style="padding-left:0">
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
				<li><a href="index.html">ホーム</a></li>
				<li><a href="contact.html">お問い合わせ</a></li>
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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="js/image.js"></script>
</body>
</html>
