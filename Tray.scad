// Tray Tool
// Jan Kesl
// kesldesign.cz/tools

//LIBS
include <BOSL2/std.scad>
//ATTRIBUTES

/* [Render settings] */
// Resolution
$fn = 40; // [20:200]
// Main color
mainCol  = "darkcyan";        // ["darkcyan", "darkorchid", "darkslateblue", "darkseagreen", "lightcoral", "lightskyblue"]

/* [Grid configuration] */
// X dimension
gridCountX = 40; // [25:400]

// Y dimension
gridCountY = 40; // [25:400]

// Top rim thickness
rimThickness = 2; // [1:5]

// Tool tilt angle
toolTiltAngle = 20; // [0:20]

// Number of trays in X
U = 5;  // [1:20]

// Number of trays in Y
V = 3;  // [1:20]

// Rim overlap height
overlap = 1; // [0:30]

// Separator height
separator = 5;  // [1:30]

/* [Protiskluzy] */
// Enable Antislip feature
enableAntislip = false;

/*[Printer toolSize test - Vypnout pro export]*/
// Enable buildplare preview
previewBuildPlate = false;

selectedPrinter = "Original Prusa MK4S";  // [Original Prusa MK4S, Original Prusa MINI, Bambu Lab X1 Carbon, Bambu Lab P2S, Bambu Lab A1, Creality K1C, Creality K2 Pro, Creality Hi, Creality Ender-3 V3 SE, Anycubic Kobra 2 Pro, Anycubic Kobra Plus, Anycubic Kobra 3 V2, QIDI gridCountX-Max 3, QIDI Q2, FlashForge Adventurer 5M Pro, FlashForge AD5X, Sovol SV06 Plus Ace, Sovol Zero, Artillery Sidewinder X4 Plus, Raise3D E2, Voron 2.4 (kit), FLSUN V400, FLSUN T1]
// Buildplate rotation
buildPlateRotation = 0; // [0:45:180]

// Main body height
bodyHeight = separator + overlap + 3;
prism2 = bodyHeight*tan(toolTiltAngle);

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

fits = (gridCountX <= bedX) && (gridCountY <= bedY);

//FILENAME
echo(str("FILENAME: tray_", gridCountX, "x", gridCountY, "_U", U, "_V", V, "_S", separator, "_T", toolTiltAngle, ".stl"));

//MAIN
recolor(mainCol)
difference() 
    {
        union() 
        {
            difference()
            {
                prismoid(size2=[gridCountX, gridCountY], size1=[gridCountX-prism2, gridCountY-prism2], rounding=10, h=bodyHeight);
                translate([0,0,3]) 
                prismoid(size2=[gridCountX-(rimThickness*2), gridCountY-(rimThickness*2)], size1=[gridCountX-prism2-(rimThickness*2), gridCountY-prism2-(rimThickness*2)], rounding=10-(rimThickness), h=bodyHeight-3+0.01);
            }
            intersection() 
            {
                translate([0,0,3]) 
                prismoid(size2=[gridCountX-rimThickness*0.75, gridCountY-rimThickness*0.75], size1=[gridCountX-prism2-rimThickness, gridCountY-prism2-rimThickness], rounding=10-(rimThickness/2), h=bodyHeight+0.01);
                union() 
                {    
                    translate([0,gridCountY/-2,-overlap]) 
                    for (i = [0: V])
                    {
                        translate([0,i*(gridCountY/V),bodyHeight/2]) 
                        cuboid([gridCountX-(rimThickness*2), 1, bodyHeight]);
                    }
                    translate([gridCountX/-2,0,-overlap]) 
                    for (i = [0: U])
                    {
                        translate([i*(gridCountX/U),0,bodyHeight/2])
                        cuboid([1, gridCountY-(rimThickness*2), bodyHeight]);
                    }
                }          
            }
        }
        difference() 
        {
        union()
            {
            translate([2.5/-2,0,-0.2])     
            cyl(h=2, r=2.5, center=true);
                translate([2.5/2,0,0]) 
                    cyl(h=2, r=2.5, center=true);
            }
            cuboid([2.25*2,2.25,2.25], rounding = 2.25/2, edges = "Z");
        }
        if (gridCountX>=40 && gridCountY>=40 && enableAntislip==true)
        {
        antislip_size = 10.5;
        antislip_offset = 5;
        translate([(gridCountX/2)-(antislip_size/2)-antislip_offset,(gridCountY/2)-(antislip_size/2)-antislip_offset,-0.2]) cyl(h=2, d=antislip_size, center=true);
        translate([(gridCountX/-2)-(antislip_size/-2)+antislip_offset,(gridCountY/2)-(antislip_size/2)-antislip_offset,-0.2]) cyl(h=2, d=antislip_size, center=true);
        translate([(gridCountX/-2)-(antislip_size/-2)+antislip_offset,(gridCountY/-2)-(antislip_size/-2)+antislip_offset,-0.2]) cyl(h=2, d=antislip_size, center=true);
        translate([(gridCountX/2)-(antislip_size/2)-antislip_offset,(gridCountY/-2)-(antislip_size/-2)+antislip_offset,-0.2]) cyl(h=2, d=antislip_size, center=true);
        }
}

recolor("antiquewhite")
if (previewBuildPlate == true)
{
    zrot(buildPlateRotation)
    translate([0,0,-0.1]) 
    cuboid([bedX,bedY,0.2]);
}