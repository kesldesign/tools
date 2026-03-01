// Block Tool 
// Version - 0.1.6
// Jan Kesl
// kesldesign.cz/tools


//LIBS
include <BOSL2/std.scad>

//PARAMETERS
//Resolution
$fn = 80;
// Number of tools in Y
gridCountY = 1;
// Number of tools in X
gridCountX = 1;
// Tool head size
toolSize = 16;
// Spacing between tool heads
toolSpacing= 6;
// Main body height
bodyHeight = 20;
// Hole clearance
holeClearance = 0.25;
// Tool tilt angle
toolTiltAngle = 0;
// Top rim thickness
rimThickness = 1;


// Main color
mainCol  = "darkcyan";        // ["darkcyan", "darkorchid", "darkslateblue", "darkseagreen", "lightcoral", "lightskyblue"]
toolAccentCol = "darkmagenta";
toolAccentCol2 = "darkcyan";
toolAccentCol3 = "crimson";

//Space calculation
space = toolSize + toolSpacing;

centerY = (space * (gridCountY-1))/-2;
centerX = (space * (gridCountX-1))/-2;
//Boundary space of main shape
boundY = space * gridCountY;
boundX = space * gridCountX;
//Visibility
// Visibility percentage
previewVisibility = 75;
// Randomnes seed
randomSeed = 90;
// Tool preview lenght
toolLength = 40;


//FILENAME
echo(str("FILENAME: calibration_", toolSize, "_H", bodyHeight, "_C", holeClearance*100, "_T", toolTiltAngle, ".stl"));



//Errors 
if (toolSize < 10 || toolTiltAngle > 20 || holeClearance > 1 || bodyHeight < 10)
{
    recolor("crimson")
    translate([0,0,0]) 
    text("error", toolSize = 10, font = "DejaVus Sans:style=Bold");   
    recolor("crimson")
    translate([0,-6,0]) 
    text("wrong parameter value", toolSize = 4, font = "DejaVus Sans:style=Bold");   
}
else
{

//MAIN
recolor(mainCol)
difference() 
{
    difference() 
    {
        difference() 
        {
            difference() 
            {  
    //Vycentrování a posonutí o sílu dna pod 0,0,0
                translate([0,0,((bodyHeight+rimThickness)/2)--3])
    //Základní stavební tvar
                cuboid([boundX,boundY,bodyHeight+rimThickness], rounding=toolSize/2, edges = "Z");
    //Válce na vyřezání děr
                translate([centerX,centerY,bodyHeight-10])
                    for (i = [0 : gridCountX-1]) {
                        for (j = [0 : gridCountY-1]) {
                            translate([i * space, j * space, 0])   
                            xrot(toolTiltAngle) cyl(h=toolLength, d=2.35+holeClearance, center=false)
                            translate([0,0,-toolLength/2+bodyHeight--3+(rimThickness/2)-bodyHeight+10-1]) cyl(h=3, d1=2.35+holeClearance, d2=5+holeClearance, center=false);
                        }
                    }
            }
    //Rim výřez
            translate([0,0,(bodyHeight*1.5)+3+rimThickness])    
            cuboid([boundX-(rimThickness*2),boundY-(rimThickness*2),bodyHeight+rimThickness], rounding=(toolSize/2)-(rimThickness/2), edges = "Z");
        }
    //Logo
        translate([0,0,3+0.5-0.1]) 
        difference() 
        {
            union()
            {
            translate([2.5/-2,0,0])     
            cyl(h=1, r=2.5, center=true);
                translate([2.5/2,0,0]) 
                    cyl(h=1, r=2.5, center=true);
            }
            cuboid([2.25*2,2.25,2.25], rounding = 2.25/2, edges = "Z");
        }
    }

    txtSize = 2.5;
    recolor("lightgreen")
    translate([-5,-space/2+txtSize-2,6]) 
    xrot(90)  linear_extrude(txtSize) text(str(holeClearance*100), size = 6, font = "DejaVus Sans:style=Bold");   

}


}

