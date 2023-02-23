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
				width: 235px;
				height: 200px;
				margin-right: 10px;
			}
			h1{
				display: inline-block;
			}
			.addinput{
				margin-left: 30px;
				width: 30em;
				height: 40px;
			}
			.addcontainer{
				margin-left: 20%;
				margin-right: 20%;
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
				width: 250px;
    			font-size: 30px;
    			display: block;
    			margin-left: 18%;
			}
			.preview{
				width: 100%;
			}
			.cancelBtn{
				width: 150px;
				font-size: 20px;
				display: block;
				margin-top: 20px;
				margin-bottom: 20px;
				margin-left: 40px;
			}
			.an{
				color: rgb(255, 0, 0);
				font-size: 20px;
   				font-weight: bold;
			}
			select{
				width: auto;
				height: 50px;
				font-size: 16px;
			}
			.cXVdux {
			    display: flex;
			    width: 856px;
			    flex-wrap: wrap;
			    overflow-x: hidden;
			 }
			.gDZtN {
			    width: 202px;
			    height: 202px;
			    position: relative;
			    border: 1px solid rgb(230, 229, 239);
			    background: rgb(250, 250, 253);
			    display: flex;
			    -webkit-box-align: center;
			    align-items: center;
			    -webkit-box-pack: center;
			    justify-content: center;
			    flex-direction: column;
			    color: rgb(155, 153, 169);
			    font-size: 1rem;
			    margin-right: 1rem;
			    margin-bottom: 1rem;
			}
			.fJxKeH::before {
			    content: "";
			    background-position: center center;
			    background-repeat: no-repeat;
			    background-size: cover;
			    width: 2rem;
			    height: 2rem;
			    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgdmlld0JveD0iMCAwIDMyIDMyIj4KICAgIDxwYXRoIGZpbGw9IiNEQ0RCRTQiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTI4LjQ3MSAzMkgzLjUzYy0uOTcxIDAtMS44OTQtLjQyMi0yLjUyOS0xLjE1N2wtLjAyNi0uMDNBNCA0IDAgMCAxIDAgMjguMTk4VjguNjA3QTQgNCAwIDAgMSAuOTc0IDUuOTlMMSA1Ljk2YTMuMzQzIDMuMzQzIDAgMCAxIDIuNTI5LTEuMTU2aDIuNTM0YTIgMiAwIDAgMCAxLjUzNy0uNzJMMTAuNC43MkEyIDIgMCAwIDEgMTEuOTM3IDBoOC4xMjZBMiAyIDAgMCAxIDIxLjYuNzJsMi44IDMuMzYzYTIgMiAwIDAgMCAxLjUzNy43MmgyLjUzNGMuOTcxIDAgMS44OTQuNDIzIDIuNTI5IDEuMTU3bC4wMjYuMDNBNCA0IDAgMCAxIDMyIDguNjA2djE5LjU5MWE0IDQgMCAwIDEtLjk3NCAyLjYxN2wtLjAyNi4wM0EzLjM0MyAzLjM0MyAwIDAgMSAyOC40NzEgMzJ6TTE2IDkuNmE4IDggMCAxIDEgMCAxNiA4IDggMCAwIDEgMC0xNnptMCAxMi44YzIuNjQ3IDAgNC44LTIuMTUzIDQuOC00LjhzLTIuMTUzLTQuOC00LjgtNC44YTQuODA1IDQuODA1IDAgMCAwLTQuOCA0LjhjMCAyLjY0NyAyLjE1MyA0LjggNC44IDQuOHoiLz4KPC9zdmc+Cg==);
			    margin-bottom: 1rem;
			}
			.fJxKeH2 {
			    width: 100%;
			    height: 100%;
			    position: absolute;
			    top: 0px;
			    left: 0px;
			    opacity: 0;
			    cursor: pointer;
			    font-size: 0px;
			}
			.fJxKeH {
			    width: 202px;
			    height: 202px;
			    position: relative;
			    border: 1px solid rgb(230, 229, 239);
			    background: rgb(250, 250, 253);
			    display: flex;
			    -webkit-box-align: center;
			    align-items: center;
			    -webkit-box-pack: center;
			    justify-content: center;
			    flex-direction: column;
			    color: rgb(155, 153, 169);
			    font-size: 1rem;
			    margin-right: 1rem;
			    margin-bottom: 1rem;
			}
			
    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<div class="addcontainer">
			<template>
				<h1>상품 이미지(최대 4장)</h1>
				<ul class="sc-giOsra cXVdux">
					<li class="sc-SFOxd gDZtN">
					이미지 등록
					<input type="file" class="fJxKeH2" @change="updateImages" id="file1" name="file1" accept="image/*" multiple/>
					</li>
					</ul>
				<div class="preview">
					<label v-for="(image, index) in previewImages" :key="index" class="addspan">
						<img :src="image" alt="Image Preview" class="preview-img"/>
						<input type ="radio" v-model = "selectItem" v-bind:id = "'radio_' + index" 
						v-bind:value="index" @click="fnSelectThumbnail" ></input>
					</label>
				</div>
					<button v-bind:disabled="previewImages == 0" @click="removeImage" class="cancelBtn">삭제</button>
					<span class="an">대표 사진을 선택해주세요.</span>
			</template>
			
			
			<hr>
			<div>
				<h1>제목</h1>
				<input type="text" maxlength="30" class="addinput" v-model="bTitle" placeholder=" 30글자까지 입력가능">
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
				<input type="text" class="addinput" @input="validatePrice" maxlength="8" v-model="pPrice" style="width: 100px;" placeholder=" ex)10000"> <span>원</span>
				<hr>
			</div>
			<div>
				<h1 style="display: block;">게시글 내용</h1>
				<textarea name="" id="" cols="85" rows="10" maxlength="300" placeholder=" 300글자까지 입력가능" v-model="bContent"></textarea>
				<hr>
			</div>
			<div style = "display : flex;">
				<button @click="fnSave" class="addbutton" type="submit">등록하기</button>
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
	    , imgLength : 0
    }  
    , methods: {
		updateImages(event) {
			var self = this;
			const files = event.target.files;
			
			self.imgLength = 0;
			files.length = 0;
			this.previewImages.splice(self.thumbnail, 4);
			this.saveImgFile.splice(self.thumbnail, 4);
			
			if((self.imgLength + files.length) > 4){
				alert("사진은 최대 4장까지만 등록가능합니다.");
				
				if(self.imgLength == 0){
					$('#file1').val('');
				} else {
					for(var i=self.imgLength+1; i <= self.imgLength + files.length; i++){
						const dataTransfer = new DataTransfer();
					    let files = $('#file1')[0].files;	//사용자가 입력한 파일을 변수에 할당
					    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
					    fileArray.splice(i, 1);	//해당하는 index의 파일을 배열에서 제거
					    fileArray.forEach(file => { dataTransfer.items.add(file); });
					    $('#file1')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
					}
				}
				return;
			} else {
				self.imgLength += files.length;
			}
			for (const file of files) {
				this.saveImgFile.push(file);
				this.previewImages.push(URL.createObjectURL(file));
			}
    	}
		, removeImage() {
			var self = this;
    		this.previewImages.splice(self.thumbnail, 1);
    		this.saveImgFile.splice(self.thumbnail, 1);
    		const dataTransfer = new DataTransfer();
		    let files = $('#file1')[0].files;	//사용자가 입력한 파일을 변수에 할당
		    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
		    fileArray.splice(self.thumbnail, 1);	//해당하는 index의 파일을 배열에서 제거
		    fileArray.forEach(file => { dataTransfer.items.add(file); });
		    $('#file1')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
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
   			       , address : self.si + " " + self.gu +" "+ self.dong
   			       , price : self.pPrice, id : self.userId};
    		console.log(self.img);
    		
    	    if(!fileCheck || !self.bTitle || !self.bContent ||
    	       !self.pPrice || !self.si || (self.si != "세종특별자치시" && !self.gu) || !self.dong ) {
    	    	if(!fileCheck){
	    	    	alert("사진을 선택해주세요.");
	    	    	return;
    	    	}
    	    	if(!self.bTitle){
	    	    	alert("제목을 입력해주세요.");
	    	    	return;
    	    	}
    	    	if(!self.si || (self.si != "세종특별자치시" && !self.gu) || !self.dong){
	    	    	alert("시, 구, 동을 모두 선택해주세요.");
	    	    	return;
    	    	}
    	    	if(!self.pPrice){
	    	    	alert("가격을 입력해주세요.");
	    	    	return;
    	    	}
    	    	if(!self.bContent){
	    	    	alert("내용을 입력해주세요.");
	    	    	return;
    	    	}
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
		       	     	form.append( "userId",  self.userId);
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
		, fnSelectThumbnail : function(event, index){
			var self = this;
	   		self.thumbnail = event.srcElement.id.replace('radio_', '');
	   		console.log(self.thumbnail);
		}
		,validatePrice() {
    		let pattern = /^[0-9]+$/
	    	      this.pPrice = this.pPrice.match(pattern) ? this.pPrice : this.pPrice.slice(0, -1)
    	}
	}   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});
</script>
