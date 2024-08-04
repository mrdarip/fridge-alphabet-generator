import os

OPSCAD_DIR = "C:\\Program Files\\OpenSCAD\\openscad.exe"
chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
font = input("Enter font name: ")

if not os.path.exists("preview"):
    os.mkdir("preview")

for i in range(4):
    fontName = font
    char = chars[i]
    
    os.system(f"\"{OPSCAD_DIR}\" --preview --projection o --camera=20,20,0,0,0,0,120 --imgsize=1000,1000 -o preview/{char}.png -D fontName=\"{fontName}\" -D charId={i} ./generator.scad")
