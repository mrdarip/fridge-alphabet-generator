charactersAndPos=
[
    ["A", [20, 15]],
    ["B", [15, 20]],
    ["C", [24, 36.7]],
    ["D", [15, 36]],
    ["E", [20, 21]],
    ["F", [18, 23]],
    ["G", [18, 17]],
    ["H", [21.76443002780352, 19.109765625]],
    ["I", [14, 20]],
    ["J", [23, 19]],
    ["K", [9.3, 18.5]],
    ["L", [6.5, 19.5]],
    ["M", [24.3, 8.5]],
    ["N", [22, 18.53]],
    ["O", [23.5, 37.5]],
    ["P", [15, 19.4]],
    ["Q", [29.7, 37]],
    ["R", [15, 15]],
    ["S", [21.5, 20.7]],
    ["T", [17.5,36]],
    ["U", [19,1.7]],
    ["V", [17, 5.6]],
    ["W", [28,29]],
    ["X", [20,19]],
    ["Y", [14.6, 19]],
    ["Z", [16,19]]
];

charId = 7;

generateChar(
    char = charactersAndPos[charId][0],
    fontSize = 40,
    font = "Comic sans MS:style=Bold",
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

        if($preview){
            #linear_extrude(height = charThickness){
                    text(text = char, size = fontSize, font = font);
                }
                color("red") 
                translate([magnetOffset[0], magnetOffset[1],charThickness - magnetHeight/2+1])
                cylinder(d = magnetDiagonal, h=magnetHeight, center=true, $fn=magnetSides);
        }else{
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
}