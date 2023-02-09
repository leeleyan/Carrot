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
				width: 120px;
				height: 50px;
				font-size: 20px;
			}
    	</style>
	</head>

	<body>
		<div class="outerdiv" id="app">
			<div style="text-align: left;">
				<span>회원정보</span>	
				<button onclick="window.open('unregister.do','_blank');" id="ebtn" >회원탈퇴</button>
			</div>
			<table>
				<tr>
					<td>아이디</td>
					<td colspan="2">아이디테스트</td>
					<td colspan="2">전화번호</td>
					<td>010-1111-1111</td>
					<td><button>변경</button></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" v-model="name" :disabled="!isNameEdit"></td>
					<td><button @click="changeName">{{ isNameEdit ? '확인' : '변경' }}</button></td>
					<td>이메일</td>
					<td colspan="2"><input type="text" id="emailText" disabled></td>
					<td><button>변경</button></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" disabled value="지금닉네임"></td>
					<td><button>변경</button></td>
					<td>주소</td>
					<td>
						<select onchange="categoryChange(this)" disabled>
				        	<option>지역 선택</option>
				            <option value="서울특별시">서울특별시</option>
				            <option value="부산광역시">부산광역시</option>
				            <option value="대구광역시">대구광역시</option>
				            <option value="인천광역시">인천광역시</option>
				            <option value="광주광역시">광주광역시</option>
				            <option value="대전광역시">대전광역시</option>
				            <option value="울산광역시">울산광역시</option>
				            <option value="세종특별자치시">세종특별자치시</option>
				            <option value="경기도">경기도</option>
				            <option value="강원도">강원도</option>
				            <option value="충청북도">충청북도</option>
				            <option value="충청남도">충청남도</option>
				            <option value="전라북도">전라북도</option>
				            <option value="전라남도">전라남도</option>
				            <option value="경상북도">경상북도</option>
				            <option value="경상남도">경상남도</option>
				            <option value="제주특별자치도">제주특별자치도</option></select>
    					</select>
					</td>
					<td>
						<select id="sigu" disabled>
    						<option>동네 선택</option>
    					</select>
					</td>
					<td><button>변경</button></td>
				</tr>
			</table>
		</div>
		
		
		
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    	, isNameEdit: false
        , isEmailEdit: false
    }   
    , methods: {
    	changeName: function() {
            this.isNameEdit = !this.isNameEdit;
        },
        changeEmail: function() {
            this.isEmailEdit = !this.isEmailEdit;
        }
    }   
    , created: function () {
    
	}
});
</script>

<script language='javascript'>
function categoryChange(e) {
    var good_a = ['전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'];
    var good_b = ['전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군'];
    var good_c = ['전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군'];
    var good_d = ['전체','남구','달서구','동구','북구','서구','수성구','중구','달성군'];
    var good_e = ['전체','광산구','남구','동구','북구','서구'];
    var good_f = ['전체','대덕구','동구','서구','유성구','중구'];
    var good_g = ['전체','남구','동구','북구','중구','울주군'];
    var good_h = ['전체', '가람동', '고운동', '금남면', '나성동', '다정동', '대평동', '도담동', '반곡동', '보람동', '부강면', '새롬동', '소정면', '아름동', '어진동', '연기면', '연동면', '연서면', '장군면', '전동면', '전의면', '조치원읍', '종촌동', '집현동', '한솔동', '해밀동'];
    var good_i = ['전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시'];
    var good_j = ['전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군'];
    var good_k = ['전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군'];
    var good_l = ['전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군'];
    var good_m = ['전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군'];
    var good_n = ['전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군'];
    var good_o = ['전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군'];
    var good_p = ['전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군'];
    var good_q = ['전체','서귀포시','제주시','남제주군','북제주군'];
    var target = document.getElementById("sigu");
    if(e.value == "서울특별시") var d = good_a;
    else if(e.value == "인천광역시") var d = good_b;
    else if(e.value == "부산광역시") var d = good_c;
    else if(e.value == "대구광역시") var d = good_d;
    else if(e.value == "광주광역시") var d = good_e;
    else if(e.value == "대전광역시") var d = good_f;
    else if(e.value == "울산광역시") var d = good_g;
    else if(e.value == "세종특별자치시") var d = good_h;
    else if(e.value == "경기도") var d = good_i;
    else if(e.value == "강원도") var d = good_j;
    else if(e.value == "충청북도") var d = good_k;
    else if(e.value == "충청남도") var d = good_l;
    else if(e.value == "전라북도") var d = good_m;
    else if(e.value == "전라남도") var d = good_n;
    else if(e.value == "경상북도") var d = good_o;
    else if(e.value == "경상남도") var d = good_p;
    else if(e.value == "제주특별자치도") var d = good_q;
    target.options.length = 0;
    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }
}
</script>