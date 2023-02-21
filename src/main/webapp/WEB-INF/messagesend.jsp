<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<link rel="stylesheet" href="css/showmessage.css" type="text/css">
<title>쪽지</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body class="popup">
	<div id="app">
		<div class="popWrapper" v-for="(item, index) in list">
			<h1>받은 쪽지</h1>
			<div class="popSend">
				<dl class="to">
					<dt>보낸 사람</dt>
					<dd>
					<dt>{{item.uSender}}</dt>
					</dd>
				</dl>
				<dl class="to">
					<dt>제목</dt>
					<dd>
					<dt>{{item.mTitle}}</dt>
					</dd>
				</dl>				
				<dl>
					<dt>내용</dt>
					<dd for="wr_1">
					<dt class="textarea">{{item.mContent}}</dt>
					</dd>
				</dl>
				<div class="btSec">
					<button class="btCancel" id="btCancel" @click="fnSendclose">
						<span>취소</span>
					</button>
					<button class="btSubmit" id="btSubmit" @click="fnWrite">
						<span>답장 하기</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			mNo : "${map.mNo}"
		}
		,methods : {
			fnGetList : function(){
	            var self = this;
	            var nparmap = { mNo : self.mNo };
	            $.ajax({
	                url:"/message/getsendmessage.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                                       
		                self.list = data.list;
		                console.log(self.list);
	                }
	            }); 
	        },fnWrite : function(){
	        	var self = this;
	        	console.log(self.list[0].uSender);
	        	var reply = self.list[0].uSender;
	        	/* window.close(); */
    			window.open("./writing.do?recipient="+reply,"쪽지쓰기","width=555,height=580");
	    	},fnSendclose : function() {
				window.close();
			}
		}
		, created : function() {
			var self = this;
	    	self.fnGetList();
		}
	});
</script>