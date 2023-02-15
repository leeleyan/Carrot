<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/header.css" type="text/css">
		<link rel="stylesheet" href="css/headerfirstline.css" type="text/css">
		<link rel="stylesheet" href="css/headerblank.css" type="text/css">
		<link rel="stylesheet" href="css/headertext.css" type="text/css">
		<link rel="stylesheet" href="css/headerloginsignbtn.css" type="text/css">
		<link rel="stylesheet" href="css/headerusermenu.css" type="text/css">
		<link rel="stylesheet" href="css/headerusermenubtn.css" type="text/css">
		<style>
	        a {
    		color: rgb(33, 33, 33);
    		text-decoration: none;
    		cursor: pointer;
    		background-color: transparent;
			}		
		</style>
	</head>
<body style="margin: 0px;">
	<div id="app2">
	<div class="header">
		<div class="headfirst">
			<a class="textblank"> <img src="img/marketlogo.png" width="136px" height="40px"></a> 
			<div class="text1">
				<div class="text3">
					<input type="text" placeholder=" 상품 제목 입력" class="text2 findinput" value="">
					<a><img src="img/selectimg.png" width="16" height="16" alt="검색 버튼 아이콘"></a>
				</div>
			</div>
			<button class="loginsignbtn" onclick="location.href='login.do'">로그인/회원가입</button>
		</div>
			<div class="headusermenu">
				<button class="headmymenubtn" @click="fnMyInfo">
					<img src="img/userlogimg.png" width="23" height="24" alt="내정보버튼 이미지">
					내 정보
				</button>
			<button class="headmymenubtn" @click="fnAdd">
				<img src="img/usersellimg.png" width="23" height="24" alt="물품등록버튼 이미지">
				물품등록
			</button>
			<button class="headmymenubtn" @click="fnMessage">
				<img src="img/userchatimg.png" width="23" height="24" alt="쪽지버튼 이미지">
				쪽지
			</button>
		</div>
	</div>
	</div>
</body>
</html>

<script type="text/javascript">

var app = new Vue({ 
    el: '#app2',
    data: {
    	 userNickName : "${userNickName}"
    	, userId : "${userId}"
    }   
    , methods: {
    
    	pageChange : function(url, param) {
	        var target = "_self";
	        if(param == undefined){
	        //   this.linkCall(url);
	           return;
	        }
	        var form = document.createElement("form"); 
	        form.name = "dataform";
	        form.action = url;
	        form.method = "post";
	        form.target = target;
	        for(var name in param){
	          var item = name;
	          var val = "";
	          if(param[name] instanceof Object){
	             val = JSON.stringify(param[name]);
	          } else {
	             val = param[name];
	          }
	          var input = document.createElement("input");
	           input.type = "hidden";
	           input.name = item;
	           input.value = val;
	           form.insertBefore(input, null);
	       }
	        document.body.appendChild(form);
	        form.submit();
	        document.body.removeChild(form);
	     }
        , fnMyInfo : function(){
    		var self = this;
    		self.pageChange("./myinformation.do", {});
    	}
        , fnAdd : function(){
    		var self = this;
    		self.pageChange("./add.do", {});
    	}
        , fnMessage : function(){
    		var self = this;
    		self.pageChange("./message.do", {});
    	}
        
    }
     
    , created: function () {
    
	}
});
</script>
