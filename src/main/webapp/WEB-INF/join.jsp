<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>마켓이름 : 회원가입</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #ffffff;
	        }

	        .div1{
				display: flex;
				padding: 5px;
      			align-items: center;
			}
			.div2{
				width: 650px;
				margin: auto;
				background-color: #eeeff1;
			}
			h3{
				width: 150px;
				margin-left: 20px;
			}

	        input {
	            width: 200px;
				height: 30px;
	            box-sizing: border-box;
				margin-left: 20px;
	            border: solid 1px;
				margin-right: 20px;
	        }

			select{
				width: 100px;
				height: 30px;
	            box-sizing: border-box;
	            border: solid 1px;
			}

			button{
				height: 30px;
				width: 180px;
				margin-left: 10px;
				cursor: pointer;
			}

			.joinBtn{
				margin-top: 20px;
				font-size: 30px;
				height: auto;
				margin-left: 185px;
				cursor: pointer;
			}
    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<div class="div2">
			<div class="div1"><h3>아이디</h3>
				<input type="text">
				<button>아이디 중복 체크</button>
			</div>
			<div class="div1"><h3>닉네임</h3>
				<input type="text">
				<button>닉네임 중복 체크</button>
			</div>
			<div class="div1"><h3>비밀번호</h3>
				<input type="text">
			</div>
			<div class="div1"><h3>비밀번호 확인</h3>
				<input type="text">
			</div>
			<div class="div1"><h3>이름</h3>
				<input type="text">
			</div>
			<div class="div1"><h3>전화번호</h3>
				<input type="text">
			</div>
			<div class="div1"><h3>주소</h3>
				<select name = "region" style="margin-left: 20px;">
					<option value="선택" selected>지역 선택</option>
					<option value="서울특별시" >서울특별시</option>
					<option value="인천광역시" >인천광역시</option>
				</select>
				<select name = "region2">
					<option value="선택" selected>지역 선택</option>
					<option value="서울특별시" >서울특별시</option>
					<option value="인천광역시" >인천광역시</option>
				</select>
			</div>
			<div class="div1"><h3>이메일</h3>
				<input type="text">
				<button>이메일 중복 체크</button>
			</div>
			<button class="joinBtn">회원가입</button>
		</div>
	</div>	
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	
    }   
    , methods: {
		
    	
    }   
    , created: function () {
    
	}
});
</script>
