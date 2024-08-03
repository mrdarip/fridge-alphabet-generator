@ECHO OFF

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

REM set variable with openscad dir
set OPSCAD_DIR=C:\Program Files\OpenSCAD\openscad.exe

REM Square magnets

FOR /L %%H IN (1,1,10) DO (
    FOR /L %%D IN (1,1,10) DO (
        echo %%D mm diameter, %%H mm height
        mkdir "magnets\square\%%Dmm_diameter\%%Hmm_height"
        FOR /L %%A IN (0,1,25) DO (
            call "%OPSCAD_DIR%" -q -o magnets\square\%%Dmm_diameter\%%Hmm_height\%%chars%%A%%.stl -D charId=%%A -D mDia=%%B -D mSides=4 ./generator.scad
        )
    )
)

FOR /L %%H IN (1,1,10) DO (
    FOR /L %%D IN (1,1,10) DO (
        echo %%D mm diameter, %%H mm height
        mkdir "magnets\round\%%Dmm_diameter\%%Hmm_height"
        FOR /L %%A IN (0,1,25) DO (
            call "%OPSCAD_DIR%" -q -o magnets\round\%%Dmm_diameter\%%Hmm_height\%%chars%%A%%.stl -D charId=%%A -D mDia=%%B -D mSides=100 ./generator.scad
        )
    )
)