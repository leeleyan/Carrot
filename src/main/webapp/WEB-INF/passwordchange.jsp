<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>비밀번호 변경</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #ffffff;
	        }
	
	        .div1 {
	            margin: auto; /*상.하.좌.우 가운데 정렬(바깥쪽 여백), width랑 같이 사용*/
	            width: 500px; /*좌.우 길이, 없으면 전체*/
	            height: 350px;
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
	            width: 200px;
	            height: 50px;
	            border-radius: 15px;
	            margin-top: 40px;
	        }
    	</style>
	</head>

	<body>
		<div class="div1" id="app">
					<span>현재 비밀번호</span>
					<input type="password" v-model="uPassword"><br>
					<span>새 비밀번호</span>
					<input type="password" v-model="newPassword" maxlength="16" placeholder = "영어, 숫자, 특수문자" @input="validatePw"><br>
					<span>새 비밀번호 확인</span>
					<input type="password" v-model="newPassword2" maxlength="16" placeholder = "영어, 숫자, 특수문자" @input="validatePw"><br>
					<div style = "display : flex;">
						<button @click="fnUpdatePassword" style ="margin-left: 40px;">비밀번호 변경</button>
						<button @click="fnClose" style ="margin-left: 20px;">닫기</button>
					</div>
		</div>
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
         uPassword : ""
	    , newPassword : ""
	    , newPassword2 : ""
	 	, userId : "${userId}"
	 	, password : ""
        
    }   
    , methods: {
    	fnUpdatePassword : function() {
			var self = this;
			var nparmap = {password : self.newPassword, id : self.userId};
			if(self.password == self.uPassword){
				if(self.newPassword == self.newPassword2){
				$.ajax({
					url : "/passwordchange/updatepassword.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("비밀번호가 변경되었습니다.");
						window.close();
					}
				});
			} else {
				alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.")
				return;
			} 
			} else{
				alert("현재 비밀번호가 올바르지 않습니다.");
				return;
			}
		},
        fnGetInfo : function(){
   			var self = this;
            var nparmap = {id : self.userId};
	           $.ajax({
	               url:"/passwordchange/get.dox",
	               dataType:"json",	
	               type : "POST", 
	               data : nparmap,
	               success : function(data) {  
	            	   self.password = data.password;
	               }
	           }); 
	     },
		 fnClose : function(){
				window.close();
	      	},
	
		validatePw() {
   		 const regex = new RegExp(/^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]*$/);
   		  if (!regex.test(this.newPassword)) {
   		    this.newPassword = this.newPassword.replace(/[^a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]/g, '');
   		  }
   	 	}
	}
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});

</script>


