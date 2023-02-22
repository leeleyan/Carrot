<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<jsp:include page="/layout/logoheader.jsp"></jsp:include>
<title>마켓이름 : 쪽지화면</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
}

.board {
	width: 800px;
	height: 330px;
	background-color: #EEEFF1;
	border-radius: 5px;
	overflow: auto;
}

td {
	border: solid red 1px;
}

th {
	border: solid green 1px;
}

.sendOrReceive {
	display: flex;
	justify-content: center;
}

.container {
	border: solid black 5px;
	margin: auto;
	text-align: center;
	width: 800px;
}

.menu {
	border: solid greenyellow 4px;
}

.btn {
	background-color: transparent; /*버튼 배경 제거*/
	cursor: pointer; /*버튼 활성화*/
	outline: none; /* 테두리의 두께에 따라 주변 레이아웃을 변형X */
	border: none; /*버튼 테두리 제거*/
}

.deleteAndWrite {
	text-align: right;
}

body {
	padding-bottom: 50px;
}
</style>
</head>
<body>
	<div id="app" class="container">
		<jsp:include page="/layout/testmessage.jsp"></jsp:include>
		<div class="menu">
			<div class="sendOrReceive">
				<button class="btn" @click="fnGetList" >받은 쪽지함</button>
				<button class="btn" @click="fnGetGotList">보낸 쪽지함</button>
			</div>
			<div class="deleteAndWrite">
				<button class="btn" @click="fnRemove">삭제</button>
				<button class="logobtn" @click="fnWrite">쪽지작성</button>
			</div>
		</div>
		<div class="board">
			<table class="board_list">
				<colgroup>
					<col width="5%" />
					<col width="15%" />
					<col width="*" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input type='checkbox' name='selectBoard'
							value='selectall' onclick='selectAll(this)' /></th>
						<th scope="col" v-if="flg == false">보낸 사람</th>
						<th scope="col" v-else="flg == true">받는 사람</th>
						<th scope="col">내용</th>
						<th scope="col">시간</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list">
						<td><input type="checkbox" name="selectBoard"
							v-bind:id="'idx_' + index" v-bind:value="item"
							v-model="selectedItemList"></td>
						<td v-if="flg == false">{{item.uSender}}</td>
						<td v-else="flg == true">{{item.uRecipient}}</td>
						<td @click="fnViewItem(item)" style="cursor: pointer">{{item.mContent.substr(0,
							30)}}{{item.mContent.length > 30 ? '...' : ''}}</td>
						<td>{{item.createDate}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<setfooter> <jsp:include page="/layout/marketfooter.jsp"></jsp:include>
</setfooter>
</html>
<script type="text/javascript">

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('selectBoard');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}

	var app = new Vue({
		el : '#app',
		data : {
			userNickName : "${userNickName}",
			list : [],
			mNo : "",
			selectedItemList : [],
			flg : false,
			messageflg : false
		},
		methods : {
			fnGetList : function() {
				var self = this;
				var nparmap = {
					nickname : self.userNickName
				};
				$.ajax({
					url : "/message/getmessage.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(self.list);
						self.flg = false;
						self.messageflg = false;
					}
				});
			},	
			fnGetGotList : function() {
				var self = this;
				var nparmap = {
					nickname : self.userNickName
				};
				$.ajax({
					url : "/message/getgotmessage.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(self.list);
						self.flg = true;
						self.messageflg = true;
					}
				});
			}
			,fnWrite : function() {
				window.open("./writing.do", "쪽지 쓰기", "width=555,height=580");
			},
			fnViewItem: function(item) {
				  var self = this;
				  var paramMap = {mNo: item.mNo};
				  console.log(paramMap);
				  window.close();
				  if(self.messageflg == false)
				  window.open("./send.do?mNo=" + paramMap.mNo, "받은 쪽지", "width=555,height=580");
				  else
				  window.open("./got.do?mNo=" + paramMap.mNo, "보낸 쪽지", "width=555,height=580");
			},
	    	fnRemove : function(){
	    		var self = this;
	    		if (confirm("쪽지를 정말 삭제하시겠습니까?")) {
	    		var list = JSON.stringify(self.selectedItemList);
	    		var nparmap = {"test" : "1",  "list" : list};
	             $.ajax({
	                 url:"/message/remove.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) {            
	                	 alert("삭제되었습니다.");
	                	 self.selectedItemList = [];
	                	 self.fnGetList();
	                 }
	             });  
	    	   }
	    	}
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>
