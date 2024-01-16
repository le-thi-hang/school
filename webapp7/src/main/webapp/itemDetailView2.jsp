<%@page import="aiwa.util.StringUtil"%>
<%@page import="aiwa.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link rel="stylesheet" type="text/css" href="css/image.css">
<title>Insert title here</title>
<%
Item item = (Item) request.getAttribute("item");
%>
<style>
th{
	font-family: serif;
	font-size: 25px;

}

</style>

</head>
<body>
	<div class="container mt-5 mb-5 col-md-8 col-sm-10">
		<a href="#" onclick="history.back()">戻る</a>
		<div class="row">
			<div class="col-md-6">
				<ul class="gallery">
					<li><img src="<%=item.getImage()%>" alt=""></li>
					<li><img src="<%=item.getImage1()%>" alt=""></li>
					<li><img src="<%=item.getImage2()%>" alt=""></li>
					<li><img src="<%=item.getImage3()%>" alt=""></li>
					<li><img src="<%=item.getImage4()%>" alt=""></li>
					<li><img src="<%=item.getImage5()%>" alt=""></li>
				</ul>
				<ul class="choice-btn">
					<li><img src="<%=item.getImage()%>" alt=""></li>
					<li><img src="<%=item.getImage1()%>" alt=""></li>
					<li><img src="<%=item.getImage2()%>" alt=""></li>
					<li><img src="<%=item.getImage3()%>" alt=""></li>
					<li><img src="<%=item.getImage4()%>" alt=""></li>
					<li><img src="<%=item.getImage5()%>" alt=""></li>
				</ul>
			</div>
			<div class="col-md-6">
				<table class="table table-sm">
					<tr>
						<th><%=item.getItemName()%></th>
					</tr>
					<tr>
						<th>\<%=StringUtil.toMoney(item.getPrice())%>(税込)</th>
					</tr>
				</table>
				<table class="table table-sm">
					<tr>
						<td style="width: 30%">商品詳細について</td>
						<td><%=item.getDetail().replace("\r\n", "<br>")%></td>
					</tr>			
				</table>
				<h6>数量</h6>			
				<div class="text-center d-grid gap-2 mb-3">	
				<input type = "number" min="1" class= "text-center col-md-4" value="1"  name="">					
				<button type="button" class="btn btn-dark"><i class="bi bi-cart3"></i>　カートに追加する</button>
				<button type="button" class="btn btn-dark"><i class="bi bi-heart"></i>　お気に入りに追加</button>
				<button type="button" class="btn btn-dark">すぐ買う</button>
				</div>	
				
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!--自作のJS-->
	<script src="js/image.js"></script>
</body>
</html>