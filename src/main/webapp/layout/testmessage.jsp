<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/testmessage.css" type="text/css">
	</head>
	<body>
		<div class="nav">
			<h1>
			<a href="#">쪽지</a>
			</h1>
			<ul>
			 <li class="active">
			 <a @click="fnGetList">받은 쪽지함</button></a>
			 </li>
			 <li>
			 <a @click="fnGetGotList">보낸 쪽지함</a>
			 </li>
			</ul>
		</div>
	</body>
</html>
    <script>
        $("h1").click(function(){
           $("h1").toggleClass("active");
        })
    </script>