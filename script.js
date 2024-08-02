var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

ctx.fillStyle = "grey";
ctx.fillRect(0, 0, 500, 500);

//write letter "a"
ctx.fillStyle = "black";
ctx.font = "bold 500px Comic Sans MS";
ctx.fillText("Hello World",50,430);

function getCursorPosition(canvas, event) {
    const rect = canvas.getBoundingClientRect()
    const x = event.clientX - rect.left
    const y = event.clientY - rect.top
    console.log("x: " + x + " y: " + y)
}

canvas.addEventListener('mousedown', function(e) {
    getCursorPosition(canvas, e)
})

/*
For H top left corner
and H bottom right corner

should output
11.07, 20.86
32.10, 16.92

outputs
149, 242
337, 274
*/