<!DOCTYPE html>  
<html xmlns="http://www.w3.org/1999/xhtml">  
   
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>Java API for WebSocket (JSR-356)</title>  
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>  
<script type="text/javascript">
var URL = "ws://localhost/WebSocket/ws";  
var websocket;  
   
$(document).ready(function(){  
    connect();    
});  
   
function connect(){  
        websocket = new WebSocket(URL);  
        websocket.onopen = function(evnt) { onOpen(evnt) };  
        websocket.onmessage = function(evnt) { onMessage(evnt) };  
        websocket.onerror = function(evnt) { onError(evnt) };  
}  
function sendMessage() {  
    websocket.send($("#message").val());  
    $("#message").val('')
}  
function onOpen() {  
    updateStatus("connected")  
}  
function onMessage(evnt) {  
    if (typeof evnt.data == "string") {  
   
        $("#received_messages").append(  
                        $('<tr/>')  
                        .append($('<td/>').text(evnt.data.substring(evnt.data))));  
    }   
}  
function onError(evnt) {  
    alert('ERROR: ' + evnt.data);  
}  
function updateStatus(status){  
    if(status == "connected"){  
        $("#status").removeClass (function (index, css) {  
           return (css.match (/\blabel-\S+/g) || []).join(' ')  
        });  
        $("#status").text(status).addClass("label-success");  
    }  
}  
</script>
</head>  
<body>  
    <div class="container">  
        <div>  
            <span id="status" class="label label-important">Not Connected</span>   
        </div>      
        <br/>  
   
        <label style="display:inline-block">Message: </label><input type="text" id="message"  />  
      <button id="send" class="btn btn-primary" onclick="sendMessage()">Send</button>  
       
            <table id="received_messages" class="table table-striped">  
                <tr>  
                    <th>Message</th>  
                </tr>  
            </table>  
        </div>  
    </body>  
    </html>  
