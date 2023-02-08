<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>마켓이름 : 비밀번호 찾기</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #ffffff;
	        }

			input{
				padding: 5px;
			}
			
			span{
				display: inline-block;
				width: 120px;
				text-align: center;
				margin-left: 10;
				margin-top: 20px;
				font-size: 20px;
			}
			button{
				margin-top: 40px;
				font-size: large;
				margin-left: 80px;
				width: 200px;
			}

    	</style>
	</head>
	<body>
		<div>
			<h3>비밀번호 찾기</h3>
			<span>아이디</span>
			<input type="text"><br>
			<span>이메일</span>
			<input type="text"><br>
		</div>
		<button>비밀번호 찾기</button>
	</body>
</html>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    }   
    , methods: {
    	
    }   
    , created: function () {
    
	}
});
</script>
