const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
var currentChar = 0;
var charArray = [];

const distance = 120;
const padding = [20,20];

const ySize = 0.4 * distance;


var charImg = document.getElementById('char');
var outputTextarea = document.getElementById('output');

drawCanvas();

charImg.addEventListener('mousedown', function(e) {
    charArray.push(
        [
            characters[currentChar],
            getCursorUnitaryPosition(charImg, e).map(x => x * ySize)
        ]
    );

    console.log(charArray[charArray.length - 1]);
    
    if(currentChar < characters.length - 1){
        currentChar++;
        drawCanvas();
    } else
    {
        outputTextarea.value = JSON.stringify(charArray);
    }

})

function drawCanvas(){
    charImg.src = "./preview/" + characters[currentChar] + ".png";    
}

function getCursorUnitaryPosition(element, event) {
    const rect = element.getBoundingClientRect()
    const x = ((event.clientX - rect.left) / element.width) - 0.5 + padding[0] / ySize;
    const y = ((-(event.clientY - rect.top) / element.height) + 1) - 0.5 + padding[1] / ySize;
    console.log("x: " + x + " y: " + y);
    return [x, y];
}
