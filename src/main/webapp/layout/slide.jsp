<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>slide images</title>
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
    #index_01{
    width: 1200px;
    margin: 0 auto;
}

#header1{
    height: 100px;
    border-bottom: 1px solid dimgrey;
    box-sizing: border-box;
    text-align: center;
    line-height: 100px;
    font-size: 1.5rem;
}

#slide1{
    height: 355px;
    overflow: hidden;
    margin-top: 30px;
}
#slide1>ul{
    width: 9999999px;
    font-size: 0;
    padding-inline-start: 0px;
}
#slide1>ul>li{
    display: inline-block;
    font-size: 0;
}
    </style>
</head>
<body>
 <div id="index_01">
        <div id="slide1">
            <ul>
                <li><a href="#"><img src="img/slideimg1.jpg" alt="슬라이드1"></a></li>
                <li><a href="#"><img src="img/slideimg3.jpg" alt="슬라이드2"></a></li>
                <li><a href="#"><img src="img/slideimg2.jpg" alt="슬라이드3"></a></li>
            </ul>
        </div>
    </div>
</body>
</html>

<script type="text/javascript">

setInterval(function(){
    $('#slide1>ul').delay(2500);
    $('#slide1>ul').animate({marginLeft: "-1200px"})
    $('#slide1>ul').delay(2500);
    $('#slide1>ul').animate({marginLeft: "-2400px"})
    $('#slide1>ul').delay(2500);
    $('#slide1>ul').animate({marginLeft: "0px"})
});
var app = new Vue({ 
	el: '#app2',
    data: {

   }   
    , methods: {
   
    }    
    , created: function () {
    
	}
});
</script>
