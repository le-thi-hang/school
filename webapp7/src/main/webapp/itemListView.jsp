<%@page import="aiwa.model.ItemModel"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<%
List<Item> items = (List<Item>) request.getAttribute("items");
List<Category> categories = (List<Category>) request.getAttribute("categories");
Category category = (Category)request.getAttribute("category");
String word = (String) request.getAttribute("word");
int categoryid = (int) request.getAttribute("categoryid");
int p =(int) request.getAttribute("page");
int count = (int)request.getAttribute("count");

User user = (User) session.getAttribute("loginuser");
%>

<style>
.itemimg {
	height: 200px;
	object-fit: cover;
}
button {
	padding: 1.3em 3em;
	font-size: 10px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #fff;
	background-color: #000;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}
button:active {
	transform: translateY(-1px);
}
</style>

<script src="js/openclose.js"></script>
<script src="js/fixmenu.js"></script>
<script src="js/fixmenu_pagetop.js"></script>
<script src="js/ddmenu_min.js"></script>
</head>

<body class="c2">

	<jsp:include page="header.jsp"></jsp:include>
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
							<input type="hidden" name="page" value="<%= p%>">
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
							<a href="ItemDetailController?itemid=<%= i.getItemId()%>">
							<img src="<%=i.getImage()%>" alt="" class="itemimg"/></a>
						</p>
						<h4>
							<a href="ItemDetailController?itemid=<%= i.getItemId()%>"><%=i.getItemName()%></a>
						</h4>
						<p>\<%=StringUtil.toMoney(i.getPrice()) %></p>
					</div>
					<%}%>
				</section>
			</div>
			<jsp:include page="side.jsp"></jsp:include>
		</div>
	</div>

	<div id="contents" class="inner">
		<div id="contents-in">
			<div id="main" style="text-align: right;">
				<%if (p > 1) {%>
				<a style="text-decoration: none;" href="ItemListController?page=<%=p - 1%>&categoryid=<%=categoryid%>&keyword=<%=word%>">
					<button>LAST</button>
				</a>
				<%}%>
				
				<!-- <%int total = count / ItemModel.limit; %>
				<%if(count % ItemModel.limit != 0){ %>
				<% total++; %>
				<%} %>
				<% for(int i = 0; i < total ; i++) { %>
					<a style="text-decoration: none;" href="ItemListController?page=<%= (i + 1) %>&categoryid=<%=categoryid%>&keyword=<%=word%>">
					<button><%= (i+1) %></button>
				</a>
				
				<%} %> -->
				
				<%if (count - p * ItemModel.limit > 0) {%>
				<a style="text-decoration: none;" href="ItemListController?page=<%=p + 1%>&categoryid=<%=categoryid%>&keyword=<%=word%>">
					<button>NEXT</button>
				</a>
				<%}%>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		if (OCwindowWidth() <= 900) {
			open_close("menubar_hdr", "menubar-s");
		}
	</script>

</body>
</html>
