// Block Tool V2
// Version - 0.0.4
// Jan Kesl
// kesldesign.cz/tools


//LIBS
include <BOSL2/std.scad>

/* [Render settings] */
// Resolution
$fn = 40; // [20:200]
// Main color
mainCol  = "darkcyan";        // ["darkcyan", "darkorchid", "darkslateblue", "darkseagreen", "lightcoral", "lightskyblue"]
// Secondary color
toolAccentCol  = "darkmagenta";  // ["darkmagenta","chartreuse","crimson","darkslategrey", "darkturquoise"]

/* [Grid configuration] */
// Number of tools in X
gridCountX = 7; // [1:40]
// Number of tools in Y
gridCountY = 4; // [1:40]
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

/* [Antislip] */
// Enable Antislip feature
enableAntislip = false;

/* [Tool preview - DISABLE for EXPORT] */
// Tool preview
previewTools = false; 
// Visibility percentage
previewVisibility = 75; // [0:100]
// Randomnes seed
randomSeed = 90; // [0:1000]
// Tool preview lenght
toolLength = 40; // [20:80]

/*[Printer buildplate previe - DISABLE for EXPORT]*/
// Enable buildplate preview
previewBuildPlate = false;

selectedPrinter = "Original Prusa MK4S";  // [Original Prusa MK4S, Original Prusa MINI, Bambu Lab X1 Carbon, Bambu Lab P2S, Bambu Lab A1, Creality K1C, Creality K2 Pro, Creality Hi, Creality Ender-3 V3 SE, Anycubic Kobra 2 Pro, Anycubic Kobra Plus, Anycubic Kobra 3 V2, QIDI gridCountX-Max 3, QIDI Q2, FlashForge Adventurer 5M Pro, FlashForge AD5X, Sovol SV06 Plus Ace, Sovol Zero, Artillery Sidewinder X4 Plus, Raise3D E2, Voron 2.4 (kit), FLSUN V400, FLSUN T1]
// Buildplate rotation
buildPlateRotation = 0; // [0:45:180]


//Space calculation
space = toolSize + toolSpacing;

centerY = (space * (gridCountY-1))/-2;
centerX = (space * (gridCountX-1))/-2;
//Boundary space of main shape
boundY = space * gridCountY;
boundX = space * gridCountX;

//Printers test
function get_bed_size(name) =
    name == "Original Prusa MK4S"          ? [250,210] :
    name == "Original Prusa MINI"          ? [180,180] :
    name == "Bambu Lab X1 Carbon"          ? [256,256] :
    name == "Bambu Lab P2S"                ? [256,256] :
    name == "Bambu Lab A1"                 ? [256,256] :
    name == "Creality K1C"                 ? [220,220] :
    name == "Creality K2 Pro"              ? [300,300] :
    name == "Creality Hi"                  ? [260,260] :
    name == "Creality Ender-3 V3 SE"       ? [220,220] :
    name == "Anycubic Kobra 2 Pro"         ? [220,220] :
    name == "Anycubic Kobra Plus"          ? [300,300] :
    name == "Anycubic Kobra 3 V2"          ? [255,255] :
    name == "QIDI gridCountX-Max 3"        ? [325,325] :
    name == "QIDI Q2"                      ? [270,270] :
    name == "FlashForge Adventurer 5M Pro" ? [220,220] :
    name == "FlashForge AD5X"              ? [220,220] :
    name == "Sovol SV06 Plus Ace"          ? [300,300] :
    name == "Sovol Zero"                   ? [152,152] :
    name == "Artillery Sidewinder X4 Plus" ? [300,300] :
    name == "Raise3D E2"                   ? [330,240] :
    name == "Voron 2.4 (kit)"              ? [300,300] :
    name == "FLSUN V400"                   ? [300,300] :
    name == "FLSUN T1"                     ? [260,260] :
    [0,0];  // fallback

bed = get_bed_size(selectedPrinter);
bedX = bed[0];
bedY = bed[1];

fits = (boundX <= bedX) && (boundY <= bedY);



//FILENAME
echo(str("FILENAME: block_", gridCountX, "x", gridCountY, "_S", toolSize, "_H", bodyHeight, "_C", holeClearance*100, "_T", toolTiltAngle, ".stl"));


