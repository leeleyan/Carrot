<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/marketheader.jsp"></jsp:include>
		<title>마켓이름 : 상품정보</title>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
			.container{
				margin: auto;
				border: solid gray 1px;
				width: 1010px;
				margin-bottom: 20px;
      		}
			.little{
				display: inline;
			}
			.test{
				word-wrap:break-word;
				word-break:keep-all;
				font-size: 20px;
			}
			.content{
				margin-left: 50px;
				font-size: 25px;
			}
			.description{
				font-size: 20px;
			}
			.msgDiv{
				display: flex;
				justify-content: center;
				align-items: center;
				height: 100px;
			}
			.msg{
				width: 250px;
				height: 80px;
				font-size: 20px;
			}
			.imgDiv{
				width: 234px;
			    height: 250px;
			    border: 1px solid rgb(230, 229, 239);
			    margin-right: 1rem;
			    margin-bottom: 1rem;
			    display: inline-flex;
			}
			.nick{
				font-size: 25px;
				margin-left: 30px;
			}
			.sub{
				padding: 10px;
			}
			
			.deleteBtn{
				width: 200px;
				height: 60px;
				font-size: 20px;
			}
		  .recently{
			width: 120px;
			height: fit-content;
			position: fixed;
	    	top: 250px;
	    	right: calc(50% - 700px);
			border: solid lightgray 1px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
		  }
		  .recently_inner{
			padding: 5px;
			margin: 5px;
		  }
		  .miniImageDiv{
			  width: 95%;
			  height: 80px;
			  padding: 5px;
			  cursor: pointer;
			  border: solid lightgray 1px;
			  margin-top : 5px;
			  margin-right : 7px;
		  }
		  .itemimg{
			width: 100%;
			height: 100%
	      }
    	</style>
	</head>
	<body>
		<div id="app">
		<div class = container>
			<div>
				<div class="recently"v-if="reList.length>0" >
					<div class="recently_inner" >
						<div>
							<span>최근 본 상품<br><hr></span>
						</div>
						<div class="recently_image" v-for="(item, index) in reList">
							<div class="miniImageDiv" @click="fnViewItem(item)" >
								<img :src="item.img" class="itemimg">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
			<span class="imgDiv" v-for="(item, index) in list"><img :src="item.img" class="image"/></span>
			</div>
			<div class="sub">
				<h2 class="little">닉네임</h2>
				<span class="nick">{{info.uNickName}}</span><br>
			</div>
			<div class="sub">
				<h2 class="little">장소</h2>
				<span class="content">{{info.uAddress}}</span>
			</div>
			<hr>
			<div class="sub">
				<h2 class="little">제목</h2>
				<span class="content">{{info.bTitle}}</span>
			</div>
			<div class="sub">
				<h2 class="little">가격</h2>
				<span class="content">{{info.pPrice}} 원</span>
			</div>
			<div class="sub">
				<h2>내용</h2>
				<div class="test">{{info.bContent}}</div>
			</div>
			<div class="msgDiv" >
				<div v-if="info.uNickName != userNickName">
					<button class="msg" @click="fnWrite">
					판매자에게 쪽지 보내기
					</button>
				</div>
				<div v-if="info.uNickName == userNickName">
					<button class="deleteBtn" @click="fnDelete">게시물 삭제하기</button>
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
    	idx : "${map.boardIdx}",
    	userId : "${userId}",
    	userNickName : "${userNickName}",
    	info : {},
    	re : ${re},
    	reList : [],
    	list : []
    }   
    , methods: {
    	fnGetItem : function(){
            var self = this;
            var nparmap = {boardIdx : self.idx};
            $.ajax({
                url:"/product/details.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.product;
	                self.list = data.list;
                }
            }); 
        },
        
     	fnDelete : function(){
    		var self = this;
    		var nparmap = { boardIdx : self.idx };
    		if (confirm("정말 삭제하시겠습니까?")) {
             $.ajax({
                 url:"/product/delete.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {            
                	 alert("삭제되었습니다.");
                	 self.fnMain();
                 }
             });
    		}
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
	     
	     fnMain : function(){
	    		var self = this;
	    		self.pageChange("./main.do", {});
	    },
	    fnWrite : function(){
        	var self = this;
        	var reply = self.info.uNickName;
        	console.log(reply);
        	if(!self.userId){
        		alert("쪽지보내기는 로그인 후에 사용해주세요.");
        		return;
        	}
			window.open("./writing.do?recipient="+reply,"쪽지쓰기","width=555,height=580");
    	},
    	fnGetReList : function(item){
	        var self = this;
	        nparmap = {};
	        $.ajax({
	            url:"/main/recentlyview.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.reList = data.list;
	                console.log(self.re);
	                console.log(self.reList);
	            }
	        }); 
	    },
	    fnViewItem : function(item){
     		var self = this;
     		self.pageChange("/productdetails.do", {boardIdx : item.boardIdx});
     	}
    	
    }   
    , created: function () {
    	var self = this;
    	self.fnGetItem();
    	 if (self.re.length >= 1) {
             self.fnGetReList();
         }
    	
	}
}); 
</script>
