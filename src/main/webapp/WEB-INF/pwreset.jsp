<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>비밀번호 초기화</title>
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
	        span{
				display: inline-block;
				width: 140px;
				text-align: left;
				margin-left: 10;
				margin-top: 20px;
				font-size: 20px;
			}
	
	        input {
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
	            border: solid 1px;
	            margin-top: 40px;
	            margin-left:15px;
	        }
	
	        button{
	            margin-bottom: 30px;
	            width: 250px;
	            height: 50px;
	            border-radius: 15px;
	            margin-top: 40px;
	        }
    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<span>새 비밀번호</span>
		<input type="password" v-model="uPassword"><br>
		<span>새 비밀번호 확인</span>
		<input type="password" v-model="uPassword2"><br>
		<button @click="fnReset">비밀번호 재설정</button>
	</div>	
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	uId : "${userId}"
    	, uPassword : ""
    	, uPassword2 : ""
    }   
    , methods: {
    	fnReset : function(){
            var self = this;
            if(self.uPassword == self.uPassword2){
            	var nparmap = {password : self.uPassword, id : self.uId}; 
                $.ajax({
                    url:"/pwreset/pwdupdate.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	alert(self.uId + "비밀번호가 변경되었습니다.");	
                    }
                }); 	                		
        	} else {
        		alert("비밀번호가 일치하지 않습니다.");
        	}
            
        }
    }   
    , created: function () {
    
	}
});
</script>
