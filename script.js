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
    const x = (event.clientX - rect.left) * a + xOff
    const y = (event.clientY - rect.top) * b + yOff
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

149 * a + x = 11.07
242 * a + y = 20.86
337 * a + x = 32.10
274 * a + y = 16.92

a = (11.07 - x) / 149
a = (20.86 - y) / 242
a = (32.10 - x) / 337
a = (16.92 - y) / 274

(11.07 - x) / 149 = (32.10 - x) / 337
    11.07 - x = 149 * (32.10 - x) / 337
    x = (4782.9 - 149x) / 337
    x = 4782.9 / 337 - 149x / 337
    x = 14.19 - 0.442x
    x + 0.442x = 14.19
    1.442x = 14.19
    x = 14.19 / 1.442
    x = 9.84


(20.86 - y) / 242 = (16.92 - y) / 274
    20.86 - y = 242 * (16.92 - y) / 274
    y = (5367.52 - 242y) / 274
    y = 5367.52 / 274 - 242y / 274
    y = 19.589 - 0.979757y
    y + 0.979757y = 19.589
    1.979757y = 19.589
    y = 19.589 / 1.979757
    y = 9.89

a = (11.07 - 9.84) / 149
a = 0,0082550335570469798657718120805369127516778523489932885906040268
a = (20.86 - 9.89) / 242
a = 0.0453305785123966942148760330578512396694214876033057851239669421

this is inconclusive...
*/