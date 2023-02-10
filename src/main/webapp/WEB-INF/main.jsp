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
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
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
	         .div2 {
	            margin: auto;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 0px;
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
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 15px;
	        }
    	</style>
	</head>
	<body>
	<div>
				<label for="si" class="control-label">시 : </label>
				<select id="si" v-model="si" class="form-control" id="si" @change="fnGuList"> 
					<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
				</select>
			</div>
			<div >
				<label for="gu" class="control-label">구/군 : </label>
				<select id="gu" v-model="gu" class="form-control" id="gu" @change="fnDongList">
					<option value="">:: 선택 ::</option>
					<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
				</select>
			</div>
			<div>
				<label for="dong" class="control-label">동 : </label>
				<select id="dong" v-model="dong" class="form-control" id="dong">
					<option value="">:: 선택 ::</option>
					<option v-for="item in dongList" v-bind:value="item.dong">{{item.dong}}</option>
				</select>
			</div>
			
	<jsp:include page="/layout/marketmainbody.jsp"></jsp:include>
		<div id="app" class="div1">
   	 <button onclick="window.open('unregister.do','_blank');">회원탈퇴</button>
	 <button onclick="window.open('writing.do','_blank');">판매자에게 쪽지 보내기</button>
	 <!-- 팝업창 정중앙에 위치 'left='+(screen.availWidth-900)/2+',top='+(screen.availHeight-600)/2+', width=900,height=430' -->

	<div class="container">
	<input type="file" accept="image/*"multiple>
	<img src="" alt="">
	</div>
	</div>		
	</body>
	<jsp:include page="/layout/marketfooter.jsp"></jsp:include>	
</html>

<script type="text/javascript">
var app = new Vue({ 
	
    el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    	, siList : ${siList}
 	    , guList : ${guList}
 	    , dongList : ${dongList}
		, si : "서울특별시"
		, gu : ""
		, dong : ""
    }   
    , methods: {
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
    }   
    , created: function () {
    
	}
});

window.addEventListener('load', function() {
	
	const container = document.querySelector('.container');
	const fileInput = container.querySelector('input[type="file"]');
	const img = document.querySelector('img');
  
	fileInput.addEventListener('input', () => {
		
		if(!isImage(fileInput.files[0])) {
			alert('Image 파일만 업로드 할 수 있습니다.');
			return;
		}
		
		const reader = new FileReader();
		const image = new Image();
    
		reader.addEventListener('load', () => {
            image.src = reader.result;
            image.addEventListener('load', () => {				
				container.style.width = image.width + 'px';
                container.style.height = image.height + 'px';
                img.src = image.src 
			});    
		});
		
		reader.readAsDataURL(fileInput.files[0]);
	});
	
	function isImage(file){
		return file.type.indexOf('image') >= 0;
	}

});
</script>
