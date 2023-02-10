<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
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

			input{
				margin-left: 30px;
				width: 40em;
				height: 40px;
			}
			.container{
				margin-left: 10%;
				margin-right: 10%;
			}
			hr{
				margin-top: 15px;
				margin-bottom: 15px;
			}

			span{
				font-size: 25px;
				margin-left: 5px;
			}

			button{
				width: 220px;
				font-size: 30px;
				display: block;
				margin: auto;
			}

    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<div class="container">
			<template>
				<h1>상품 이미지</h1>
				<input type="file" @change="updateImages" multiple />
				<br><br>
				<div>
					<div v-for="(image, index) in previewImages" :key="index">
					<img :src="image" alt="Image Preview" class="preview-img"/>
					<button @click="removeImage(index)">Cancel</button>
				</div>
			</template>
			<hr>
			<div>
				<h1>제목</h1>
				<input type="text" placeholder="제목">
				<hr>
			</div>
			<div>
				<h1>거래 지역</h1>
				<hr>
			</div>
			<div>
				<h1>가격</h1>
				<input type="text" style="width: 100px;" placeholder="ex)10000"> <span>원</span>
				<hr>
			</div>
			<div>
				<h1 style="display: block;">게시글 내용</h1>
				<textarea name="" id="" cols="85" rows="10"></textarea>
				<hr>
			</div>
			<div>
				<button>등록하기</button>
			</div>
		</div>
	</div>	
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
	data: {
    	id : ""
    	, pwd : ""
		, previewImages : []
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
	}   
    , created: function () {
    
	}
});
</script>
