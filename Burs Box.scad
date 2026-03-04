// Burs Box Tool 
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
// Number of rows
gridCountX = 5; // [1:20] 
// Number of boxes in row
gridCountY = 20;  // [5:50]
// Main body height
bodyHeight = 10; // [5:25]
// Row spacing
spacingX = 10; // [3:30]
// Box separator thickness
spacingY = 2; // [1:10]
// Hole clearance
holeClearance = 0.30; //[0:0.05:1]
// Top rim thickness
rimThickness = 5; // [1:10]

/* [Antislip] */
// Enable Antislip feature
enableAntislip = false;

/* [Box preview - DISABLE for EXPORT] */
// Tool preview
previewTools = false; 
// Visibility percentage
previewVisibility = 20; //[0:100]
// Randomnes seed
randomSeed = 45; // [1:99]
boxSizeX = 21.4;
boxSizeY = 5.0;
boxSizeZ = 47.5;

/*[Printer buildplate previe - DISABLE for EXPORT]*/
// Enable buildplate preview
previewBuildPlate = false;

selectedPrinter = "Original Prusa MK4S";  // [Original Prusa MK4S, Original Prusa MINI, Bambu Lab X1 Carbon, Bambu Lab P2S, Bambu Lab A1, Creality K1C, Creality K2 Pro, Creality Hi, Creality Ender-3 V3 SE, Anycubic Kobra 2 Pro, Anycubic Kobra Plus, Anycubic Kobra 3 V2, QIDI gridCountX-Max 3, QIDI Q2, FlashForge Adventurer 5M Pro, FlashForge AD5X, Sovol SV06 Plus Ace, Sovol Zero, Artillery Sidewinder X4 Plus, Raise3D E2, Voron 2.4 (kit), FLSUN V400, FLSUN T1]
// Buildplate rotation
buildPlateRotation = 0; // [0:45:180]

//Space calculation
spaceX = boxSizeX + spacingX;
spaceY = boxSizeY + spacingY;

centerY = (spaceY * (gridCountY-1))/-2;
centerX = (spaceX * (gridCountX-1))/-2;
//Boundary
boundX = spaceX * gridCountX;
boundY = spaceY * gridCountY;
//Bound box
sizeX = (gridCountX*boxSizeX)+((gridCountX-1)*spacingX)+rimThickness*2;
sizeY = (gridCountY*boxSizeY)+((gridCountY-1)*spacingY)+rimThickness*2;

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
echo(str("FILENAME: burs_box_", gridCountX, "x", gridCountY, "_SX", spacingX, "_SY", spacingY, "_C", holeClearance, ".stl"));

// MAIN
recolor(mainCol)
difference() 
{
difference() 
    {
    difference() 
        {
            translate([0,0,bodyHeight/2-3]) 
            cuboid([sizeX, sizeY, bodyHeight], rounding=rimThickness/2, edges="Z");
            translate([centerX,centerY,boxSizeZ/2])
                for (i = [0 : gridCountX-1])
                {
                    for (j = [0 : gridCountY-1])
                    {
                        translate([i * spaceX, j * spaceY, 0])   
                        cuboid([boxSizeX+holeClearance,boxSizeY+holeClearance,boxSizeZ]);
                    }
                }                          
        }
    translate([centerX,0,0])
        for (j = [0 : gridCountX-1])
        {
            translate([j * spaceX, 0, 0])   
            prismoid(size1=[boxSizeX-8,sizeY-rimThickness*2], size2=[boxSizeX-1, sizeY-rimThickness*2], h=bodyHeight-3+0.1);
        }
}
translate([0,0,-3.2]) 
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
    if (boundX>=40 && boundY>=40 && enableAntislip==true)
    {
        antislip_size = 10.5;
        antislip_offset = 5;
        translate([(sizeX/2)-(antislip_size/2)-antislip_offset,(sizeY/2)-(antislip_size/2)-antislip_offset,-3.2]) cyl(h=2, d=antislip_size, center=true);
        translate([(sizeX/-2)-(antislip_size/-2)+antislip_offset,(sizeY/2)-(antislip_size/2)-antislip_offset,-3.2]) cyl(h=2, d=antislip_size, center=true);
        translate([(sizeX/-2)-(antislip_size/-2)+antislip_offset,(sizeY/-2)-(antislip_size/-2)+antislip_offset,-3.2]) cyl(h=2, d=antislip_size, center=true);
        translate([(sizeX/2)-(antislip_size/2)-antislip_offset,(sizeY/-2)-(antislip_size/-2)+antislip_offset,-3.2]) cyl(h=2, d=antislip_size, center=true);
    }
}

if (previewTools==true)
{
    recolor("lemonchiffon")
    difference() 
    {
        translate([centerX,centerY,boxSizeZ/2])
            for (i = [0 : gridCountX-1])
            {
                for (j = [0 : gridCountY-1])
                {
                    idx = i*gridCountY + j;
                    rnd = rands(0,1,1, randomSeed + idx)[0];
                    if (rnd < previewVisibility/100)              
                    translate([i * spaceX, j * spaceY, 0])   
                    cuboid([boxSizeX,boxSizeY,boxSizeZ]);
                }
            }         
        translate([centerX,centerY,boxSizeZ/2])
            for (i = [0 : gridCountX-1])
            {
                for (j = [0 : gridCountY-1])
                {
                    idx = i*gridCountY + j;
                    rnd = rands(0,1,1, randomSeed + idx)[0];
                    if (rnd < previewVisibility/100)               
                    translate([i * spaceX, j * spaceY, 0])   
                    translate([0,-1,1]) 
                    cuboid([boxSizeX-2,boxSizeY,boxSizeZ]);
                }
            }
    }

color([0.9, 0.9, 0.9, 0.5])
translate([centerX,centerY,boxSizeZ/2])
    for (i = [0 : gridCountX-1])
    {
        for (j = [0 : gridCountY-1])
        {
            idx = i*gridCountY + j;
            rnd = rands(0,1,1, randomSeed + idx)[0];
            if (rnd < previewVisibility/100)        
            translate([0,boxSizeY/-2+0.25,0.5]) 
            translate([i * spaceX, j * spaceY, 0])   
            cuboid([boxSizeX-2,0.5,boxSizeZ-1]);
        }
    }

}

recolor("antiquewhite")

if (previewBuildPlate == true)
{
    zrot(buildPlateRotation)
    translate([0,0,-3-0.1]) 
    cuboid([bedX,bedY,0.2]);
}