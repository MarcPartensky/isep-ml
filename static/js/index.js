const conv = document.getElementById('conversation')
const input = document.getElementById('input')

$('input').onkeyup()


// form.onsubmit


var socket = io();
socket.on('connect', function() {
		socket.emit('add', {data: 'I\'m connected!'});
});
