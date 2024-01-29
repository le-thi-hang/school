<%@page import="aiwa.entity.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<%
	List<Item> cart = (List<Item>) session.getAttribute("cart");
	int total = 0;
%>
<script>
	function changeAmount(itemid){
		window.location.href = "CartChangeController?itemid=" + itemid + "&amount=" + $("#amount" + itemid).val();		
	}
</script>
</head>
<body>
	<div class="card">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>Shopping Cart</b>
							</h4>
						</div>
						<div class="col align-self-center text-right text-muted">3 items</div>
					</div>
				</div>
				<div class="row border-top border-bottom">
					<div class="row main align-items-center">
					<%for (Item item : cart) {%>
						<div class="col-2">
							<img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg">
						</div>
						<div class="col">
							<div class="row text-muted">Shirt</div>
							<div class="row">Cotton T-shirt</div>
						</div>
						<div class="col">
							<a href="#">-</a>
							<select id="amount<%= item.getItemId()%> onchange="changeAmaount(<%= item.getItemId() %>)">
								<option value="">数量</option>
								<%for(int i = 1; i < 10; i++){ %>
									<option value="<%= i %>"><%= i %></option>
								<%} %>
							</select>
							<a href="#">+</a>
						</div>
						<div class="col">
							&euro; 44.00 <span class="close">&#10005;</span>
						</div>
					<%} %>
					</div>
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
					<div class="col">ITEMS 3</div>
					<div class="col text-right">&euro; 132.00</div>
				</div>
				<form>
					<p>SHIPPING</p>
					<select><option class="text-muted">Standard-Delivery- &euro;5.00</option></select>
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
</body>
</html>