const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
var currentChar = 0;
var charArray = [];

const distance = 120;
const totalSize = 0.4 * distance;

var charImg = document.getElementById('char');
var outputTextarea = document.getElementById('output');

drawCanvas();

charImg.addEventListener('mousedown', function(e) {
    charArray.push(
        [
            characters[currentChar],
            getCursorUnitaryPosition(charImg, e).map(x => x * totalSize)
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

function drawCanvas(){
    charImg.src = "./preview/" + characters[currentChar] + ".png";    
}

function getCursorUnitaryPosition(element, event) {
    const rect = element.getBoundingClientRect()
    const x = ((event.clientX - rect.left) / element.width);
    const y = ((-(event.clientY - rect.top) / element.height) + 1);
    console.log("x: " + x + " y: " + y);
    return [x, y];
}
