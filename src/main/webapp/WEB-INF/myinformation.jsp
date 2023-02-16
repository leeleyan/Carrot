<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>마켓이름 : 상품정보</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }
			#ebtn{
				font-size: 20px;
				float: right; 
			}
			span{
				font-size: 40px;
			}
			
			select{
				font-size: 25px;
			}
			table{
				width: 800px;
				font-size: 25px;
				border: solid 1px;
			}
			input{
				height: 35px;
			}
			.outerdiv{
				margin: auto; /*상.하.좌.우 가운데 정렬(바깥쪽 여백), width랑 같이 사용*/
	            width: 800px; /*좌.우 길이, 없으면 전체*/
	            height: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px; /*모서리 부분 원의 형태로 바꿔줌*/
	            text-align: center; /*하위 요소 가운데 정렬*/
	            padding: 20px; 
			}
			table, td{
				border-collapse: collapse;
				border: solid 1px;
			}
			button{
				
				font-size: 25px;
			}
			
			select{
				width: 80px;
				height: 50px;
				font-size: 16px;
			}
			
    	</style>
	</head>

	<body>
		<div class="outerdiv" id="app">
			<div style="text-align: left;">
				<span>회원정보</span>	
				<button id="ebtn" @click="fnUnregister" >회원탈퇴</button>
			</div>
			<table>
				<tr>
					<td>아이디</td>
					<td colspan="2">{{userId}}</td>
					<td colspan="2">전화번호</td>
					<td>{{tel}}</td>
					<td><button @click="fnUpdateTel">변경</button></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan=2>{{name}}</td>
					<td>이메일</td>
					<td colspan="2">{{email}}</td>
					<td><button @click="fnEditEmail">변경</button></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>{{nickname}}</td>
					<td><button @click="fnEditNick">변경</button></td>
					<td>주소</td>
					<td colspan=2>
					{{address}}
					</td>
					<td><button onclick="window.open('addresschange.do','_blank', 'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+', width=660px,height=430px');">변경</button></td>
				</tr>
				<tr>
				<td>비밀번호</td>
				<td><button onclick="window.open('passwordchange.do','_blank', 'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+', width=660px,height=430px');">변경</button></td>
				</tr>
				
			</table>
			<span><button @click="fnHome" class="addbutton" >돌아가기</button></span>
		</div>
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	 isNameEdit: false
        , isEmailEdit: false
        , siList : ${siList}
	    , guList : ${guList}
	    , dongList : ${dongList}
	    , si : ""
	    , gu : ""
	    , dong : ""
	    , guFlg : false
	    , dongFlg : false
	    , nickname : ""
	 	, userId : "${userId}"
 		, name: ""
        , tel: ""
        , address: ""
        , email: ""
    }   
    , methods: {
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
        fnGetInfo : function(){
   			var self = this;
            var nparmap = {id : self.userId};
	           $.ajax({
	               url:"/myinfo/get.dox",
	               dataType:"json",	
	               type : "POST", 
	               data : nparmap,
	               success : function(data) {  
	            	   self.name = data.name;
	            	   self.nickname = data.nickname;
	            	   self.password = data.password;
	            	   self.tel = data.tel;
	        	       self.address = data.address;
	        	       self.email = data.email;
	               }
	           }); 
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
    
	 , fnUnregister : function(){
		var self = this;
		self.pageChange("./unregister.do", {});
	 }
	 ,fnUpdateTel : function(){
 		var self = this;
 		var newTel = prompt("새 전화번호를 입력해주세요.");
 		  if (newTel != null) {
 		    self.tel = newTel;
 		  }else {
 			  alert("취소되었습니다.")
 			  return;
 		  }

      	var nparmap = { id : self.userId, tel : self.tel};
        $.ajax({
            url:"/myinfo/updatetel.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {            
           	 	alert("저장되었습니다..");
            }
        }); 
		}
    ,fnEditNick : function(){
 		var self = this;
 		var newNick = prompt("새 닉네임을 입력해주세요.");
 		  if (newNick != null) {
 			  self.nickname = newNick;
 		  }else {
 			  alert("취소되었습니다.")
 			  return;
 		  }
      	var nparmap = { nickname : self.nickname };
        $.ajax({
            url:"/join/nicknamecheck.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {            
            	if(data.num > 0){
            		alert("이미 사용중인 닉네임입니다.")
            		return;
            	}else {
            		var nparmap = { id : self.userId, nickname : newNick};
                    $.ajax({
                        url:"/myinfo/editNickName.dox",
                        dataType:"json",	
                        type : "POST", 
                        data : nparmap,
                        success : function(data) {            
                       	 	alert("변경되었습니다..");
                        }
                    });
            	}
            }
        }); 
		}
    ,fnEditEmail : function(){
 		var self = this;
 		var originalEmail = self.email;
 		var newMail = prompt("새 메일주소를 입력하세요.");
 		  if (newMail != null) {
 		    self.email = newMail;
 		  }else {
 			  alert("취소되었습니다.")
 			  return;
 		  }

      	var nparmap = {email : self.email};
        $.ajax({
            url:"/join/emailcheck.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {            
            	if(data.num > 0){
            		alert("이미 사용중인 이메일입니다.")
            		self.email = originalEmail;
            		return;
            	}else {
            		var nparmap = { id : self.userId, email : self.email};
                    $.ajax({
                        url:"/myinfo/editEmail.dox",
                        dataType:"json",	
                        type : "POST", 
                        data : nparmap,
                        success : function(data) {
                       	 	alert("변경되었습니다..");
                        }
                    });
            	}
            }
        }); 
		}
    , fnHome : function(){
		location.href="/main.do";
	}
    }
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});

</script>


