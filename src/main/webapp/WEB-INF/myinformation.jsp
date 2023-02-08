<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>마켓이름 : 상품정보</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }

			.ebtn{
				float: right;
				font-size: 20px;
			}

			span{
				font-size: 25px;
			}
			
			td{
				border: solid 2px;
			}
			
			.outerdiv{
				margin: auto; /*상.하.좌.우 가운데 정렬(바깥쪽 여백), width랑 같이 사용*/
	            width: 60%; /*좌.우 길이, 없으면 전체*/
	            height: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px; /*모서리 부분 원의 형태로 바꿔줌*/
	            text-align: center; /*하위 요소 가운데 정렬*/
	            padding: 20px; 
			}
    	</style>
	</head>

	<body>
		<div class="outerdiv">
			<div style="text-align: left;">
				<span>회원정보</span>	
				<button class = "ebtn">회원탈퇴</button>
			</div>
			<table>
				<tr>
					<td>아이디</td>
					<td colspan="2">아이디테스트</td>
					<td colspan="2">전화번호</td>
					<td>010-1111-1111</td>
					<td><a>변경</a></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>이름입력란</td>
					<td><a>변경</a></td>
					<td>이메일</td>
					<td colspan="2">이메일입력</td>
					<td><a>변경</a></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>닉네임입력</td>
					<td>변경</td>
					<td>주소</td>
					<td><select name = "region" style="margin-left: 20px;">
						<option value="선택" selected>지역 선택</option>
						<option value="서울특별시" >서울특별시</option>
						<option value="인천광역시" >인천광역시</option>
					</select>
					</td>
					<td><select name = "region2">
						<option value="선택" selected>지역 선택</option>
						<option value="서울특별시" >서울특별시</option>
						<option value="인천광역시" >인천광역시</option>
					</select></td>
					<td>변경</td>
				</tr>
			</table>
		</div>
		
		
		
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    }   
    , methods: {
    	
    }   
    , created: function () {
    
	}
});
</script>
