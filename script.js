var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
const a = 0.0082550335570469798657718120805369127516778523489932885906040268;
const b = 0.0453305785123966942148760330578512396694214876033057851239669421;
const xOff = 9.84;
const yOff = 9.89;

ctx.fillStyle = "grey";
ctx.fillRect(0, 0, 500, 500);

//write letter "a"
ctx.fillStyle = "black";
ctx.font = "bold 500px Comic Sans MS";
ctx.fillText("Hello World",50,430);

function getCursorPosition(canvas, event) {
    const rect = canvas.getBoundingClientRect()
    const x = ((event.clientX - rect.left) - 149) /8.9 + 11.07
    const y = (-(event.clientY - rect.top)+481 -237)/17 +20.86
    console.log(x+", " + y)
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

199.07/ n = 32.10
    n = 199.07/32.10
    n = 6.20
 -14.14
*/