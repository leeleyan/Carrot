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
<link rel="stylesheet" href="css/messagemain.css" type="text/css">
</head>
<body>
	<div id="app" class="container">
	<div class="wrapper">
		<div class="nav">
			<h1>
				<a @click="fnMessage">쪽지</a>
			</h1>
			<ul id="NoteBoxMenu">
				<li class="active"><a @click="fnGetList">받은 쪽지함</a></li>
				<li><a @click="fnGetGotList">보낸 쪽지함</a></li>
			</ul>
			<a class="btWrite" @click="fnWrite">쪽지보내기</a>
		</div>
		<div id="contents" class="contents">
			<h2 v-if="flg == false">
				받은 쪽지함
			</h2>
			<h2 v-else="flg == true">
				보낸 쪽지함
			</h2>
			<div class="btSecList">
				<a href="#" class="btDefault" id="aDelete" a2s="click" obj="MSG" @click="fnRemove"
					opt="{&quot;Name&quot;:&quot;receive&quot;,&quot;Type&quot;:&quot;delete&quot;}">
					<span>삭제</span>
				</a>
			</div>
			<div class="list listMessage">
				<table id="tblList" border="1">
					<colgroup>
						<col class="checkbox">
						<col class="cate">
						<col class="tit">
						<col class="date">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type='checkbox' name='selectBoard'
								value='selectall' onclick='selectAll(this)' /></th>
							<th scope="col" v-if="flg == false">보낸 사람</th>
							<th scope="col" v-else="flg == true">받는 사람</th>
							<th class="tit">내용</th>
							<th scope="col" v-if="flg == false">받은 날짜</th>
							<th scope="col" v-else="flg == true">보낸 닐짜</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(item, index) in list">
						<th scope="col"><input type="checkbox" name="selectBoard"
							v-bind:id="'idx_' + index" v-bind:value="item"
							v-model="selectedItemList"></th>
						<th scope="col" v-if="flg == false" @click="fnViewItem(item)" style="cursor: pointer">{{item.uSender}}</th>
						<th scope="col" v-else="flg == true" @click="fnViewItem(item)" style="cursor: pointer">{{item.uRecipient}}</th>
						<th scope="col" @click="fnViewItem(item)" style="cursor: pointer">{{item.mContent.substr(0,
							30)}}{{item.mContent.length > 30 ? '...' : ''}}</th>
						<th scope="col">{{item.createDate}}</th>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="pboardNavigation"></div>
		</div>
	</div>
	</div>
</body>
<setfooter> <jsp:include page="/layout/marketfooter.jsp"></jsp:include>
</setfooter>
</html>
<script type="text/javascript">


function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('selectBoard');	  
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
	        , fnMessage : function(){
	    		var self = this;
	    		self.pageChange("./message.do", {});
	    	} 
		},	
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>