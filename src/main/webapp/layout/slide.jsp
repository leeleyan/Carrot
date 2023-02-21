<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/slide.css" type="text/css">
    <title>main</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<main id="main">
    <section id="sliderType01" style="margin-top: 50px;">
        <div class="slider__wrap">
            <div class="slider__img">
                <div class="slider__inner">
                    <div class="slider"><img src="img/slideimg1.jpg" alt="이미지1"></div>
                    <div class="slider"><img src="img/slideimg2.jpg" alt="이미지2"></div>
                    <div class="slider"><img src="img/slideimg3.jpg" alt="이미지3"></div>
                </div>
            </div>
            <div class="slider__btn">
                <a href="#" class="prev">prev</a>   
                <a href="#" class="next">next</a>
            </div>
        </div>
    </section>
</main>
</body>
</html>

<script type="text/javascript">
const sliderWrap = document.querySelector(".slider__wrap"); 
const sliderImg = document.querySelector(".slider__img");       //보여지는 영역
const sliderInner = document.querySelector(".slider__inner");   //움직이는 영역 
const slider = document.querySelectorAll(".slider");            //각각 이미지
const sliderBtn = document.querySelector(".slider__btn");    //버튼
const sliderBtnPrev = sliderBtn.querySelector(".prev");      //왼쪽버튼
const sliderBtnNext = sliderBtn.querySelector(".next");      //오른쪽버튼

let currentIndex = 0;                       //현재 이미지
let sliderCount = slider.length;            //이미지 갯수
let sliderWidth = sliderImg.offsetWidth;    //이미지 가로값


//이미지 움직이는 영역
function gotoSlider(num){
    sliderInner.style.transition = "all 400ms"
    sliderInner.style.transform = "translateX("+ -sliderWidth * num +"px)";
    currentIndex = num;
}

//왼쪽 버튼 클릭
sliderBtnPrev.addEventListener("click", ()=>{
    let prevIndex = (currentIndex + (sliderCount-1)) %  sliderCount
    gotoSlider(prevIndex);
    // 0,4,3,2,1..
    console.log(prevIndex);
});

//오른쪽 버튼 클릭
sliderBtnNext.addEventListener("click", ()=>{
    let nextIndex = (currentIndex + 1) % sliderCount;
    gotoSlider(nextIndex);
    // 0,1,2,3,4..
    console.log(nextIndex);
});


</script>
