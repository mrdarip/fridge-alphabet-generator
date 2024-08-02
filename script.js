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
ctx.font = "bold 600px Consolas";
ctx.fillText("H",50,430);

function getCursorPosition(canvas, event) {
    const rect = canvas.getBoundingClientRect()
    const x = ((event.clientX - rect.left) - 77) / 10.79 + 2.58
    const y = ((-(event.clientY - rect.top) + 430) /384) * 35.45
    console.log(x+", " + y)
}

canvas.addEventListener('mousedown', function(e) {
    getCursorPosition(canvas, e)
})

/*
With consolas font

should be
2.58 0          27.97 0


is
77  -430            351  -430
*/