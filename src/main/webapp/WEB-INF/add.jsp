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
	
    	</style>
	</head>
	<body>
	<div id="app" class="div1">
		<template>
			<h1>상품 이미지</h1>
			<input type="file" @change="updateImages" multiple />
			<br><br>
			<div>
				<img v-for="(image, index) in previewImages" :key="index" :src="image" alt="Image Preview" class="preview-img"/>
			</div>
		</template>
		<hr>
		<div>
			<h1>제목</h1><input type="text">
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
    }   
    , created: function () {
    
	}
});
</script>
