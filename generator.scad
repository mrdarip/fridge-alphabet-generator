charactersAndPos=
[
  [
    "A",
    [
      25.481481481481477,
      15.851851851851851
    ]
  ],
  [
    "B",
    [
      11.703703703703706,
      5.925925925925928
    ]
  ],
  [
    "C",
    [
      31.703703703703706,
      12.962962962962965
    ]
  ],
  [
    "D",
    [
      11.703703703703706,
      6.1481481481481515
    ]
  ],
  [
    "E",
    [
      11.703703703703706,
      6.1481481481481515
    ]
  ],
  [
    "F",
    [
      11.777777777777779,
      13.925925925925927
    ]
  ],
  [
    "G",
    [
      32.51851851851852,
      14.296296296296298
    ]
  ],
  [
    "H",
    [
      28.444444444444443,
      16.37037037037037
    ]
  ],
  [
    "I",
    [
      11.555555555555557,
      38.37037037037037
    ]
  ],
  [
    "J",
    [
      19.11111111111111,
      31.925925925925924
    ]
  ],
  [
    "K",
    [
      11.62962962962963,
      20.962962962962962
    ]
  ],
  [
    "L",
    [
      11.703703703703706,
      6.074074074074077
    ]
  ],
  [
    "M",
    [
      23.11111111111111,
      9.703703703703706
    ]
  ],
  [
    "N",
    [
      29.629629629629633,
      8.666666666666664
    ]
  ],
  [
    "O",
    [
      21.555555555555557,
      32.74074074074075
    ]
  ],
  [
    "P",
    [
      11.703703703703706,
      19.62962962962963
    ]
  ],
  [
    "Q",
    [
      26.5925925925926,
      2.6645352591003757e-15
    ]
  ],
  [
    "R",
    [
      11.62962962962963,
      14.518518518518523
    ]
  ],
  [
    "S",
    [
      11.111111111111112,
      28.59259259259259
    ]
  ],
  [
    "T",
    [
      12.88888888888889,
      32.074074074074076
    ]
  ],
  [
    "U",
    [
      19.703703703703702,
      5.555555555555556
    ]
  ],
  [
    "V",
    [
      18.51851851851852,
      6.370370370370369
    ]
  ],
  [
    "W",
    [
      26.2962962962963,
      30.22222222222223
    ]
  ],
  [
    "X",
    [
      18.51851851851852,
      24.666666666666664
    ]
  ],
  [
    "Y",
    [
      18.51851851851852,
      21.925925925925924
    ]
  ],
  [
    "Z",
    [
      22.296296296296298,
      32
    ]
  ]
];

cylinder(d = 1, h=3, center=true, $fn=100);

charId = 0;
mDia = 3;
mH = 3;
mSides = 100;
fontName = "Arial";
echo("fontName: ", fontName);

generateChar(
    char = charactersAndPos[charId][0],
    fontSize = 40,
    font = concat(fontName,":style=Bold"),
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