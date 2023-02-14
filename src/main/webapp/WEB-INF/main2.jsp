<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="js/vue.js"></script>  
	<style>

      body{
        display: flex;
        justify-content: center;
      }
      .container{
        margin-top: 100px;
        display: flex;
        border: solid gray 1px;
        flex-direction: row;
        flex-wrap: wrap;
        width: 1010px;
      }
      .productDetails{
    	  border: solid red 1px;
        width: 230px;
        height: 270px;
        padding: 5px;
        margin: 5px;
      }
      
      .imgDiv{
        width: 220px;
        height: 200px;
        background-color: aquamarine;
      }
      
      img{
    	  width: 100%;
        height: 100%;
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
    </style>
  </head>
  <body>
    <div class="container" id="app">
        <div class="product" v-for="(item, index) in list">
          <div class="productDetails">
            <div class="imgDiv"><img :src="item.img"></div>  
            <div class="title">{{item.bTitle}}</div>
            <div class = "address">{{item.uAddress}}</div>
            <div class = "price">{{item.pPrice}} 원</div>
          </div>
        </div>
    </div>
  </body>
</html>
<script type="text/javascript">
  var app = new Vue({ 
      el: '#app',
    data: {
    	list : []
    }, 
      methods: {
    	fnGetList : function(){
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
        }  
    }, 
    created: function () {
      var self = this;
      self.fnGetList();
    }
  });
  </script>