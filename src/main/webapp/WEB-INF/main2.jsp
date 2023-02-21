<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="js/vue.js"></script>  
	<jsp:include page="/layout/marketheader.jsp"></jsp:include>
	<style>
      body{
        justify-content: center;
      }
      .container{
      	margin: auto;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        width: 1010px;
        margin-top: 50px;
        margin-bottom: 20px;
      }
      .container2{
      width: 100%;
     	 border: 1px solid rgb(200, 200, 200);
      }
      .productDetails{
        width: 230px;
        height: 270px;
        padding: 5px;
        margin: 5px;
        cursor: pointer;
        margin-bottom: 15px;
      }
      
      .imgDiv{
        width: 100%;
        height: 200px;
        background-color: aquamarine;
        border: 1px solid rgb(200, 200, 200);
      }
      
      .itemimg{
		width: 100%;
		height: 100%
      }
      
      .title{
    	    font-size: 16px;
		    letter-spacing: -0.02px;
		    color: #212529;
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    margin-bottom: 4px;
		    line-height: 1.5;
		    font-weight: normal;
      }
      .price{
	        font-size: 15px;
			font-weight: 700;
			line-height: 1.5;
		    margin-bottom: 4px;
      }
      .address{
   	        font-size: 13px;
		    color: #212529;
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    margin-bottom: 4px;
		    line-height: 1.5;
      }
      .head-title {
	    font-size: 32px;
	    font-weight: 600;
	    letter-spacing: -0.6px;
	    text-align: center;
	    color: #212529;
	    margin-bottom: 40px;
	  }
      .selectAddress{
      	justify-content: center;
      	padding-left: 600px;
        display: flex;
        flex-direction: start;;
      }

      #app{
        margin-top: 30px;
      }
      .form-control{
        height: 40px;
        font-size: 20px;
      }
    </style>
  </head>
  <body>
    <div id="app">
    <h1 class="head-title" id="hot-articles-head-title">
      {{si}} {{gu}} {{dong}} 중고거래 최신매물
  	</h1>
      <div class="selectAddress">
        <div>
          <label for="si" class="control-label"></label> 
          <select id="si"	v-model="si" class="form-control" @change="fnGuList(); fnDongList(); fnSearch1();" style="margin-left: 19px;">
            <option value="">시 선택</option>
            <option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
          </select>
        </div>
        <div>
          <label for="gu" class="control-label"></label> 
          <select	id="gu" v-model="gu" class="form-control" @change="fnDongList(); fnSearch2();">
            <option value="">구 선택</option>
            <option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
          </select>
        </div>
        <div>
          <label for="dong" class="control-label"></label> 
          <select	id="dong" v-model="dong" class="form-control" @change="fnSearch3">
            <option value="">동 선택</option>
            <option v-for="item in dongList" v-bind:value="item.dong">{{item.dong}}</option>
          </select>
        </div>
      </div>
        <div class="container">
            <div class="product" v-for="(item, index) in list">
              <div class="productDetails" @click="fnViewItem(item)">
                <div class="imgDiv"><img :src="item.img" @error="handleImgError" class="itemimg"></div>  
             	<div class="container2">
               	 <div class="title">{{item.bTitle}}</div>
               	 <div class = "price">{{item.pPrice}}원</div>
               	 <div class = "address">{{item.uAddress}}</div>
               </div>
              </div>
              </div>
            </div>
        </div>
    </div>
    <mainsetfooter>
	<jsp:include page="/layout/marketfooter.jsp"></jsp:include>
	</mainsetfooter>
  </body>
  
</html>
<script type="text/javascript">
  var app = new Vue({ 
      el: '#app',
    data: {
      list : [],
      siList : ${siList},
	  guList : ${guList},
	  dongList : ${dongList},
	  si : "",
	  gu : "",
	  dong : "",
	  userNickName : "${userNickName}",
	  userId : "${userId}", 
	  boardIdx : ""
    }, 
      methods: {
    	fnGetList : function(item){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/main/view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                console.log(self.list);
                }
            }); 
        },
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
        },
    	fnDongList : function(){
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
        },
    	 
    	handleImgError(event) {
        	event.target.src = "/img/default.jpg"; 
        },
    	
    	fnViewItem : function(item){
     		var self = this;
     		self.pageChange("/productdetails.do", {boardIdx : item.boardIdx});
     	},
        pageChange : function(url, param) {
	        var target = "_self";
	        if(param == undefined){
	        //   this.linkCall(url);
	           return;
	        }
	        var form = document.createElement("form"); 
	        form.name = "dataform";
	        form.action = url;
	        form.method = "post";
	        form.target = target;
	        for(var name in param){
	          var item = name;
	          var val = "";
	          if(param[name] instanceof Object){
	             val = JSON.stringify(param[name]);
	          } else {
	             val = param[name];
	          }
	          var input = document.createElement("input");
	           input.type = "hidden";
	           input.name = item;
	           input.value = val;
	           form.insertBefore(input, null);
	        }
	        document.body.appendChild(form);
	        form.submit();
	        document.body.removeChild(form);
	    },
        
	    fnSearch1 : function(){
	        var self = this;
	        var nparmap = {keyword : self.si};
	        $.ajax({
	            url:"/search.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.list = data.list;
	            }
	        }); 
	    },
	    
	    fnSearch2 : function(){
	        var self = this;
	        var nparmap = {keyword : self.si + " " + self.gu};
	        $.ajax({
	            url:"/search.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.list = data.list;
	            }
	        }); 
	    },
	    
	    fnSearch3 : function(){
	        var self = this;
	        var nparmap = {keyword : self.si + " " + self.gu + " " + self.dong};
	        $.ajax({
	            url:"/search.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.list = data.list;
	            }
	        }); 
	    },
      
    }, 
    created: function () {
      var self = this;
      self.fnGetList();
    }
  });
  </script>