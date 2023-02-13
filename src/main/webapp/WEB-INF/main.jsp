<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/marketheader.jsp"></jsp:include>
		<title>마켓이름 : 메인화면</title>
			<style>
				@import
				url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
				;

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
				.nav{
					float: right;
				}
				
				#dong{
					margin-right: 190px;
				}
		</style>
	</head>
<body>
	<div id="app">
	<span v-if="userNickName">{{userNickName}}님 안녕하세요.</span>
		<div class = "nav">
			<label for="si" class="control-label"></label> 
			<select id="si"	v-model="si" class="form-control" @change="fnGuList" >
				<option value="">시 선택</option>
				<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
			</select>
		
			<label for="gu" class="control-label"></label> 
			<select	id="gu" v-model="gu" class="form-control" @change="fnDongList">
				<option value="">구 선택</option>
				<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
			</select>
	
			<label for="dong" class="control-label"></label> 
			<select	id="dong" v-model="dong" class="form-control">
				<option value="">동 선택</option>
				<option v-for="item in dongList" v-bind:value="item.dong">{{item.dong}}</option>
			</select>
		</div>
	</div>
	<jsp:include page="/layout/marketmainbody.jsp"></jsp:include>
	<div id="app" class="div1">
		<button onclick="window.open('unregister.do','_blank');">회원탈퇴</button>
		<button onclick="window.open('writing.do','_blank');">판매자에게
			쪽지 보내기</button>
		<!-- 팝업창 정중앙에 위치 'left='+(screen.availWidth-900)/2+',top='+(screen.availHeight-600)/2+', width=900,height=430' -->

		<div class="container">
			<input type="file" accept="image/*" multiple> <img src="" alt="">
		</div>
	</div>
</body>
<jsp:include page="/layout/marketfooter.jsp"></jsp:include>
</html>

<script type="text/javascript">
var app = new Vue({
	el : '#app',
	data : {
		list : [] 
       , selectedItemList : []
	   , siList : ${siList}
	   , guList : ${guList}
	   , dongList : ${dongList}
	   , si : ""
	   , gu : ""
	   , dong : ""
	   , guFlg : false
	   , dongFlg : false
	   , idFlg : false
	   , nickFlg : false
	   , mailFlg : false
	   , userNickName : "${userNickName}"
	   , userId : "${userId}"
	},
	
	methods : {
		fnGuList : function(){
    		var self = this;
            var nparmap = {si : self.si};
            $.ajax({
                url:"/gu/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {  
	                self.guList = data.guList;
	                console.log(data.guList);
	                self.gu = "";
	                self.dong = "";
                }
            }); 
        }
    	, fnDongList : function(){
     		var self = this;
             var nparmap = {si : self.si, gu : self.gu};
             $.ajax({
                 url:"/dong/list.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {                                       
 	                self.dongList = data.dongList;
 	          		self.dong = "";
                 }
             }); 
         }   
	},
	created : function() {
/*     	var self = this;
    	self.fnList(); */
	}
});
</script>

