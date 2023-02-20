<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/logoheader.jsp"></jsp:include>
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
			.findPwBtn{
				font-size: large;
				width: 200px;
				justify-content: center;
			}
			.container{
				width: fit-content;
				margin: auto;
				padding: 10px;
				display: flex;
				flex-direction: column;
				background-color: #eeeef1;
			}

			.div1{
				padding: 5px;
			}
			.div2{
				padding: 5px;
				display: flex;
				justify-content: center; 
				margin-top: 20px;
			}

    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<div class="container">
			<div class="div1">
				<h3>비밀번호 찾기</h3>
				<span>아이디</span>
				<input type="text" v-model="uId" autofocus><br>
				<span>이메일</span>
				<input type="text" v-model="uEmail" @keyup.enter = "fnPwFind"><br>
			</div>
			<div class="div2">
				<button @click="fnPwFind" class="findPwBtn">비밀번호 재설정</button>	
			</div>
		</div>
	</div>
	</body>
</html>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	uId : ""
        ,uEmail : ""
    }   
    , methods: {
    	fnPwFind : function(){
            var self = this;
            var nparmap = {id : self.uId, email : self.uEmail}; 
            $.ajax({
                url:"/pwfind/get.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {     
                	if(data.result == "success"){
                		self.pageChange("/pwreset.do", {id : self.uId});
                	} else {
                		alert("아이디, 이메일을 정확히 입력해주세요.");
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
