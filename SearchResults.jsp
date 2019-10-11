<!DOCTYPE html>
<html>
	<head>
		<title>Search Result</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>

<script>
$(document).ready(function(){
	var keyword = "<%= request.getAttribute("keyword") %>";
	var method = "<%= request.getAttribute("searchMethod") %>";
	var api_url = "https://www.googleapis.com/books/v1/volumes?q=";
	var key = "AIzaSyBoPE7yz0ICzDErX4LZ-iPEAmiLZj1mKW0";
	
	function search(text, type){
  		var result_block = $("#result");
  	
	  	$.ajax({
	    	type:"GET",
	        //not adding key to the url yet
	        url: api_url + text + "+" + type,
	        dataType: "json",
	            
	            success : function(response){
	           		console.log(response);
	            	var items = response["items"];
	             	console.log(items);
	             	
	             	items.forEach(function(item){
		             	var detailLink = item["selfLink"].split("/").slice(-1)[0];
		              	console.log(detailLink);
		              	result_block.append("<li><a href=Details.jsp?key=" + detailLink + ">" + item["id"] +"</a></li>");
		            })
					console.log(response["items"]);
				},
	            
	            error:function(xhr, ajaxOptions, thrownError){
	                alert(xhr.status+"\n"+thrownError);
	            }
		});
 }
 search(keyword, method);
 }); 
</script>

		<form name="search" method="GET" action="searchResults.jsp">
			<table>
			<tr>
				<td rowspan="2">
					<img src = "bookworm.png" alt = "bookwarm icon" style = "width:100px; height:75px;">
				</td>
			</tr>
			<tr>
				<td rowspan="2">
					<input type="search" name="Keyword" placeholder = "What book is on your mind?" />
				</td>
			</tr>
			<tr>
				<td rowspan="2">
					<img src = "magnifying_glass.png" alt = "search icon" style = "width:100px; height:75px;">
				</td>
			</tr>
			<tr>
				<td>
	            	<input type="checkbox" name="Name" value="yes" /> Name
	          	</td>
	          	<td>
	            	<input type="checkbox" name="ISBN" value="yes" /> ISBN
	          	</td>
			</tr>
			<tr>
				<td>
	            	<input type="checkbox" name="Name" value="yes" /> Name
	          	</td>
	          	<td>
	            	<input type="checkbox" name="ISBN" value="yes" /> ISBN
	          	</td>
			</tr>
			</table>
		</form>
	</body>
</html>