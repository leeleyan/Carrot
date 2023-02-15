<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/marketheader.jsp"></jsp:include>
		<title>마켓이름 : 상품정보</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
			.container{
				margin: auto;
				border: solid gray 1px;
				width: 1010px;
				margin-top: 50px;
      		}
    	</style>
	</head>
	<body>
		<div class = container id = "app">
			<div class="imgDiv"><img :src="info.img" class="itemimg"></div>
			<div class="nick">
				<span>닉네임</span>
				<span>{{info.uNickName}}</span>
				<span>장소</span>
				<span>{{info.uAddress}}</span>
			</div>
			<hr>
			<div class="title">
				<span>제목</span>
				<span>{{info.bTitle}}</span>
			</div>
			<div class="price">
				<span>가격</span>
				<span>{{info.pPrice}} 원</span>
			</div>
			<div class="description">
				{{info.bContent}}
			</div>
			<div class="message"></div>
		</div>
	</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	idx : "${map.boardIdx}",
    	userId : "${userId}",
    	userNickName : "${userNickName}",
    	info : {}
    }   
    , methods: {
    	fnGetItem : function(){
            var self = this;
            var nparmap = {boardIdx : self.idx};
            $.ajax({
                url:"/product/details.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.product;
                }
            }); 
        },

    	
    }   
    , created: function () {
    	var self = this;
    	self.fnGetItem();
	}
});
</script>
