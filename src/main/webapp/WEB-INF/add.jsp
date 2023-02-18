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
				margin: 10px;
			}
			.preview{
				width: 100%;
			}
			.cancelBtn{
				width: 150px;
				font-size: 20px;
				display: block;
			}
			.an{
				color: rgb(23, 117, 175);
			}
    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<div class="addcontainer">
			<template>
				<h1>상품 이미지</h1>
				<input type="file" class="addinput" @change="updateImages" id="file1" name="file1" multiple/>
				<div class="preview">
					<label v-for="(image, index) in previewImages" :key="index" class="addspan">
						<img :src="image" alt="Image Preview" class="preview-img"/>
						<input type ="radio" v-model = "selectItem" v-bind:id = "'radio_' + index" 
						v-bind:value="index" @click="fnSelectThumbnail" ></input>
					</label>
				</div>
					<button @click="removeImage(index)" class="cancelBtn">Cancel</button>
					<span class="an">판매하실 상품을 대표할 만한 미리보기 이미지를 선택하세요.</span>
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
				<button @click="fnSave" class="addbutton" style ="margin-left: 100px;" type="submit">등록하기</button>
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
		, nickname : ""
	    , list : [] 
    	, selectedItemList : []
	    , siList : ${siList}
	    , guList : ${guList}
	    , dongList : ${dongList}
	    , si : ""
	    , gu : ""
	    , dong : ""
	    , img : ""
	    , bTitle : ""
	    , uAddress : ""
	    , pPrice : ""
	    , bContent : ""
	    , userId : "${userId}"
	    , saveImgFile : []
	    , selectItem : null
	    , thumbnail : 0
    }  
    , methods: {
		updateImages(event) {
			const files = event.target.files;
			
			for (const file of files) {
				this.saveImgFile.push(file);
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
    		var fileCheck = document.getElementById("file1").value;
    		var nparmap = {title : self.bTitle, content : self.bContent
   			       , nickname : self.nickname, img : self.img
   			       , address : self.si + self.gu + self.dong
   			       , price : self.pPrice};
    		console.log(self.img);
    		
    	    if(!fileCheck || !self.bTitle || !self.bContent ||
    	       !self.pPrice || !self.si || !self.dong || !self.gu) {
    	    	if(!fileCheck){
	    	    	alert("사진을 선택해주세요.");
    	    	}
    	    	if(!self.bTitle){
	    	    	alert("제목을 입력해주세요.");
    	    	}
    	    	if(!self.si || !self.gu || !self.dong){
	    	    	alert("시, 구, 동을 모두 선택해주세요.");
    	    	}
    	    	if(!self.pPrice){
	    	    	alert("가격을 입력해주세요.");
    	    	}
    	    	if(!self.bContent){
	    	    	alert("내용을 입력해주세요.");
    	    	}
    	    	return;
    	    }
	        $.ajax({
	            url:"/add.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {      
	            	for(var i=0; i<self.saveImgFile.length; i++){
	            		var form = new FormData();
		       	        form.append( "file1", self.saveImgFile[i] );
		       	     	form.append( "boardIdx",  data.boardIdx);
		       	     	if(i==self.thumbnail) {
		       	     		form.append("thumbnail", "y");
		       	     	}else {
		       	     		form.append("thumbnail", "n");
		       	     	}
	            		self.fnUpload(form);
	            	}
	       	         
	            	alert("물품이 등록되었습니다.");
	            	self.fnList();
	            }
	        }); 
	        
    	}
		, fnUpload : function(form){
    		var self = this;
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
    	}
		,
        fnGetInfo : function(){
   			var self = this;
            var nparmap = {id : self.userId};
	           $.ajax({
	               url:"/add/get.dox",
	               dataType:"json",	
	               type : "POST", 
	               data : nparmap,
	               success : function(data) {  
	            	   self.nickname = data.nickname;
	               }
	           }); 
	     }
		
		, fnList : function(){
			location.href="/main.do";
		}
		, fnSelectThumbnail : function(event){
			var self = this;
	   		self.thumbnail = event.srcElement.id.replace('radio_', '');
	   		console.log(self.thumbnail);
		}
	}   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});
</script>
