var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

ctx.fillStyle = "grey";
ctx.fillRect(0, 0, 500, 500);

//write letter "a"
ctx.fillStyle = "black";
ctx.font = "bold 500px Comic Sans MS";
ctx.fillText("Hello World",0,450);