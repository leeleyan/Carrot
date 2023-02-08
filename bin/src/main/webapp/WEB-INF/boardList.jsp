<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>Insert title here</title>
</head>
<style>
   td{
        border-top : 1px solid black;
        font-size: 20px;
        text-align: center;
        padding : 6px;
    }
</style>
<body>
	<div id="app">
		<div class="table-list">
	        <table>                   
	            <thead>
	                <tr>        
	                    <th scope="col"></th>      
	                    <th scope="col">No.</th>                 
	                    <th scope="col">제목</th>
	                    <th scope="col">조회수</th>
	                    <th scope="col">작성일</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr v-for="(item, index) in list" >                            
	                    <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                    <td><label v-bind:for="'idx_' + index">{{item.boardIdx}}</label></td> 
	                    <td><label v-bind:for="'idx_' + index">{{item.title}}</label></td> 
	                    <td><label v-bind:for="'idx_' + index">{{item.hitCnt}}</label></td>
	                    <td><label v-bind:for="'idx_' + index">{{item.createdDatetime}}</label></td>
	                </tr>
	            </tbody>                   
	        </table>
	    </div> 
	    <button @click="fnRemove">test</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] // 전체 데이터 리스트
       , selectedItemList : []
    }   
    , methods: {
        fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                console.log(data.test1);
	                console.log(data.test2);
	                console.log(self.list);    
                }
            }); 
        }  
    	, fnRemove : function(){
    		 var self = this;
           	 var nparmap = {boardNum : 14};
             $.ajax({
                 url:"/remove.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {            
                	 alert("삭제되었습니다.");
                	 self.fnGetList();
                 }
             }); 
    	}
    }   
    , created: function () {
		this.fnGetList();       
	}
});
</script>