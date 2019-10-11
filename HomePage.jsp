<!DOCTYPE html>
<html>
	<head>
		<title>Home Page</title>
	</head>
	<style>
		div {
			background-image: url('background.jpg'); width:1250px; height:450px;
		}
	</style>
	
	<body>	
		<img src = "bookworm.png" alt = "bookwarm icon" style = "width:100px; height:75px;">

<!-- JSP checking for existing error message -->
<%
		String errorMessage1 = (String)request.getAttribute("errorMessage1");
		String errorMessage2 = (String)request.getAttribute("errorMessage2");
		if (errorMessage1 == null) {
			errorMessage1 = "";
		}
		if (errorMessage2 == null) {
			errorMessage2 = "";
		}
%>
<!-- JSP end -->
		
		<div>
			<p id = "home">Book Worm: Just a Mini Program... Happy Days!</p>
			<form name="search" method="GET" action="SearchResults.jsp">
				<input type="search" name="Keyword" placeholder = "Search for your favorite book!"/>
				<% errorMessage1 %>
				<table>
				<tr>
					<td>
	            		<input type="checkbox" name="Name" id="nameCheck" onclick="nameFunction()"> Name
	          		</td>
	          		<td>
	            		<input type="checkbox" name="ISBN" id="isbnCheck" onclick="isbnFunction()"/> ISBN
	          		</td>
				</tr>
				<tr>
					<td>
	            		<input type="checkbox" name="Author" id="authorCheck"  onclick="authorFunction()"/> Author
	          		</td>
	          		<td>
	            		<input type="checkbox" name="Publisher" id="publisherCheck"  onclick="publisherFunction()"/> Publisher
	          		</td>
				</tr>
				<% errorMessage2 %>
				</table>
				<input id = "Button" type="submit" name="Search" value="Submit Form" />
			</form>
		</div>
		<script>
			function nameFunction() {
			  var current = document.getElementById("nameCheck");
			  if (checkBox.checked == true){
			  	var other1 = document.getElementById("isbnCheck");
			  	var other2 = document.getElementById("authorCheck");
			  	var other3 = document.getElementById("publisherCheck");
			  	other1.checked = false;
			  	other2.checked = false;
			  	other3.checked = false;
			  } 
			}
			function isbnFunction() {
			  var current = document.getElementById("isbnCheck");
			  if (checkBox.checked == true){
			  	var other1 = document.getElementById("nameCheck");
			  	var other2 = document.getElementById("authorCheck");
			  	var other3 = document.getElementById("publisherCheck");
			  	other1.checked = false;
			  	other2.checked = false;
			  	other3.checked = false;
			  } 
			}
			function authorFunction() {
			  var current = document.getElementById("authorCheck");
			  if (checkBox.checked == true){
			  	var other1 = document.getElementById("isbnCheck");
			  	var other2 = document.getElementById("nameCheck");
			  	var other3 = document.getElementById("publisherCheck");
			  	other1.checked = false;
			  	other2.checked = false;
			  	other3.checked = false;
			  } 
			}
			function nameFunction() {
			  var current = document.getElementById("publisherCheck");
			  if (checkBox.checked == true){
			  	var other1 = document.getElementById("isbnCheck");
			  	var other2 = document.getElementById("authorCheck");
			  	var other3 = document.getElementById("nameCheck");
			  	other1.checked = false;
			  	other2.checked = false;
			  	other3.checked = false;
			  } 
			}
		</script>
	</body>	
</html>