include <charsAndPos.scad>;

cylinder(h = 10, d = 10, center = true, $fn = 100);

charId = 0;
mDia = 3;
mH = 3;
mSides = 100;
fontName = "Arial";
echo("fontName: ", str(fontName,":style=Bold"));

generateChar(
    char = charactersAndPos[charId][0],
    fontSize = 40,
    font = str(fontName,":style=Bold"),
    charThickness =  2,
    magnetOffset = charactersAndPos[charId][1],
    magnetDiagonal = mDia,
    magnetHeight = mH,
    magnetSides = mSides
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
        difference() {
            linear_extrude(height = charThickness+magnetHeight){
                text(text = char, size = fontSize, font = font, $fn=200);
            }
            color("red") 
            translate([magnetOffset[0], magnetOffset[1],charThickness - magnetHeight/2])
            cylinder(d = magnetDiagonal, h=magnetHeight, center=true, $fn=magnetSides);
        }
}