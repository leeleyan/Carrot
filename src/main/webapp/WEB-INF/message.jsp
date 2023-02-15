<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/logoheader.jsp"></jsp:include>
		<title>마켓이름 : 쪽지화면</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
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
    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<button class="logobtn" @click="fnMain">쪽지작성</button>
	</div>	
	</body>
	<setfooter>
	<jsp:include page="/layout/marketfooter.jsp"></jsp:include>
	</setfooter>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userNickName : "${userNickName}"
        , userId : "${userId}"
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/message/getmessage.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                console.log(self.list);
                }
            }); 
        }
    	,pageChange : function(url, param) {
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
    		,fnMain : function(){
    			window.open("./writing.do","쪽지쓰기","width=555,height=580");
    	}
    }   
    , created: function () {
        var self = this;
        self.fnGetList();
	}
});
</script>
