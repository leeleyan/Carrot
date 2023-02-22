<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	 <link rel="icon" href="/img/favicon.ico">
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/logoheader.css" type="text/css">
		<style>
	        a {
    		color: rgb(33, 33, 33);
    		text-decoration: none;
    		cursor: pointer;
    		background-color: transparent;
			}		
		</style>
	</head>
<body style="margin: 0px;">
	<div id="app2">
		<div class="header">
			<div class="headfirst"> 
				<div class="headusermenu">
				<button class="logobtn" @click="fnMain">
				<img src="img/marketlogo.png" width="136px" height="40px">
				</button>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">

var app = new Vue({ 
    el: '#app2',
    data: {
    	 userNickName : "${userNickName}"
    	, userId : "${userId}"
    }   
    , methods: {
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
	     }
    		,fnMain : function(){
    		var self = this;
    		self.pageChange("./main.do", {});
    	}    
    }    
    , created: function () {
    
	}
});
</script>
