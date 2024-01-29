<!DOCTYPE html>
<%@page import="aiwa.entity.Item"%>
<%@page import="aiwa.entity.User"%>
<%@page import="aiwa.entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品情報修正</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="ここにサイト説明を入れます">
<meta name="keywords" content="キーワード１,キーワード２,キーワード３,キーワード４,キーワード５">
<link rel="stylesheet" href="css/style.css">
<script src="js/openclose.js"></script>
<script src="js/fixmenu.js"></script>
<script src="js/fixmenu_pagetop.js"></script>
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="css/style.css">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<%
	Item item = (Item)request.getAttribute("item");
	List<Category> category = (List<Category>)request.getAttribute("categories");

%>
<style>
th {
	font-family: serif;
	font-size: 20px;
	text-align:left;
}
input{
	box-sizing: border-box;
	position: relative;
	border: 1px solid #999;
	padding: 3px 10px;
	border-radius: 20px;
	height: 2.3em;
	width: 100%;
	overflow: hidden;
	margin-top: 10px;
}
textarea{
	box-sizing: border-box;
	position: relative;
	border: 1px solid #999;
	padding: 3px 10px;
	border-radius: 20px;
	height: 6em;
	width: 100%;
	overflow: hidden;
	margin-top: 10px;
}
select{
	box-sizing: border-box;
	position: relative;
	border: 1px solid #999;
	padding: 3px 10px;
	border-radius: 20px;
	height: 2.3em;
	width: 100%;
	overflow: hidden;
}
table{
	width: 100%;	
}
</style>

<body class="s-n">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="contents" class="inner">
		<div id="contents-in" style="width:100%">
			<aside id="mainimg">
				<a href="#"><img src="images/1.jpg" alt="" id="img1"></a> 
				<a href="#"><img src="images/2.jpg" alt="" id="img2"></a> 
				<a href="#"><img src="images/3.jpg" alt="" id="img3"></a>
				<a href="#"><img src="images/4.jpg" alt="" id="img4"></a> 
				<a href="#"><img src="images/5.jpg" alt="" id="img5"></a>
			</aside>
			<div id="main">
				
				<section>
					<h2>情報修正</h2>
					
					<form action="ItemUpdateController" method="post">
						<input value="<%=item.getItemId()%>" type ="hidden" name="itemid">
						<table>
							<tr>
								<th>カテゴリ</th>
								<td>
									<select name="categoryid">
										<option style="text-align: " value=""></option>
										<%for (Category c : category) {%>				
										<option <%=(c.getCategoryId() == item.getCategory().getCategoryId()) ? "selected" : ""%> value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
										<%}%>
									</select>
								</td>
							</tr>
							<tr>
								<th>商品名</th>
								<td><input type="text" name="itemname" placeholder="商品名" value="<%= item.getItemName() %>"></td>
							</tr>
							<tr>
								<th>価格</th>
								<td><input type="number" name="price" placeholder="価格" value="<%= item.getPrice() %>"></td>
							</tr>
							
							<tr>
								<th>画像</th>
								<td><input type="text" name="image" placeholder="画像" value="<%= item.getImage() %>"></td>
							</tr>
							<tr>
								<th>画像1</th>
								<td><input type="text" name="image1" placeholder="画像1" value="<%= item.getImage1() %>"></td>
							</tr>
							<tr>
								<th>画像2</th>
								<td><input type="text" name="image2" placeholder="画像2" value="<%= item.getImage2() %>"></td>
							</tr>
							<tr>
								<th>画像2</th>
								<td><input type="text" name="image3" placeholder="画像3" value="<%= item.getImage3() %>"></td>
							</tr>
							<tr>
								<th>画像4</th>
								<td><input type="text" name="image4" placeholder="画像4" value="<%= item.getImage4() %>"></td>
							</tr>
							<tr>
								<th>画像5</th>
								<td><input type="text" name="image5" placeholder="画像5" value="<%= item.getImage5() %>"></td>
							</tr>
							<tr>
								<th>説明※</th>
								<td><textarea name="detail" placeholder="説明"><%= item.getDetail() %></textarea ></td>
							</tr>
							
						</table>
						<!-- <input type="number" min="0" max="5" name="rating" placeholder="評価" required-->	
						<p class="c"><input style="width:auto;margin-top: 20px;" type="submit" value="内容を確認する" class="btn">
							
						</p>
					</form>
				</section>
			</div>
			<jsp:include page="side.jsp"></jsp:include>
		</div>
	</div>

<!--/#main-->

<jsp:include page="footer.jsp"></jsp:include>
<script>
if (OCwindowWidth() <= 900) {
	open_close("menubar_hdr", "menubar-s");
}
</script>

</body>
</html>
