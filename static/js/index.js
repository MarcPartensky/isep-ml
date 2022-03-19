const conv = document.getElementById('conversation')
const input = document.getElementById('input')



// form.onsubmit


// var socket = io();
// socket.on('connect', function() {
// 		socket.emit('add', {data: 'I\'m connected!'});
// });


// function emit() {
// 		socket.emit('add', {data: 'I\'m connected!'});
// }

function emit() {
	alert('emitted')
}

$('input').onkeyup(emit)
