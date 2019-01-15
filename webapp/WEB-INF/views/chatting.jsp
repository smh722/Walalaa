<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>방송화면</title>
<style>
      .chat_log{ width: 95%; height: 200px; }
      .name{ width: 10%; }
      .message{ width: 70%; }
      .chat{ width: 10%; }
</style>


</head>
<body>

<div>
      <textarea id="chatLog" class="chat_log" readonly></textarea>
    </div>
    <form id="chat">
      <input id="name" class="name" type="text" readonly>
      <input id="message" class="message" type="text">
      <input type="submit" class="chat" value="chat"/>
    </form>
    <div id="box" class="box">
   <script src="http://192.168.1.11:82/socket.io/socket.io.js"></script>
   <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
   <script>
      $(document).ready(function() {
         var socket = io("http://192.168.1.11:82");

         $('#chat').on('submit', function(e){
             socket.emit('send message', $('#name').val(), $('#message').val());
             $('#message').val("");
             $("#message").focus();
             e.preventDefault();
           });
           socket.on('receive message', function(msg){
             $('#chatLog').append(msg+'\n');
             $('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
           });
           socket.on('change name', function(name){
             $('#name').val(name);
           });
      });
   </script>

</body>
</html>