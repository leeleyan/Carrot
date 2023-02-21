<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>주소 변경</title>
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
			table{
				width: 500px;
				font-size: 25px;
				border: solid 1px;
			}
			input{
				height: 35px;
			}
			.outerdiv{
				margin: auto; /*상.하.좌.우 가운데 정렬(바깥쪽 여백), width랑 같이 사용*/
	            width: 500px; /*좌.우 길이, 없으면 전체*/
	            height: auto;
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
				width: auto;
				height: 50px;
				font-size: 16px;
			}
			
    	</style>
	</head>

	<body>
		<div class="outerdiv" id="app">
			<div style="text-align: left;">
				<span>주소 변경</span>	
			</div>
			<table>
					<td>주소</td>
					<td colspan=2>
					
						<label for="si" class="control-label"></label> 
							<select id="si"	v-model="si" class="form-control" @change="fnGuList">
								<option value="">시 선택</option>
								<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
							</select>
						<label for="gu" class="control-label"></label> 
							<select	id="gu" v-model="gu" class="form-control" @change="fnDongList">
								<option value="">구 선택</option>
								<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
							</select>
						<label for="dong" class="control-label"></label> 
							<select	id="dong" v-model="dong" class="form-control">
								<option value="">동 선택</option>
								<option v-for="item in dongList" v-bind:value="item.dong">{{item.dong}}</option>
							</select> 
					</td>
					<td><button @click="fnUpdateAddress">변경하기</button></td>
				</tr>
			</table>
			<span><button @click="fnClose">닫기</button></span>
		</div>
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
	    , guFlg : false
	    , dongFlg : false
	 	, userId : "${userId}"
        , address: ""
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
       }
	, fnUpdateAddress : function(){
 		var self = this;
      	var nparmap = { id : self.userId, address : self.si +" "+ self.gu +" "+ self.dong};
      	if(!self.si || !self.gu || !self.dong){
      		alert("모든 주소를 입력해주세요.");
      	} else{
      		$.ajax({
                url:"/addresschange/updateaddress.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {            
               	 	alert("주소가 변경되었습니다.");
               	 	opener.location.replace("myinformation.do")
               	 	window.close();
                }
            }); 
    		}
      	}, fnClose : function(){
			window.close();
      	}
    
		}
    , created: function () {
	}
});

</script>


