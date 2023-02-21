<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<link rel="stylesheet" href="css/writebody.css" type="text/css">
<title>쪽지 쓰기</title>
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
		<div class="popWrapper">
			<h1>쪽지 보내기</h1>
			<div class="popWrite">
				<dl class="to">
					<dt>받는 사람</dt>
					<dd>
						<input type="text" class="inputText" v-model="uRecipient" placeholder="상대방 닉네임을 입력하세요."
							data-replyto="">
					</dd>
				</dl>
				<dl class="to">
					<dt>제목</dt>
					<dd>
						<input type="text" class="inputText" v-model="mTitle" placeholder="제목을 입력하세요."
							data-replyto="">
					</dd>
				</dl>				
				<dl>
					<dt>내용</dt>
					<dd for="wr_1">
						<textarea name="" id="content" cols="300" rows="30" v-model="mContent"
							class="inputTextarea" maxlength="300" placeholder="쪽지 내용을 입력하세요"></textarea>
						<span class="bite" id="counter">0/300</span>
					</dd>
				</dl>
				<div class="btSec">
					<button class="btCancel" id="btCancel" @click="fnWriteclose">
						<span>취소</span>
					</button>
					<button class="btSubmit" id="btSubmit" @click="fnSave">
						<span>쪽지 보내기</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $('#counter').html(content.length + '/300');
        if (content.length > 300) {
        	// 300자 부터는 타이핑 되지 않도록
            $(this).val($(this).val().substring(0, 300));
            // 300자 넘으면 알림창 뜨도록
            alert('글자수는 300자까지 입력 가능합니다.');
            var content = $(this).val();
            $('#counter').html(content.length + '/300');
        };      
    });
    $('#content').keyup();
});
	var app = new Vue({
		el : '#app',
		data : {
			list : []
			,nickname : ""
			,uSender : ""
			,uRecipient : ""
			,mTitle : ""
			,mContent : ""
			,userId : "${userId}"
		}
		,methods : {
			fnWriteclose : function() {
				window.close();
			}
			,fnGetList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "/message/getmessage.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(self.list);
						console.log(self.uSender);
					}
				});
			}
			,
	        fnGetInfo : function(){
	   			var self = this;
	            var nparmap = {id : self.userId};
		           $.ajax({
		               url:"/writing/get.dox",
		               dataType:"json",	
		               type : "POST", 
		               data : nparmap,
		               success : function(data) {  
		            	   self.nickname = data.nickname;
		               }
		           }); 
		     }
	    	,
	    	fnSave : function() {
				var self = this;
				var nparmap = {nickname : self.uRecipient};
				if(!self.userId){
					alert("로그인 후 이용가능합니다.");
				}
				else if(!self.uRecipient || !self.mTitle || !self.mContent){
		      		alert("모든 내용을 입력해주세요.");
		      	} else{
				$.ajax({
					url : "/writing/nicknamecheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.num > 0) {
					      	var nparmap = {u_sender : self.nickname, u_recipient : self.uRecipient
					      			       ,m_title : self.mTitle, m_content : self.mContent, u_id : self.userId};
							$.ajax({
								url : "/writing/add.dox",
								dataType : "json",
								type : "POST",
								data : nparmap,
								success : function(data) {
									if (data.result == "success") {
										alert("메시지 보내기가 성공했습니다.");
										self.fnGetList();
										window.close();
									} else
										alert("메시지 보내기가 실패했습니다.");
								}
							}); 
						} else {
							alert("닉네임을 정확히 입력해주세요.");
							return;
						}
					}
				});
		      	}
			}
		}
		, created : function() {
	        var self = this;
	        self.fnGetInfo();
	        self.fnGetList();
		}
	});
</script>