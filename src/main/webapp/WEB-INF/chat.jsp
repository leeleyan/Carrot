<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
        <style>
            .container{
                width: 70%;
                border: solid gray 1px;
                display: flex;
                margin: auto;
            }
            .who{
                width: 37%;
                height: 700px;
                border: solid blue 1px;
                overflow-y: scroll;
            }
            
            .partner{
                width: cacl(100%-2px);
                height: 15%;
                border: solid red 1px;
            }

            .chatContainer{
                width: 100%;
                height: 700px;
                border: solid cyan 1px;
                overflow-y: scroll;
                display: flex;
                flex-direction: column;
                align-items: flex-end;
            }
            .men{
                width: 80%;
                height: fit-content;
                margin: auto;
                border: solid yellow 4px;
                margin-bottom: 20px;
            }
            .myNickName{
                border: solid blueviolet 1px;
            }

            .message{
                border: solid skyblue 1px;
                margin-left: 20px;
            }

        </style>
    </head>

    <body>
        <div class="container" id="app">
            <div class="who" v-on:wheel="handleWheel">
                <div class="partner"></div>
            </div>
            <div class="chatContainer" v-on:wheel="handleWheel">
                <div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div>
                <div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div><div class="men"> 
                    <div class="myNickName">MyNickName</div>
                    <div class="message">Message1</div>
                </div>
            </div>
        </div>
    </body>
</html>

<script type="text/javascript">
    
    var app = new Vue({ 
        el: '#app',
        data: {
            uId : ""
            ,uEmail : ""
        },
        mounted() {
            // Get the chat container element
            const chatContainer = this.$el.querySelector('.chatContainer');

            // Scroll the chat container to its maximum height
            chatContainer.scrollTop = chatContainer.scrollHeight;
            }   
        , methods: {
           
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

            handleWheel: function(event) {
                event.preventDefault(); // prevent page from scrolling

                // Determine direction of wheel scroll
                const direction = event.deltaY > 0 ? 1 : -1;

                // Get the .who element and its scrollTop property
                const whoElement = event.currentTarget;
                const scrollTop = whoElement.scrollTop;

                // Calculate the new scrollTop value based on the wheel event direction
                const newScrollTop = scrollTop + (direction * 60);

                // Set the .who element's scrollTop property to the new value
                whoElement.scrollTop = newScrollTop;

            }
        }   
        , created: function () {
        
        }
    });
</script>
    
