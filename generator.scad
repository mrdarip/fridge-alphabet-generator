charactersAndPos=
[
    ["A", [20, 15]],
    ["B", [0, 0]],
    ["C", [0, 0]],
    ["D", [0, 0]],
    ["E", [0, 0]],
    ["F", [0, 0]],
    ["G", [0, 0]],
    ["H", [0, 0]],
    ["I", [0, 0]],
    ["J", [0, 0]],
    ["K", [0, 0]],
    ["L", [0, 0]],
    ["M", [0, 0]],
    ["N", [0, 0]],
    ["O", [0, 0]],
    ["P", [0, 0]],
    ["Q", [0, 0]],
    ["R", [0, 0]],
    ["S", [0, 0]],
    ["T", [0, 0]],
    ["U", [0, 0]],
    ["V", [0, 0]],
    ["W", [0, 0]],
    ["X", [0, 0]],
    ["Y", [0, 0]],
    ["Z", [0, 0]]
];

charId = 0;

generateChar(
    char = charactersAndPos[charId][0],
    fontSize = 40,
    font = "Comic Sans MS:style=Bold",
    charThickness = 10,
    magnetOffset = charactersAndPos[charId][1],
    magnetDiagonal = 3,
    magnetHeight = 3,
    magnetSides=100
);



module generateChar(
    char = "A",
    fontSize = 10,
    font = "Arial",
    charThickness = 10,
    magnetOffset = [0, 0],
    magnetDiagonal = 3,
    magnetHeight = 3,
    magnetSides=4
){
    if(charThickness < magnetHeight){
        echo("Error: charThickness must be greater than magnetHeight");
    }else{
        echo("Generating character: ", char);

        difference() {
            linear_extrude(height = charThickness){
                text(text = char, size = fontSize, font = font);
            }
            color("red") 
            translate([magnetOffset[0], magnetOffset[1],charThickness - magnetHeight/2])
            cylinder(d = magnetDiagonal, h=magnetHeight, center=true, $fn=magnetSides);
        }
    }
}