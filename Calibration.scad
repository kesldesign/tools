// Calibration Tool
// Jan Kesl
// kesldesign.cz/tools

//LIBS
include <BOSL2/std.scad>

/* [Render settings] */
// Resolution
$fn = 40; // [20:200]
// Main color
mainCol  = "darkcyan";        // ["darkcyan", "darkorchid", "darkslateblue", "darkseagreen", "lightcoral", "lightskyblue"]

/* [Grid configuration] */
// Number of tools in X
gridCountX = 1; // [1:10]
// Number of tools in Y
gridCountY = 1; // [1:10]
// Main body height
bodyHeight = 20; // [15:45]
// Top rim thickness
rimThickness = 1; // [0:5]

/* [Tool parameters] */
// Tool head size
toolSize = 15; // [10:50]
// Spacing between tool heads
toolSpacing = 6; // [5:30]
// Tool tilt angle
toolTiltAngle = 0; // [0:20]
// Hole clearance
holeClearance = 0.25; // [0:0.05:1]
// Hole celarance step
clearanceStep = 0.05; // increment mezi dírami
// Tool lenght
toolLength = 40;

//Space calculation
space = toolSize + toolSpacing;

centerY = (space * (gridCountY-1))/-2;
centerX = (space * (gridCountX-1))/-2;
//Boundary space of main shape
boundY = space * gridCountY;
boundX = space * gridCountX;


//FILENAME
echo(str("FILENAME: calibration_", "_S", toolSize, "_H", bodyHeight, "_C", holeClearance*100, "_T", toolTiltAngle, ".stl"));

//MAIN
recolor(mainCol)
difference() 
{
    union() 
    {
        cuboid([boundX,boundY,bodyHeight], rounding=toolSize/2, edges="Z");
        translate([0,0,bodyHeight/2]) 
        rect_tube(size=[boundX,boundY], wall=rimThickness, rounding=toolSize/2, h=rimThickness);
    }
    translate([centerX,centerY,(bodyHeight/2-15+3)])
        for (i = [0 : gridCountX-1])
        {
            for (j = [0 : gridCountY-1])
            {

                holeIndex = j * gridCountX + i;
                clearance = holeClearance + holeIndex * clearanceStep;

                translate([i * space, j * space, 0])   
                xrot(toolTiltAngle) cyl(h=toolLength, d=2.35 + clearance, center=false)
                translate([0,0,-toolLength/2+bodyHeight-3+(rimThickness/2)-bodyHeight+15-1.5])
                    cyl(h=3, d1=2.35 + clearance, d2=5 + clearance, center=false);
            }
        }
    translate([0,0,(bodyHeight/-2)-0.2]) 
    difference() 
    {
        union()
        {
        translate([2.5/-2,0,0])     
        cyl(h=2, r=2.5, center=true);
            translate([2.5/2,0,0]) 
                cyl(h=2, r=2.5, center=true);
        }
        cuboid([2.25*2,2.25,2.25], rounding = 2.25/2, edges = "Z");
    }
}