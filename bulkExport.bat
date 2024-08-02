@ECHO OFF

REM set variable with openscad dir
set OPSCAD_DIR=C:\Program Files\OpenSCAD\openscad.exe

FOR /L %%A IN (1,1,3) DO (
  ECHO %%A
  "%OPSCAD_DIR%" -o hola.stl -D charId=22 generator.scad

)