<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/marketheader.jsp"></jsp:include>
		<title>마켓이름 : 내 정보</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
			#ebtn{
				font-size: 20px;
				float: right;
				height: 50px; 
				background-color: transparent;
			}
			#fbtn{
				font-size: 25px;
				height: 50px; 
				margin-top: 10px;
			}
			#gbtn{
				font-size: 25px;
				height: 100%;
				width: 100%;
				 
			}
			.infospan{
				font-size: 32px;
   			    font-weight: 600;
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
	            border-radius: 5px; /*모서리 부분 원의 형태로 바꿔줌*/
	            text-align: center; /*하위 요소 가운데 정렬*/
	            padding: 20px; 
	            margin-top: 50px; /* 헤더와 떨어진 길이 */
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
			.container{
      		margin: auto;
        	display: flex;
	        flex-direction: row;
	        flex-wrap: wrap;
	        width: 1010px;
	        margin-top: 20px;
	            
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
		  .head-title {
		    font-size: 32px;
		    font-weight: 600;
		    letter-spacing: -0.6px;
		    color: #212529;
		    margin-bottom: -35px;
		    margin-top: -35px;
		    margin-left: 10px;    
		  }	
	  	.top{
	  	    margin-bottom: 15px;
		}
    	</style>
	</head>

	<body>
		<div id="app">
			<div class="outerdiv">
			<div class="top" style="text-align: left;">
				<span class="infospan">회원정보</span>	
				<button id="ebtn" onclick="window.open('unregister.do','_blank', 'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-500)/2+', width=660px,height=500px');">회원탈퇴</button>
			</div>
			<table>
				<tr>
					<td>아이디</td>
					<td colspan="2">{{userId}}</td>
					<td colspan="2">전화번호</td>
					<td>{{tel}}</td>
					<td><button id="gbtn" @click="fnUpdateTel">변경</button></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan=2>{{name}}</td>
					<td>이메일</td>
					<td colspan="2">{{email}}</td>
					<td><button id="gbtn" @click="fnEditEmail">변경</button></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>{{userNickName}}</td>
					<td><button id="gbtn" @click="fnEditNick">변경</button></td>
					<td>주소</td>
					<td colspan=2>
					{{address}}
					</td>
					<td><button  id="gbtn" onclick="window.open('addresschange.do','_blank', 'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-500)/2+', width=660px,height=280px');">변경</button></td>
				</tr>
				<tr>
				<td>비밀번호</td>
				<td><button id="gbtn" onclick="window.open('passwordchange.do','_blank', 'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+', width=660px,height=430px');">변경</button></td>
				</tr>
				
			</table>
			<span><button id="fbtn" @click="fnHome" class="addbutton" >돌아가기</button></span>
			</div>
			<div class="container">
			<h1 class="head-title" id="hot-articles-head-title">
      			 나의 판매목록
  			</h1>
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
			<mainsetfooter>
	<jsp:include page="/layout/marketfooter.jsp"></jsp:include>
	</mainsetfooter>
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
         siList : ${siList}
	    , guList : ${guList}
	    , dongList : ${dongList}
	    , si : ""
	    , gu : ""
	    , dong : ""
	    , nickname : ""
	 	, userId : "${userId}"
	 	, userNickName : "${userNickName}"
 		, name: ""
        , tel: ""
        , address: ""
        , email: ""
        , list : []
        , newNick : ""
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
    
	 ,fnUpdateTel : function(){
 		var self = this;
 		var newTel = prompt("새 전화번호를 입력해주세요.");
 		  if (newTel != null) {
 			 const regex = new RegExp(/^[0-9]*$/); // regular expression that matches only Korean and English characters
	    	    if (!regex.test(newTel)) {
	    	    	alert("숫자만 입력가능합니다.");
	    	    	return;
	    	    } else{
 		    		self.tel = newTel;
	    	    }
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
	 
    ,fnEditNick: function() {
        var self = this;
        self.newNick = prompt("새 닉네임을 입력해주세요.");
        if (self.newNick == null) {
            alert("취소되었습니다.");
            return;
        }
        
        else if (self.newNick.length < 2 || self.newNick.length > 6) {
		    alert("닉네임은 2자 이상 6자 이하로 입력해주세요.");
		    return;
		}
        var nparmap = { nickname: self.newNick };
        $.ajax({
            url: "/join/nicknamecheck.dox",
            dataType: "json",
            type: "POST",
            data: nparmap,
            success: function(data) {
                if (data.num > 0) {
                    alert("이미 사용중인 닉네임입니다.");
                    return;
                } else {
                    var nparmap = { id: self.userId, beforeNickname: self.userNickName, nickname: self.newNick };
                    $.ajax({
                        url: "/myinfo/editNickName.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                            alert("변경되었습니다.");
	                            $.ajax({
	                                url: "/myinfo/updatenick.dox",
	                                dataType: "json",
	                                type: "POST",
	                                data: nparmap,
	                                success: function(data) {
	                                	self.userNickName = self.newNick;
	                                    self.fnGetMyList();
	                                }
	                                });
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
	},
	
	fnGetMyList : function(){
        var self = this;
        var nparmap = {userNickName : self.userNickName};
        $.ajax({
            url:"/main/myview.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {                                       
                self.list = data.list;
                console.log(self.list);
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
    	}
    }
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
    	self.fnGetMyList();
	}
});

</script>


