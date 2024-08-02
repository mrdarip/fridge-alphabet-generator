var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

ctx.fillStyle = "grey";
ctx.fillRect(0, 0, 500, 500);

//write letter "a"
ctx.fillStyle = "black";
ctx.font = "bold 500px Comic Sans MS";
ctx.fillText("Hello World",0,450);

function getCursorPosition(canvas, event) {
    const rect = canvas.getBoundingClientRect()
    const x = event.clientX - rect.left
    const y = event.clientY - rect.top
    console.log("x: " + x + " y: " + y)
}

canvas.addEventListener('mousedown', function(e) {
    getCursorPosition(canvas, e)
})