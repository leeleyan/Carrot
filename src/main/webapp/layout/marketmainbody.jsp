<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="maincss/mainbodyblank.css" type="text/css">
    <style>
      .container{
        margin: auto;
        margin-top: 50px;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: start;
        width: 1010px;
      }

      .item{
        width: 195px;
        border: solid 1px;
        height: 274px;
        margin-right: 5px;
        margin-bottom: 5px;
      }
      
    </style>
    <title>JS bin</title>
  </head>
  <body>
    <div class="container">
    	<thead>
    	<!-- <tr v-for="(item, index) in list"> -->
      	<div class="item">
      		<div class="imgarea">
				<img src="mainimg/testimg.jpg" width="195" height="180" alt="상품 이미지">
					<div class="imgset"></div>
					<div class="imgset2"></div>
      		</div>
      	<div class="imgtextarea">
      		<div class="imgnamearea">패딩</div>
      		<div class="imgpayandtimearea">
      		<div class="imgpaytext">
      				150000
      		</div>
      			<div class="imgtimetext">
      				<span>7시간 전</span>
      			</div>
      		</div>
      	</div>
      </div>
      <div class="item"></div>
      <div class="item"></div>
      <div class="item"></div>
      <div class="item"></div>
      <div class="item"></div>
      <div class="item"></div>
      <div class="item"></div>
      <div class="item"></div>
      <div class="item"></div>
      </tr>
    </div>
  </body>
</html>
<script type="text/javascript">
var app = new Vue({
	el : '#app',
	data : {
		list : [] 
       , selectedItemList : []
	},	
	methods : {
		fnList : function(){
            var self = this;
            var nparmap = {}; 
            $.ajax({
                url:"/main/getitem.dox",
                dataType:"json",	
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
		/*     	var self = this;
		    	self.fnList(); */
			}
}
</script>