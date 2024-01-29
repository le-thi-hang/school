<%@page import="aiwa.util.StringUtil"%>
<%@page import="aiwa.entity.User"%>
<%@page import="aiwa.entity.Category"%>
<%@page import="aiwa.entity.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ショッピングカート</title>
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	List<Item> cart = (List<Item>) session.getAttribute("cart");
	int total = 0;
%>

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
					<h2 class="col-md-12">Shopping Cart</h2>
				</section>
				<%if (cart == null || cart.size() == 0) {%>
				<div><h3>カートは空っぽです</h3></div>
				<%} else {%>
				<div class="card">
					<div class="row">
						<div class="col-md-8 cart">
							<div class="title">
								<div class="row">
									<div class="col align-self-center text-right text-muted"></div>
								</div>
							</div>
							<%for (Item item : cart) {%>
							<div class="row border-top border-bottom">
								<div class="row main align-items-center">
									<div class="col-2">
										<img class="img-fluid" src="<%= item.getImage()%>">
									</div>
									<div class="col">
										<div class="row text-muted"><%=item.getItemName()%></div>
									</div>
									<div class="col">
										<a href="CartRemoveController?itemid=<%= item.getItemId()%>">-</a><a href="#" class="border"><%=item.getCartNum() %></a><a href="CartAddController?itemid=<%= item.getItemId()%>">+</a>
									</div>
									<div class="col">
										<%= StringUtil.toMoney(item.getPrice())%> 
									</div>
									<div class="col">
										<%= StringUtil.toMoney(item.getSubTotal())%> 
										<a href="CartRemoveController?all=all&itemid=<%= item.getItemId()%>" onclick="history.back()"><i class="bi bi-trash3"></i></a>
									</div>
								</div>
								<% total += item.getSubTotal(); %>
							</div>
							<%} %>
							<div class="col text-right">合計 : 					
									<%= StringUtil.toMoney(total) %>					
							</div>					
							<div class="back-to-shop">
								<a href="#">&leftarrow;</a><span class="text-muted">Back to shop</span>
							</div>			
						</div>	
						<div class="col-md-4 summary">
							<div>
								<h5>
									<b>Summary</b>
								</h5>
							</div>
							<hr>
							<div class="row">
								<div class="col"> ITEMS 3</div>
								<div class="col text-right">&euro; 132.00</div>
							</div>
							<form>
								<p>SHIPPING</p>
								<select>
									<option class="text-muted">Standard-Delivery- &euro;5.00</option>
								</select>
								<p>GIVE CODE</p>
								<input id="code" placeholder="Enter your code">
							</form>
							<div class="row" style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
								<div class="col">合計</div>
								<div class="col text-right">&euro; 137.00</div>
							</div>
							<button class="btn">CHECKOUT</button>
						</div>
					</div>
				</div>
				<%}%>
			</div>
			<jsp:include page="side.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>