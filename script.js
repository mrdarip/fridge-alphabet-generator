const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
var currentChar = 0;
var charArray = [];

var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

var outputTextarea = document.getElementById('output');
var fontNameInput = document.getElementById('fontName');

drawCanvas();

canvas.addEventListener('mousedown', function(e) {
    charArray.push(
        [
            characters[currentChar],
            getCursorPosition(canvas, e)
        ]
    );
    
    if(currentChar < characters.length - 1){
        currentChar++;
        drawCanvas();
    } else
    {
        outputTextarea.value = JSON.stringify(charArray, null, 2);
    }

})

fontNameInput.addEventListener('input', function(e) {
    drawCanvas();
})

function drawCanvas(){
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    ctx.fillStyle = "grey";
    ctx.fillRect(0, 0, 500, 500);
    
    ctx.fillStyle = "black";
    ctx.font = "bold 600px " + fontNameInput.value;
    ctx.fillText(characters[currentChar],50,430);
    
}

function getCursorPosition(canvas, event) {
    const rect = canvas.getBoundingClientRect()
    const x = ((event.clientX - rect.left) - 77) / 10.79 + 2.58
    const y = ((-(event.clientY - rect.top) + 430) /384) * 35.45
    return [x, y];
}
