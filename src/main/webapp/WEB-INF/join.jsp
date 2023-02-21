<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/logoheader.jsp"></jsp:include>
		<title>마켓이름 : 회원가입</title>
		<style>
			@import
				url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
				;
			
			* {
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			body {
				background-color: #ffffff;
			}
			
			.div1 {
				display: flex;
				padding: 5px;
				align-items: center;
				
			}
			
			.div2 {
				width: 650px;
				margin: auto;
				background-color: #eeeff1;
			}
			
			h3 {
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
			
			select {
				width: 100px;
				height: 30px;
				box-sizing: border-box;
				border: solid 1px;
				margin-right : 5px;
			}
			
			.mButton {
				height: 30px;
				width: 180px;
				margin-left: 10px;
				cursor: pointer;
			}
			
			.joinBtn {
				margin-top: 20px;
				font-size: 30px;
				height: auto;
				margin-left: 185px;
				cursor: pointer;
				width: 220px;
				cursor: pointer;
				margin-bottom: 30px;
			}
		</style>
	</head>
<body>
	<div id="app" class="div1">
		<div class="div2">
			<div class="div2" id="app">
				<div class="div1">
					<h3>아이디</h3>
					<input type="text" v-model="uId"  maxlength="16" @input="validateId" placeholder = "4~16자리의 영어, 숫자" autofocus @keyup.enter ="fnIdCheck">
					<button @click="fnIdCheck" class="mButton">아이디 중복 체크</button>
				</div>
				<div class="div1">
					<h3>닉네임</h3>
					<input type="text" v-model="uNickname" maxlength="16" placeholder = "" @keyup.enter="fnNickNameCheck">
					<button @click="fnNicknameCheck" class="mButton">닉네임 중복 체크</button>
				</div>
				<div class="div1">
					<h3>비밀번호</h3>
					<input type="password" v-model="uPassword"  maxlength="16" @input="validatePw" placeholder = "영어, 숫자, 특수문자">
				</div>
				<div class="div1">
					<h3>비밀번호 확인</h3>
					<input type="password" v-model="uPasswordC"  maxlength="16" @input="validatePw" placeholder = "영어, 숫자, 특수문자">
				</div>
				<div class="div1">
					<h3>이름</h3>
					<input type="text" @input="validateName" v-model="uName" @input="validateName" maxlength="30" placeholder = "한글 또는 영어">
				</div>
				<div class="div1">
					<h3>전화번호</h3>
					<input type="text" v-model="uTel" @input="validateTel" placeholder = " '-' 없이 숫자만 입력해주세요.">
				</div>
				<div class="div1">
					<h3>주소</h3>
					<div>
						<label for="si" class="control-label"></label> 
						<select id="si"	v-model="si" class="form-control" @change="fnGuList" style="margin-left: 19px;">
							<option value="">시 선택</option>
							<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
						</select>
					</div>
					<div>
						<label for="gu" class="control-label"></label> 
						<select	id="gu" v-model="gu" class="form-control" @change="fnDongList">
							<option value="">구 선택</option>
							<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
						</select>
					</div>
					<div>
						<label for="dong" class="control-label"></label> 
						<select	id="dong" v-model="dong" class="form-control">
							<option value="">동 선택</option>
							<option v-for="item in dongList" v-bind:value="item.dong">{{item.dong}}</option>
						</select>
					</div>
				</div>
				<div class="div1">
					<h3>이메일</h3>
					<input type="text" v-model="uEmail" @input="validateEmail" @keyup.enter = "fnEmailCheck">
					<button @click="fnEmailCheck" class="mButton">이메일 중복 체크</button>
				</div>
				<button class="joinBtn" @click="fnJoin">회원가입</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			uId : "",
			uNickname : "",
			uPassword : "",
			uPasswordC : "",
			uName : "",
			uTel : "",
			uAddress : "",
			uEmail : "",
			list : [] 
		   , siList : ${siList}
		   , guList : ${guList}
		   , dongList : ${dongList}
		   , si : ""
		   , gu : ""
		   , dong : ""
		   , guFlg : false
		   , dongFlg : false
		   , idFlg : false
		   , nickFlg : false
		   , mailFlg : false
		   , validatedId : ""
		   , validatedNickname : ""
		   , validatedEmail : ""
		},
		
		methods : {
			fnIdCheck : function() {
				var self = this;
				var nparmap = {id : self.uId};
				if (self.uId.length < 4 || self.uId.length > 16) {
				    alert("아이디는 4자 이상 16자 이하로 입력해주세요.");
				    return;
				}
				$.ajax({
					url : "/join/idcheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.num > 0) {
							alert("중복된 아이디가 있습니다.");
						} else {
							alert("사용가능한 아이디입니다.");
							self.validatedId = self.uId; 
							self.idFlg = true;
						}
					}
				});
			},
			fnNicknameCheck : function() {
				var self = this;
				var nparmap = {nickname : self.uNickname};
				$.ajax({
					url : "/join/nicknamecheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.num > 0) {
							alert("중복된 닉네임이 있습니다.");
						} else {
							alert("사용가능한 닉네임입니다.");
							self.validatedNickname = self.uNickname;
							self.nickFlg = true;
						}
					}
				});
			},
			fnEmailCheck : function() {
				var self = this;
				var nparmap = {email : self.uEmail};
				$.ajax({
					url : "/join/emailcheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.num > 0) {
							alert("중복된 이메일이 있습니다.");
						} else {
							alert("사용가능한 이메일입니다.");
							self.mailFlg = true;
							self.validatedEmail = self.uEmail;
						}
					}
				});
			},
			fnJoin : function() {
				var self = this;
				if (!self.uId || !self.uNickname || !self.uPassword || 
					!self.uName || !self.uTel || !self.si ||
					!self.gu || !self.dong || !self.uEmail) {
				    alert("모든 사항을 입력해주세요.");
				    return;
				}
				if (self.uPassword != self.uPasswordC){
					alert("비밀번호와 비밀번호 확인이 다릅니다.")
					return;
				}
				if (!self.idFlg || self.validatedId != self.uId) {
					alert("아이디 중복체크를 해주세요.");
					self.idFlg = false;
					return;
				}
				if (!self.nickFlg || self.validatedNickname != self.uNickname) {
					alert("닉네임 중복체크를 해주세요.");
					self.nickFlg = false;
					return;
				}
				if (!self.mailFlg || self.validatedEmail != self.uEmail) {
					alert("이메일 중복체크를 해주세요.");
					self.mailFlg = false;
					return;
				}
				
				var nparmap = {id : self.uId
							   , password : self. uPassword
							   , name : self.uName
							   , nickname : self.uNickname
							   , tel : self.uTel
							   , email : self.uEmail
							   , address : self.si +" "+ self.gu +" "+ self.dong};
				$.ajax({
					url : "/join/add.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if(data.result == "success"){
	                		alert("회원가입 성공!!");
	                		window.location.href = "/login.do";
	                	} else {
	                		alert("회원가입 실패!!");
	                	}
					}
				});
				
			}, fnGuList : function(){
	    		var self = this;
	            var nparmap = {si : self.si};
	            $.ajax({
	                url:"/gu/list.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {  
		                self.guList = data.guList;
		                console.log(data.guList);
		                self.gu = "";
		                self.dong = "";
	                }
	            }); 
	        }
	    	, fnDongList : function(){
	     		var self = this;
	             var nparmap = {si : self.si, gu : self.gu};
	             $.ajax({
	                 url:"/dong/list.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) {                                       
	 	                self.dongList = data.dongList;
	 	          		self.dong = "";
	                 }
	             }); 
	         }
	    	,validateId() {
	    	      const regex = new RegExp(/^[a-zA-Z가-힣0-9]*$/); // regular expression that matches only Korean and English characters
		    	    if (!regex.test(this.uId)) {
		    	        this.uId = this.uId.replace(/[^a-zA-Z가-힣]/g, ''); // remove any characters that are not Korean or English
		    	    }
	    	 }
	    	,validatePw() {
	    		 const regex = new RegExp(/^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]*$/);
	    		  if (!regex.test(this.uPassword)) {
	    		    this.uPassword = this.uPassword.replace(/[^a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]/g, '');
	    		  }
	    	 }
	    	,validateName() {
	    		const regex = new RegExp(/^[a-zA-Z가-힣]*$/); // regular expression that matches only Korean and English characters
	    	    if (!regex.test(this.uName)) {
	    	        this.uName = this.uName.replace(/[^a-zA-Z가-힣]/g, ''); // remove any characters that are not Korean or English
	    	    }
	    	 }
	    	,validateTel() {
	    		const regex = new RegExp(/^[0-9]*$/); // regular expression that matches only Korean and English characters
	    	    if (!regex.test(this.uTel)) {
	    	        this.uTel = this.uTel.replace(/[^0-9]/g, ''); // remove any characters that are not Korean or English
	    	    }
	    	 }
	    	,validateEmail() {
	    	 }
		},
		created : function() {

		}
	});
</script>

