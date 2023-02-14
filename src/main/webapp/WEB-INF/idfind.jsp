<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>마켓이름 : 아이디 찾기</title>
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
	<div id="app" class="div1">
		<div>
			<h3>아이디 찾기</h3>
			<span>이름</span>
			<input type="text" v-model="uName"><br>
			<span>이메일</span>
			<input type="text" v-model="uEmail"><br>
		</div>
		<button @click="fnIdFind">아이디 찾기</button>
	</div>
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	uName : ""
        , uEmail : ""
        , uId : ""
    }   
    , methods: {
    	fnIdFind : function(){
            var self = this;
            var nparmap = {name : self.uName, email : self.uEmail}; 
            $.ajax({
                url:"/idfind/get.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {     
                	if(data.result == "success"){
                		alert(data.list[0].uName + "님의 아이디는 " + data.list[0].uId + " 입니다.");
                		self.pageChange("/login.do", {});
                	} else {
                		alert("이름, 이메일을 정확히 입력해주세요.");
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
