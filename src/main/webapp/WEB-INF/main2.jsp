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
      }
      .productDetails{
        width: 230px;
        height: 270px;
        padding: 5px;
        margin: 5px;
        cursor: pointer;
      }
      
      .imgDiv{
        width: 220px;
        height: 200px;
        background-color: aquamarine;
      }
      
      .itemimg{
		width: 100%;
		height: 100%
      }
      
      .price{
    	  text-align: center;
      }
      .title{
    	  text-align: center;
      }
      .address{
    	  text-align: center;
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
      <div class="selectAddress">
        <div>
          <label for="si" class="control-label"></label> 
          <select id="si"	v-model="si" class="form-control" @change="fnGuList(); fnSearch1();" style="margin-left: 19px;">
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
                <div class="title">{{item.bTitle}}</div>
                <div class = "address">{{item.uAddress}}</div>
                <div class = "price">{{item.pPrice}} 원</div>
              </div>
            </div>
        </div>
    </div>
  </body>
</html>
<script type="text/javascript">
  var app = new Vue({ 
      el: '#app',
    data: {
      list : [],
      list2 : [],
      siList : ${siList},
	  guList : ${guList},
	  dongList : ${dongList},
	  si : "",
	  gu : "",
	  dong : "",
	  guFlg : false,
	  dongFlg : false,
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
	                self.list2 = data.list2;
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
	                console.log(self.list);
	                console.log(si);
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
	                console.log(self.list);
	                console.log(si);
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
	                console.log(self.list);
	                console.log(si);
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