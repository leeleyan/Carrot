<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>로그인</title>
		<style>
    	</style>
	</head>
	<body>
			로그인페이지
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    	, name : ""
    }   
    , methods: {
    	fnLogin : function(){
            var self = this;
            var nparmap = {id : self.id, password : self.pwd}; 
            $.ajax({
                url:"/login/get.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {     
                	if(data.result == "success"){
                		alert(data.list[0].name + "님 로그인 성공!!");
                		self.name = data.list[0].name;
                	} else {
                		alert("로그인 실패!!");
                	}
                }
            }); 
        }
	    , fnJoin : function(){
	    	var self = this;
	    	self.pageChange("/join.do", {id : self.id});
	    }
	    , fnFindInfo : function(){
	    	var self = this;
	    	self.pageChange("/find.do", {});
	    }
	    , pageChange : function(url, param) {
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
    }   
    , created: function () {
    
	}
});
</script>
