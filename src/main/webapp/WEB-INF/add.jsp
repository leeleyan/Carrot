<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/marketheader.jsp"></jsp:include>
		<title>마켓이름 : 상품등록</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
			.preview-img {
				width: 300px;
				height: 200px;
				margin-right: 10px;
			}
			h1{
				display: inline-block;
			}
			.addinput{
				margin-left: 30px;
				width: 40em;
				height: 40px;
			}
			.addcontainer{
				margin-left: 10%;
				margin-right: 10%;
				margin-bottom: 40px;
			}
			hr{
				margin-top: 15px;
				margin-bottom: 15px;
			}
			.addspan{
				font-size: 25px;
				margin-left: 5px;
			}
			.addbutton{
				width: 220px;
				font-size: 30px;
				display: block;
			}
    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<div class="addcontainer">
			<template>
				<h1>상품 이미지</h1>
				<input type="file" class="addinput" @change="updateImages" id="file1" name="file1"/>
				<br><br>
				<div>
					<span v-for="(image, index) in previewImages" :key="index" class="addspan">
					<img :src="image" alt="Image Preview" class="preview-img"/>
				</div>
					<button @click="removeImage(index)" class="addbutton">Cancel</button>
			</template>
			<hr>
			<div>
				<h1>제목</h1>
				<input type="text" class="addinput" v-model="bTitle" placeholder="제목">
				<hr>
			</div>
			<div>
				<h1>거래 지역</h1>
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
				<hr>
			</div>
			<div>
				<h1>가격</h1>
				<input type="text" class="addinput" v-model="pPrice" style="width: 100px;" placeholder="ex)10000"> <span>원</span>
				<hr>
			</div>
			<div>
				<h1 style="display: block;">게시글 내용</h1>
				<textarea name="" id="" cols="85" rows="10" v-model="bContent"></textarea>
				<hr>
			</div>
			<div style = "display : flex;">
				<button @click="fnSave" class="addbutton" style ="margin-left: 100px;">등록하기</button>
				<button @click="fnList" class="addbutton" >돌아가기</button>
			</div>
		</div>
	</div>	
	</body>
	<jsp:include page="/layout/marketfooter.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
	data: {
		 previewImages : []
		, userNickName : "${userNickName}"
	    , list : [] 
    	, selectedItemList : []
	    , siList : ${siList}
	    , guList : ${guList}
	    , dongList : ${dongList}
	    , si : ""
	    , gu : ""
	    , dong : ""
	    , guFlg : false
	    , dongFlg : false
	    , img : ""
	    , bTitle : ""
	    , uAddress : ""
	    , pPrice : 0
	    , bContent : ""
    }  
    , methods: {
		updateImages(event) {
			const files = event.target.files;
			for (const file of files) {
				this.previewImages.push(URL.createObjectURL(file));
			}
    	}
		, removeImage(index) {
    		this.previewImages.splice(index, 1);
  		}
		, fnGuList : function(){
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
		, fnSave : function(){
    		var self = this;
    		console.log(self.img);
	      	var nparmap = {title : self.bTitle, content : self.bContent
	      			       , nickname : self.userNickName, img : self.img
	      			       , address : self.si + self.gu + self.dong
	      			       , price : self.pPrice};
	        $.ajax({
	            url:"/add.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	            	var form = new FormData();
	       	        form.append( "file1", $("#file1")[0].files[0] );
	       	     	form.append( "boardIdx",  data.boardIdx);
	       	        
	       	         $.ajax({
	       	             url : "/upload"
	       	           , type : "POST"
	       	           , processData : false
	       	           , contentType : false
	       	           , data : form
	       	           , success:function(response) { }
	       	           ,error: function (jqXHR) 
	       	           {}
	       	       });
	            	alert("물품이 등록되었습니다.");
	            	self.fnList();
	            }
	        }); 
	        
    	}
		
		, fnList : function(){
			location.href="/main.do";
		}
	}   
    , created: function () {
    
	}
});
</script>