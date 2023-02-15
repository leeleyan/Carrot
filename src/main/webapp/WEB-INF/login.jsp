<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/logoheader.jsp"></jsp:include>
		<title>마켓이름 : 로그인</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: white;
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
	        html, body {
   		    margin: 0;
    		padding: 0;
    		height: 100%;
			}	

#body-wrapper {
    position: relative;
}

#body-content {
    margin-top: 60px;
}
    	</style>
	</head>
	<div id="body-wrapper">
		<div id="body-content">
	<body>
		<div id="app">
		<div class="div1">
		<div class="div2">
				<input type="text" v-model="uId" class="in" placeholder="아이디"></input>
		</div>
		<div class="div2">
				<input type="password" v-model="uPassword" class="in" placeholder="비밀번호"></input>
		</div>
		<div class="div2">
				<button id="btn" @click="fnLogin">로그인</button>
		</div>
		<div>
		<a href="idfind.do">아이디 찾기 </a>
		<a href="pwfind.do">| 비밀번호 찾기</a>
		<a href="join.do">| 회원가입</a>
		</div>
		</div>	
		</div>	
	</body>
			
		</div>
	</div>
	<setfooter>
	<jsp:include page="/layout/marketfooter.jsp"></jsp:include>
	</setfooter>
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
                url:"/login/get.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {     
                	if(data.result == "success"){
                		alert(data.user.uName + "님 로그인 성공!!");
                		self.pageChange("/main.do", {});
                	} else {
                		alert("로그인 실패!!");
                	}
                }
            }); 
        }
    
        , pageChange : function(url, param) {
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
    }   
    , created: function () {
    
	}
});
</script>
