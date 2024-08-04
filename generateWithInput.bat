@ECHO OFF

set OPSCAD_DIR=C:\Program Files\OpenSCAD\openscad.exe

SET chars0=A
SET chars1=B
SET chars2=C
SET chars3=D
SET chars4=E
SET chars5=F
SET chars6=G
SET chars7=H
SET chars8=I
SET chars9=J
SET chars10=K
SET chars11=L
SET chars12=M
SET chars13=N
SET chars14=O
SET chars15=P
SET chars16=Q
SET chars17=R
SET chars18=S
SET chars19=T
SET chars20=U
SET chars21=V
SET chars22=W
SET chars23=X
SET chars24=Y
SET chars25=Z

set /P font=Enter font name:

mkdir "preview"
FOR /L %%A IN (0,1,25) DO (
    call "%OPSCAD_DIR%" -q --preview --projection o --camera=20,20,0,0,0,0,120 --imgsize=1000,1000 -o preview/%%chars%%A%%.png -D "fontName=\"%font%\"" -D charId=%%A ./generator.scad
)

start ./index.html

set /P positions=Enter html output positions:

rem write to file
echo charactersAndPos= > charsAndPos.scad
echo %positions% >> charsAndPos.scad
echo ; >> charsAndPos.scad

REM Square magnets
FOR /L %%H IN (1,1,10) DO (
    FOR /L %%D IN (1,1,10) DO (
        echo %%D mm diameter, %%H mm height
        mkdir "magnets\square\%%Dmm_diameter\%%Hmm_height"
        FOR /L %%A IN (0,1,25) DO (
            call "%OPSCAD_DIR%" -q -o magnets\square\%%Dmm_diameter\%%Hmm_height\%%chars%%A%%.stl -D charId=%%A -D "fontName=\"%font%\"" -D mDia=%%B -D mSides=4 ./generator.scad
        )
    )
)

REM Round magnets
FOR /L %%H IN (1,1,10) DO (
    FOR /L %%D IN (1,1,10) DO (
        echo %%D mm diameter, %%H mm height
        mkdir "magnets\round\%%Dmm_diameter\%%Hmm_height"
        FOR /L %%A IN (0,1,25) DO (
            call "%OPSCAD_DIR%" -q -o magnets\round\%%Dmm_diameter\%%Hmm_height\%%chars%%A%%.stl -D charId=%%A -D "fontName=\"%font%\"" -D "charactersAndPos=%positions%" -D mDia=%%B -D mSides=100 ./generator.scad
        )
    )
)