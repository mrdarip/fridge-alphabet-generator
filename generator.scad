charactersAndPos=
[
  [
    "A",
    [
      27.510491195551438,
      3.8773437500000005
    ]
  ],
  [
    "B",
    [
      23.896033364226135,
      14.863151041666667
    ]
  ],
  [
    "C",
    [
      26.58370713623726,
      36.37317708333334
    ]
  ],
  [
    "D",
    [
      24.17406858202039,
      35.63463541666667
    ]
  ],
  [
    "E",
    [
      17.87193697868397,
      15.324739583333335
    ]
  ],
  [
    "F",
    [
      17.68658016682113,
      14.678515625000001
    ]
  ],
  [
    "G",
    [
      27.3251343836886,
      36.188541666666666
    ]
  ],
  [
    "H",
    [
      27.047099165894352,
      14.955468750000001
    ]
  ],
  [
    "I",
    [
      11.662483781278963,
      23.2640625
    ]
  ],
  [
    "J",
    [
      27.417812789620022,
      -4.800520833333334
    ]
  ],
  [
    "K",
    [
      22.87657089898054,
      15.601692708333335
    ]
  ],
  [
    "L",
    [
      12.21855421686747,
      -2.584895833333334
    ]
  ],
  [
    "M",
    [
      31.588341056533828,
      -2.3079427083333335
    ]
  ],
  [
    "N",
    [
      27.88120481927711,
      12.001302083333336
    ]
  ],
  [
    "O",
    [
      29.73477293790547,
      36.09622395833334
    ]
  ],
  [
    "P",
    [
      17.130509731232625,
      12.278255208333334
    ]
  ],
  [
    "Q",
    [
      24.54478220574606,
      35.726953125
    ]
  ],
  [
    "R",
    [
      22.227822057460614,
      13.939973958333335
    ]
  ],
  [
    "S",
    [
      24.7301390176089,
      15.694010416666668
    ]
  ],
  [
    "T",
    [
      23.061927710843378,
      34.98841145833333
    ]
  ],
  [
    "U",
    [
      27.88120481927711,
      -8.30859375
    ]
  ],
  [
    "V",
    [
      25.934958294717333,
      -5.169791666666668
    ]
  ],
  [
    "W",
    [
      36.12958294717331,
      33.88059895833334
    ]
  ],
  [
    "X",
    [
      25.842279888785917,
      15.047786458333336
    ]
  ],
  [
    "Y",
    [
      25.842279888785917,
      13.755338541666667
    ]
  ],
  [
    "Z",
    [
      23.61799814643188,
      14.955468750000001
    ]
  ]
];

charId = 7;
mDia = 3;
mH = 3;
mSides = 100;

generateChar(
    char = charactersAndPos[charId][0],
    fontSize = 40,
    font = "Helvetica:style=Bold",
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
    echo("Generating character: ", char);

    if($preview){
            #linear_extrude(height = charThickness+magnetHeight){
                text(text = char, size = fontSize, font = font);
            }
            color("red") 
            translate([magnetOffset[0], magnetOffset[1],magnetHeight/2 + charThickness])
            cylinder(d = magnetDiagonal, h=magnetHeight, center=true, $fn=magnetSides);
    }else{
        difference() {
            linear_extrude(height = charThickness+magnetHeight){
                text(text = char, size = fontSize, font = font);
            }
            color("red") 
            translate([magnetOffset[0], magnetOffset[1],charThickness - magnetHeight/2])
            cylinder(d = magnetDiagonal, h=magnetHeight, center=true, $fn=magnetSides);
        }
    }
}