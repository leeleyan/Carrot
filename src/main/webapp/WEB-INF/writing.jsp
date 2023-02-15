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
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;

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
						<input type="text" class="inputText" placeholder="상대방 닉네임을 입력하세요."
							data-replyto="">
					</dd>
				</dl>
				<dl>
					<dt>내용</dt>
					<dd for="wr_1">
						<textarea name="" id="content" cols="300" rows="30"
							class="inputTextarea" placeholder="쪽지 내용을 입력하세요"></textarea>
						<span class="bite" id="counter">0/300</span>
					</dd>
				</dl>
				<div class="btSec">
					<button class="btCancel" id="btCancel" @click="fnWriteclose">
						<span>취소</span>
					</button>
					<button class="btSubmit" id="btSubmit" @click="fnWriteclose">
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
    });
    $('#content').keyup();
});
	var app = new Vue({
		el : '#app',
		data : {

		},
		methods : {
			fnWriteclose : function() {
				window.close();
			},
			fnGetList : function() {
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
					}
				});
			}
		},
		created : function() {
	        var self = this;
	        self.fnGetList();
		}
	});
</script>