//MAIN
recolor(mainCol)
difference() 
{
    union() 
    {
        // Main Shape
        cuboid([boundX,boundY,bodyHeight], rounding=toolSize/2, edges="Z");

        //Rim
        translate([0,0,bodyHeight/2]) 
        rect_tube(size=[boundX,boundY], wall=rimThickness, rounding=toolSize/2, h=rimThickness);
    }


    // Burr cutters
    translate([centerX,centerY,(bodyHeight/2-15+3)])
        for (i = [0 : gridCountX-1]) {
            for (j = [0 : gridCountY-1]) {
                translate([i * space, j * space, 0])   
                xrot(toolTiltAngle) cyl(h=toolLength, d=2.35+holeClearance, center=false)
                translate([0,0,-toolLength/2+bodyHeight-3+(rimThickness/2)-bodyHeight+15-1.5]) cyl(h=3, d1=2.35+holeClearance, d2=5+holeClearance, center=false);
            }
        }


    // Logo
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

    // Antislip

    if (boundX>=40 && boundY>=40 && enableAntislip==true)
    {
    antislip_size = 10.5;
    antislip_offset = 5;
    translate([(boundX/2)-(antislip_size/2)-antislip_offset,(boundY/2)-(antislip_size/2)-antislip_offset,(bodyHeight/-2)-0.2]) cyl(h=2, d=antislip_size, center=true);
    translate([(boundX/-2)-(antislip_size/-2)+antislip_offset,(boundY/2)-(antislip_size/2)-antislip_offset,(bodyHeight/-2)-0.2]) cyl(h=2, d=antislip_size, center=true);
    translate([(boundX/-2)-(antislip_size/-2)+antislip_offset,(boundY/-2)-(antislip_size/-2)+antislip_offset,(bodyHeight/-2)-0.2]) cyl(h=2, d=antislip_size, center=true);
    translate([(boundX/2)-(antislip_size/2)-antislip_offset,(boundY/-2)-(antislip_size/-2)+antislip_offset,(bodyHeight/-2)-0.2]) cyl(h=2, d=antislip_size, center=true);
    }
}



// Preview
if (previewTools==true)
{
//Burrs and Discs
translate([centerX, centerY,bodyHeight/2-15+3])
    for (i = [0 : gridCountX-1])
    {
        for (j = [0 : gridCountY-1])
        {        
            if (toolSize < 11)
            {
                idx = i*gridCountY + j;
                rnd = rands(0, 1, 1, randomSeed + idx)[0];
                if (rnd < previewVisibility/100) {
                    // Generate random sphere radius between 1 and 5
                    sphere_r = rands(1.0, 2.2, 1, randomSeed + idx + 1000)[0]; // +1000 to avoid randomSeed collision
                        translate([i * space, j * space, 0])   
                        xrot(toolTiltAngle)  
                        recolor("ivory") 
                        // Typ frezky:

                        //Conus
                        cyl(h=toolLength, r=(2.35/2), center=false)  translate([0, 0, toolLength/2+2]) cyl(h=4, r1=2.35/2, r2=0.3)
                        //Endpoint
                        translate([0, 0, 2]) recolor(toolAccentCol) sphere(r=sphere_r/2);
                }
            }
            else if (toolSize < 17)
            {
                idx = i*gridCountY + j;
                rnd = rands(0, 1, 1, randomSeed + idx)[0];
                if (rnd < previewVisibility/100)
                {
                    translate([i * space, j * space, 0])   
                    xrot(toolTiltAngle)  

                    // Typ frezky:
                    recolor("ivory") 
                    cyl(h=toolLength, r=(2.35/2), center=false) translate([0, 0, toolLength/2+2]) recolor(toolAccentCol) cyl(h=12, d1=toolSize, d2=1);  
                }
            }
            else if (toolSize > 16)
            {
                idx = i*gridCountY + j;
                rnd = rands(0, 1, 1, randomSeed + idx)[0];
                if (rnd < previewVisibility/100)
                {
                    translate([i * space, j * space, 0])   
                    xrot(toolTiltAngle)  

                    // Typ frezky:
                    recolor("ivory") 
                    cyl(h=toolLength, r=(2.35/2), center=false) translate([0, 0, toolLength/2-2]) recolor(toolAccentCol) cyl(h=3, d=toolSize, center=true, chamfer1 = 1.5, chamfer2 = 1.5);  
                }   
            }
        }
    }
}


recolor("antiquewhite")

if (previewBuildPlate == true)
{
//buildplate
    zrot(buildPlateRotation)
    translate([0,0,bodyHeight/-2-0.1]) 
    cuboid([bedX,bedY,0.2]);
}