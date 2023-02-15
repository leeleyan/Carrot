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
		{{userNickName}}
		쪽지
		쪽지
		쪽지
		쪽지
		쪽지
		쪽지
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
    	
    }   
    , created: function () {
    
	}
});
</script>
