<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="/img/favicon.ico">
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
			<a class="textblank"> 
				<button class="logobtn" @click="fnMain">
				<img src="img/marketlogo.png" width="136px" height="40px">
				</button>
			</a> 	
			<div class="text1">
				<div class="text3">
					<input type="text" placeholder="상품명, 지역을 입력하세요." class="text2 findinput" value="" v-model="skeyword" @keyup.enter="fnSearch4">
					<a><img src="img/selectimg.png" width="16" height="16" alt="검색 버튼 아이콘" @click="fnSearch4"></a>
				</div>
			</div>
			<button class="loginsignbtn" @click="userId ? fnMyInfo() : fnMyInfo()">
					  {{ userId ? userId + '님' : '' }}
			</button>
			<button class="loginsignbtn" @click="userId ? fnLogout() : redirectToLogin()">
    				  {{ userId ? '로그아웃' : '로그인/회원가입' }}
			</button>
		</div>
			<div class="headusermenu">
				<button class="headmymenubtn"@click="userId ? fnMyInfo() : redirectToLogin()">
					<img src="img/userlogimg.png" width="23" height="24" alt="내정보버튼 이미지">
					내 정보
				</button>
			<button class="headmymenubtn" @click="userId ? fnAdd() : redirectToLogin()">
				<img src="img/usersellimg.png" width="23" height="24" alt="물품등록버튼 이미지">
				물품등록
			</button>
			<button class="headmymenubtn" @click="userId ? fnMessage() : redirectToLogin()">
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
    	, skeyword : ""
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
        
        , fnMain : function(){
    		var self = this;
    		self.pageChange("./main.do", {});
    	}
        
        , fnMyInfor : function(){
    		var self = this;
    		self.pageChange("./myinformation.do", {});
    	}
        
        , redirectToLogin() {
        	var self = this;
            self.pageChange("./login.do", {});
        }
        
        , fnLogout : function(){
            var self = this;
            var nparmap = {}; 
            $.ajax({
                url:"/logout/get.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.pageChange("./main.do", {});
          		}
        	}); 
    	}
        , fnSearch4 : function(){
	        var self = this;
	        var nparmap = {keyword : self.skeyword};
	        $.ajax({
	            url:"/searchTitle.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                app.list = data.list;
	                self.skeyword = '';
	            }
	        }); 
	    }
    }
     
    , created: function () {
    
	}
});
</script>
