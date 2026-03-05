# Documentation
[![Static Badge](https://img.shields.io/badge/EN-3?style=for-the-badge&color=gray)](/docs/documentation.md)
[![Static Badge](https://img.shields.io/badge/CZ-4?style=for-the-badge&color=white)](/docs/documentation_cz.md)
[![Static Badge](https://img.shields.io/badge/OpenSCAD-1?style=for-the-badge&color=%23F9D72C)](https://www.openscad.org)


## Table of Contents:
[![check](https://img.shields.io/badge/Block-1?style=for-the-badge&color=darkcyan)](#2-block)
[![check](https://img.shields.io/badge/Block_Tray-1?style=for-the-badge&color=lightcoral)](#1-block-tray)
[![check](https://img.shields.io/badge/Tray-1?style=for-the-badge&color=slateblue)](#5-tray)
[![check](https://img.shields.io/badge/Tray_Diamonds-1?style=for-the-badge&color=darkseagreen)](#4-tray-diamonds)
[![check](https://img.shields.io/badge/Burs_Box-1?style=for-the-badge&color=crimson)](#3-burs-box)
[![check](https://img.shields.io/badge/Calibration-1?style=for-the-badge&color=grey)](#6-calibration)

---

>Some parameters are safeguarded to prevent invalid geometry, but it is still possible to create a broken mesh or non-functional model.

>For the `.scad` files to work properly, you need to install the **BOSL2** library.

>I recommend starting with `clearance` = `0.25` and testing on your printer using the Calibration module. For modules with tilt I recommend using ~0.10 mm more.

>Currently all tool holes have a diameter of `2.35` mm – for thicker tool shanks you can adjust using `holeClearance`. In the future it might be possible to change this parametrically.


## 1. Block Tray
![Block_Tray](/imgs/thumbs/block_tray1.png)

| Parameter name      | Filename abbreviation | Description                                        | Range / limits             |
|---------------------|------------------------|----------------------------------------------------|----------------------------|
| `gridCountX`        | `X`                    | Number of columns (X)                              | 1–40                       |
| `gridCountY`        | `Y`                    | Number of rows (Y)                                 | 1–40                       |
| `rimThickness`      | —                      | Thickness of the top rim                           | 0–5 mm                     |
| `bodyHeight`        | `H`                    | Total height of the organizer (without trays)      | 15–40 mm                   |
| `headDiameter`      | `S`                    | Diameter of the widest part of the tool            | 10–50 mm                   |
| `toolSpacing`       | —                      | Distance between tools                             | 5–30 mm                    |
| `toolTiltAngle`     | `T`                    | Tilt angle of the holes                            | 0–20°                      |
| `holeClearance`     | `C`                    | Clearance for the tool shank                       | 0–1 mm (step 0.05)         |
| `trayDepth`         | `TR`                   | Depth of the front lip / tray                      | 5–100 mm                   |
| `trayCount`         | `TC`                   | Number of dividers in the tray (0 = none)          | 0–20                       |
| `trayCutHeight`     | —                      | Height at which tray dividers are cut              | —                          |
| `enableAntislip`    | —                      | Enable/disable anti-slip pattern on the bottom     | true / false               |


## 2. Block
![Block](/imgs/thumbs/block2.png)

| Parameter name      | Filename abbreviation | Description                                        | Range / limits             |
|---------------------|------------------------|----------------------------------------------------|----------------------------|
| `gridCountX`        | `X`                    | Number of columns (X)                              | 1–40                       |
| `gridCountY`        | `Y`                    | Number of rows (Y)                                 | 1–40                       |
| `bodyHeight`        | `H`                    | Total height of the organizer                      | 15–45 mm                   |
| `rimThickness`      | —                      | Thickness of the top rim                           | 0–5 mm                     |
| `toolSize`          | `S`                    | Diameter of the widest part of the tool            | 10–50 mm                   |
| `toolSpacing`       | —                      | Distance between tools                             | 5–30 mm                    |
| `toolTiltAngle`     | `T`                    | Tilt angle of the holes                            | 0–20°                      |
| `holeClearance`     | `C`                    | Clearance for the tool shank                       | 0–1 mm (step 0.05)         |
| `enableAntislip`    | —                      | Enable/disable anti-slip pattern on the bottom     | true / false               |


## 3. Burs Box
![Burs_Box](/imgs/thumbs/burs_box3.png)

| Parameter name     | Filename abbreviation | Description                                        | Range / limits             |
|--------------------|------------------------|----------------------------------------------------|----------------------------|
| `gridCountX`       | `X`                    | Number of box rows                                 | 1–20                       |
| `gridCountY`       | `Y`                    | Number of boxes in one row                         | 5–50                       |
| `bodyHeight`       | —                      | Height of box walls                                | 5–25 mm                    |
| `spacingX`         | `SX`                   | Horizontal gap between boxes                       | 3–30 mm                    |
| `spacingY`         | `SY`                   | Wall thickness between boxes in a row              | 1–10 mm                    |
| `holeClearance`    | `C`                    | Clearance for the tool shank                       | 0–1 mm (step 0.05)         |
| `rimThickness`     | —                      | Thickness of the top rim                           | 1–10 mm                    |
| `enableAntislip`   | —                      | Enable/disable anti-slip pattern                   | true / false               |
| `boxSizeX`         | —                      | Size of the inserted box                           | —                          |
| `boxSizeY`         | —                      | Size of the inserted box                           | —                          |
| `boxSizeZ`         | —                      | Size of the inserted box                           | —                          |


## 4. Tray Diamonds
![Tray_Diamonds](/imgs/thumbs/tray_diamonds4.png)

| Parameter name   | Filename abbreviation | Description                                        | Range / limits     |
|------------------|------------------------|----------------------------------------------------|--------------------|
| `gridCountX`     | `X`                    | Tray width in mm                                   | 25–400             |
| `gridCountY`     | `Y`                    | Tray length in mm                                  | 25–400             |
| `rimThickness`   | —                      | Edge thickness                                     | 1–5 mm             |
| `toolTiltAngle`  | `T`                    | Angle of the slanted diamond grooves               | 0–40°              |
| `overlap`        | —                      | Vertical overhang of rim above grooves             | 0–30 mm            |
| `groove`         | `R`                    | Width of diamond groove                            | 1–15 mm            |
| `enableAntislip` | —                      | Enable/disable anti-slip pattern                   | true / false       |


## 5. Tray
![Tray](/imgs/thumbs/tray3.png)

| Parameter name   | Filename abbreviation | Description                                        | Range / limits     |
|------------------|------------------------|----------------------------------------------------|--------------------|
| `gridCountX`     | `X`                    | Tray width in mm                                   | 25–400             |
| `gridCountY`     | `Y`                    | Tray length in mm                                  | 25–400             |
| `rimThickness`   | —                      | Edge thickness                                     | 1–5 mm             |
| `toolTiltAngle`  | `T`                    | Angle of slanted compartment walls                 | 0–20°              |
| `U`              | `U`                    | Number of columns of compartments                  | 1–20               |
| `V`              | `V`                    | Number of rows of compartments                     | 1–20               |
| `separator`      | `S`                    | Height of internal dividers                        | 1–30 mm            |
| `overlap`        | —                      | Vertical overhang of rim above dividers            | 0–30 mm            |
| `enableAntislip` | —                      | Enable/disable anti-slip pattern                   | true / false       |



## 6. Calibration
![Calibration](/imgs/thumbs/calibration.png)

| Parameter name      | Filename abbreviation | Description                                        | Range / limits             |
|---------------------|------------------------|----------------------------------------------------|----------------------------|
| `gridCountX`        | `X`                    | Number of columns (X)                              | 1–40                       |
| `gridCountY`        | `Y`                    | Number of rows (Y)                                 | 1–40                       |
| `bodyHeight`        | `H`                    | Total height of the organizer                      | 15–45 mm                   |
| `rimThickness`      | —                      | Thickness of the top rim                           | 0–5 mm                     |
| `toolSize`          | `S`                    | Diameter of the widest part of the tool            | 10–50 mm                   |
| `toolSpacing`       | —                      | Distance between tools                             | 5–30 mm                    |
| `toolTiltAngle`     | `T`                    | Tilt angle of the holes                            | 0–20°                      |
| `holeClearance`     | `C`                    | Clearance for the tool shank                       | 0–1 mm (step 0.05)         |
| `clearanceStep`     | `ST`                   | Clearance incremental step                         | 0–0.5 mm (step 0.01)         |
