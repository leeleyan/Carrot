<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>마켓이름 : 로그인</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }
	
	        .div1 {
	            margin: auto; /*상.하.좌.우 가운데 정렬(바깥쪽 여백), width랑 같이 사용*/
	            width: 500px; /*좌.우 길이, 없으면 전체*/
	            height: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px; /*모서리 부분 원의 형태로 바꿔줌*/
	            text-align: center; /*하위 요소 가운데 정렬*/
	            padding: 20px; /*상.하.좌.우로 늘리기(안쪽 여백, 창 크기가 더 커짐)*/
	        }
	         .div2 {
	            margin: auto;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 0px;
	        }
	
	        input {
	            width: 100%;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
	            border: none;
	            margin-top: 20px;
	        }
	
	        .in {
	            margin-bottom: 15px;
	        }
	
	        #btn {
	            background-color: #59cf44;
	            margin-bottom: 30px;
	            color: white; 
	            width: 250px;
	            height: 50px;
	            border-radius: 15px;
	            margin-top: 20px;
	        }
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 15px;
	        }
    	</style>
	</head>
	<body>
		<div id="app" class="div1">
		<div class="div2">
				<input type="text" v-model="uId" class="in" placeholder="아이디"></input>
		</div>
		<div class="div2">
				<input type="password" v-model="uPassword" class="in" placeholder="비밀번호"></input>
		</div>
		<div class="div2">
				<button @click="fnLogin">로그인</button>
		</div>
		<div>
		<a href="idfind.do">아이디 찾기 </a>
		<a href="pwfind.do">| 비밀번호 찾기</a>
		<a href="join2.do">| 회원가입</a>
		</div>
		</div>
		
	</body>
</html>
<script type="text/javascript">

var app = new Vue({ 
    el: '#app',
    data: {
    	uId : ""
    	, uPassword : ""
    	, uName : ""
    }   
    , methods: {
    	fnLogin : function(){
            var self = this;
            var nparmap = {id : self.uId, password : self.uPassword}; 
            $.ajax({
                url:"/login2/get.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {     
                	if(data.result == "success"){
                		alert(data.list[0].uName + "님 로그인 성공!!");
                		self.uName = data.list[0].uName;
                	} else {
                		alert("로그인 실패!!");
                	}
                }
            }); 
        },
	       
    }   
    , created: function () {
    
	}
});
</script>
