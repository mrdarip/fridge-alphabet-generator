generateChar("A", 10, "Arial", 10, [0, 0], 3, 3); // Generate the letter A

module generateChar(
    char = "A",
    fontSize = 10,
    font = "Arial",
    charThickness = 10,
    magnetOffset = [0, 0],
    magnetDiameter = 3,
    magnetHeight = 3,
){
    if(charThickness < magnetHeight){
        echo("Error: charThickness must be greater than magnetHeight");
    }else{
        echo("Generating character: ", char);

        linear_extrude(height = charThickness){
            text(text = char, size = fontSize, font = font);
        }
    }
}