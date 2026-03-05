
# Documentation
[![Static Badge](https://img.shields.io/badge/EN-3?style=for-the-badge&color=gray)](/docs/documentation.md)
[![Static Badge](https://img.shields.io/badge/CZ-4?style=for-the-badge&color=white)](/docs/documentation_cz.md)
[![Static Badge](https://img.shields.io/badge/OpenSCAD-1?style=for-the-badge&color=%23F9D72C)](https://www.openscad.org)


## Obsah:
[![check](https://img.shields.io/badge/Block-1?style=for-the-badge&color=darkcyan)](#2-block)
[![check](https://img.shields.io/badge/Block_Tray-1?style=for-the-badge&color=lightcoral)](#1-block-tray)
[![check](https://img.shields.io/badge/Tray-1?style=for-the-badge&color=slateblue)](#5-tray)
[![check](https://img.shields.io/badge/Tray_Diamonds-1?style=for-the-badge&color=darkseagreen)](#4-tray-diamonds)
[![check](https://img.shields.io/badge/Burs_Box-1?style=for-the-badge&color=crimson)](#3-burs-box)
[![check](https://img.shields.io/badge/Calibration-1?style=for-the-badge&color=grey)](#6-calibration)
---

>Některé parametry jsou ošetřeny aby nevytvořily špatnou geometrii, ale přesto je možné mít špatnou síť nebo nefunkční model

>Pro správné fungování `.scad` souborů je nutné nainstalovat knihovnu **BOSL2**

>Doporučuji nastavit `clearance` na `0.25` pro začítek a pomocí Calibration modulu otestovat na vaší tiskárně. Pro moduly s náklonem  `tilt` doporučuji o `0.10` větší.

>Momentálně jsou všechny díry pro nástroje o průměru `2.35` - pro silnější dříky nástrojů je možné upravit pomocí `holeClearance` - v budoucnu snad bude možné měnit parametricky.




## 1. Block Tray
![Block_Tray](/imgs/thumbs/block_tray1.png)

| Název v kódu        | Zkratka v názvu souboru | Popis                                               | Rozsah / limity            |
|---------------------|--------------------------|----------------------------------------------------|----------------------------|
| `gridCountX`        | `X`                      | Počet X                                            | 1–40                       |
| `gridCountY`        | `Y`                      | Počet Y                                            | 1–40                       |
| `rimThickness`      | —                        | Tloušťka horního rámečku                           | 0–5 mm                     |
| `bodyHeight`        | `H`                      | Celková výška organizéru (bez vaniček)             | 15–40 mm                   |
| `headDiameter`      | `S`                      | Průměr nejširší části nástroje                     | 10–50 mm                   |
| `toolSpacing`       | —                        | Vzdálenost mezi nástroji                           | 5–30 mm                    |
| `toolTiltAngle`     | `T`                      | Úhel sklonu otvorů                                 | 0–20°                      |
| `holeClearance`     | `C`                      | Vůle pro dřík nástroje                             | 0–1 mm (krok 0.05)         |
| `trayDepth`         | `TR`                     | Hloubka přední lišty / vaničky                     | 5–100 mm                   |
| `trayCount`         | `TC`                     | Kolik oddělovačů ve vaničce (0 = bez)              | 0–20                       |
| `trayCutHeight`     | —                        | Výška, kde se oddělovače vaničky uřezávají         | —                          |
| `enableAntislip`    | —                        | Zapne/vypne protiskluzový vzor na spodku           | true / false               |



## 2. Block
![Block](/imgs/thumbs/block2.png)


| Název v kódu        | Zkratka v názvu souboru | Popis                                               | Rozsah / limity            |
|---------------------|--------------------------|----------------------------------------------------|----------------------------|
| `gridCountX`        | `X`                      | Počet X                                            | 1–40                       |
| `gridCountY`        | `Y`                      | Počet Y                                            | 1–40                       |
| `bodyHeight`        | `H`                      | Celková výška organizéru                           | 15–45 mm                   |
| `rimThickness`      | —                        | Tloušťka horního rámečku                           | 0–5 mm                     |
| `toolSize`          | `S`                      | Průměr nejširší části nástroje                     | 10–50 mm                   |
| `toolSpacing`       | —                        | Vzdálenost mezi nástroji                           | 5–30 mm                    |
| `toolTiltAngle`     | `T`                      | Úhel sklonu otvorů                                 | 0–20°                      |
| `holeClearance`     | `C`                      | Vůle pro dřík nástroje                             | 0–1 mm (krok 0.05)         |
| `enableAntislip`    | —                        | Zapne/vypne protiskluzový vzor na spodku           | true / false               |




## 3. Burs Box
![Burs_Box](/imgs/thumbs/burs_box3.png)

| Název v kódu       | Zkratka v názvu souboru | Popis                                           | Rozsah / limity            |
|--------------------|--------------------------|------------------------------------------------|----------------------------|
| `gridCountX`       | `X`                      | Počet řad boxů                                 | 1–20                       |
| `gridCountY`       | `Y`                      | Počet boxů v jedné řadě                        | 5–50                       |
| `bodyHeight`       | —                        | Výška stěn boxů                                | 5–25 mm                    |
| `spacingX`         | `SX`                     | Vodorovná mezera mezi boxy                     | 3–30 mm                    |
| `spacingY`         | `SY`                     | Tloušťka stěny mezi boxy v řadě                | 1–10 mm                    |
| `holeClearance`    | `C`                      | Vůle pro dřík nástroje                         | 0–1 mm (krok 0.05)         |
| `rimThickness`     | —                        | Tloušťka horního rámečku                       | 1–10 mm                    |
| `enableAntislip`   | —                        | Zapne/vypne protiskluzový vzor                 | true / false               |
| `boxSizeX`         | —                        | Velikost vkládané krabičky                     | —                          |
| `boxSizeY`         | —                        | Velikost vkládané krabičky                     | —                          |
| `boxSizeZ`         | —                        | Velikost vkládané krabičky                     | —                          |



## 4. Tray Diamonds
![Tray_Diamonds](/imgs/thumbs/tray_diamonds4.png)

| Název v kódu     | Zkratka v názvu souboru | Popis                                           | Rozsah / limity     |
|------------------|--------------------------|------------------------------------------------|---------------------|
| `gridCountX`     | `X`                      | Šířka podnosu v mm                             | 25–400              |
| `gridCountY`     | `Y`                      | Délka podnosu v mm                             | 25–400              |
| `rimThickness`   | —                        | Tloušťka okraje                                | 1–5 mm              |
| `toolTiltAngle`  | `T`                      | Úhel šikmých drážek                            | 0–40°               |
| `overlap`        | —                        | Vertikální přesah lemu nad drážkami            | 0–30 mm             |
| `groove`         | `R`                      | Šířka diamantové drážky                        | 1–15 mm             |
| `enableAntislip` | —                        | Zapne/vypne protiskluzový vzor                 | true / false        |


## 5. Tray
![Tray](/imgs/thumbs/tray3.png)

| Název v kódu     | Zkratka v názvu souboru | Popis                                           | Rozsah / limity     |
|------------------|--------------------------|------------------------------------------------|---------------------|
| `gridCountX`     | `X`                      | Šířka podnosu v mm                             | 25–400              |
| `gridCountY`     | `Y`                      | Délka podnosu v mm                             | 25–400              |
| `rimThickness`   | —                        | Tloušťka okraje                                | 1–5 mm              |
| `toolTiltAngle`  | `T`                      | Úhel šikmých stěn přihrádek                    | 0–20°               |
| `U`              | `U`                      | Počet sloupců přihrádek                        | 1–20                |
| `V`              | `V`                      | Počet řad přihrádek                            | 1–20                |
| `separator`      | `S`                      | Výška vnitřních přepážek                       | 1–30 mm             |
| `overlap`        | —                        | Vertikální přesah lemu nad přepážkami          | 0–30 mm             |
| `enableAntislip` | —                        | Zapne/vypne protiskluzový vzor                 | true / false        |



## 6. Calibration
![Calibration](/imgs/thumbs/calibration.png)

| Název v kódu        | Zkratka v názvu souboru | Popis                                               | Rozsah / limity            |
|---------------------|--------------------------|----------------------------------------------------|----------------------------|
| `gridCountX`        | `X`                      | Počet X                                            | 1–40                       |
| `gridCountY`        | `Y`                      | Počet Y                                            | 1–40                       |
| `bodyHeight`        | `H`                      | Celková výška organizéru                           | 15–45 mm                   |
| `rimThickness`      | —                        | Tloušťka horního rámečku                           | 0–5 mm                     |
| `toolSize`          | `S`                      | Průměr nejširší části nástroje                     | 10–50 mm                   |
| `toolSpacing`       | —                        | Vzdálenost mezi nástroji                           | 5–30 mm                    |
| `toolTiltAngle`     | `T`                      | Úhel sklonu otvorů                                 | 0–20°                      |
| `holeClearance`     | `C`                      | Vůle pro dřík nástroje                             | 0–1 mm (krok 0.05)         |
| `clearanceStep`     | `ST`                     | Inkrementální posun vůle                           | 0–0.5 mm (krok 0.01)       |
