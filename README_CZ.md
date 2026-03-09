


![logo](/imgs/main3.png)

[![kesl-badge](https://img.shields.io/badge/www.KESLDESIGN.cz-8A2BE2?style=for-the-badge&color=blue)](https://kesldesign.cz/tools/)
[![Static Badge](https://img.shields.io/badge/OpenSCAD-1?style=for-the-badge&color=%23F9D72C)](https://www.openscad.org)
[![Static Badge](https://img.shields.io/badge/documentation-6?style=for-the-badge&color=purple)](/docs/documentation.md)
[![Static Badge](https://img.shields.io/badge/EN-3?style=for-the-badge&color=gray)](README.md)
[![Static Badge](https://img.shields.io/badge/CZ-4?style=for-the-badge&color=white)](README_CZ.md)
[![License: CC BY 4.0](https://img.shields.io/badge/CC--BY--SA--4.0-F9D72C?style=for-the-badge&color=mediumseagreen)](https://creativecommons.org/licenses/by-sa/4.0/)

Projekt zaměřený na vývoj parametrických 3D organizérů pro zlatníky, stříbrníky, faséry drahých kamenů, brusiče i hobby tvůrce.

Projekt vznikl z reálné potřeby zlatnické dílny – cílem je zlepšit organizaci pracovního prostoru, přehled v nástrojích a celkovou efektivitu práce.


## 🎯 Co projekt řeší

Organizéry jsou navrženy pro ukládání například:

- frézek a stopkových nástrojů  
- brusných a lešticích kotoučů  
- drahých kamenů  
- polotovarů a drobných součástek  

Pomáhají šetřit místo, minimalizovat nepořádek a udržet pracovní prostředí systematické a přehledné.


## 🔧 Parametrické modelování

Modely jsou vytvářeny v OpenSCADu jako plně parametrické:

- snadná úprava rozměrů změnou několika hodnot  
- rychlé přizpůsobení konkrétním nástrojům  
- dostupné zdrojové `.scad` soubory pro vlastní úpravy  
- připravené balíky předpřipravených modulů pro okamžitý tisk ve formátu `.stl` 

Projekt je určen jak profesionálům, tak i začínajícím uživatelům.

## 🌍 Komunita a sdílení

Smyslem projektu je sdílet funkční nástroje, které může komunita dále rozvíjet.

Organizéry lze upravovat, kombinovat a přizpůsobovat konkrétním provozům.  
Každé vylepšení, nová varianta nebo zpětná vazba pomáhá posouvat projekt dál.

Cílem je vytvořit otevřený základ, na kterém mohou tvůrci stavět vlastní řešení bez omezení a zbytečných bariér.


---

| Modul | Popis|STL balíček|Presety|
|--     |:----:|:------------:|:-----:|
|[![check](https://img.shields.io/badge/Block-1?style=for-the-badge&color=darkcyan)](/docs/documentation.md#2-block)|Blok pro organizování frézek a rotačních nástrojů různých velikostí|✔|✔|
|[![check](https://img.shields.io/badge/Block_Tray-1?style=for-the-badge&color=lightcoral)](/docs/documentation.md#1-block-tray)|Blok pro organizaci nástrojů se zásobníkem |✔|✔|
|[![check](https://img.shields.io/badge/Tray-1?style=for-the-badge&color=slateblue)](/docs/documentation.md#5-tray)|Misky na různé díly s možností rozdělit na vlastní příhrádky |✔|✔|
|[![check](https://img.shields.io/badge/Tray_Diamonds-1?style=for-the-badge&color=darkseagreen)](/docs/documentation.md#4-tray-diamonds)|Misky pro třídění diamantů nebo jinách drahokamů. |✔|✔|
|[![check](https://img.shields.io/badge/Burs_Box-1?style=for-the-badge&color=crimson)](/docs/documentation.md#3-burs-box)|Organizér pro krabičky s frézkami. |✔|✔|
|[![check](https://img.shields.io/badge/Calibration-1?style=for-the-badge&color=grey)](/docs/documentation.md#6-calibration)|Kalibrační pomůcka pro správné nastavení `holeClereance`. |✔|-|


#### Features

|Featura|Status|Popis|
|-------|:---:|------|
|**Balíky pro rychlý tisk**|✔|Před připravené moduly v .stl souborech pro rychlý tisk.|
|**Presety**|✔|Presety pro OpenSCAD ve formátu .json, které Vám umožní editovat přednastavené moduly.|
|**Antislip**|✔|Možnost přidat modelům protiskluzové prvky (nalepovací pryžová kolečka 10mm). Model musí být alespoň 40*40mm velký.|
|**Build plate check**|✔|Umožní rychlý náhled velikosti modelu vůči buildplatu 3D tiskárny podle výběru. Seznam tiskáren níže.|

---

#### Co plánujeme do budoucna 
- [ ] Vertikální moduly
- [ ] Moduly natočené pod úhlem nebo kaskádové moduly
- [ ] Parametrické nastavení pro průměr mandrel
- [ ] Box pro ukládání quick-swap rýtek pro GraverMach
- [X] Kalibrační moduly pro 3D tiskárny


###### Rozměry buildplatů tiskáren pro porovnání:

`Original Prusa MK4S`
`Original Prusa MINI`
`Bambu Lab X1 Carbon`
`Bambu Lab P2S`
`Bambu Lab A1`
`Creality K1C`
`Creality K2 Pro`
`Creality Hi`
`Creality Ender-3 V3 SE`
`Anycubic Kobra 2 Pro`
`Anycubic Kobra Plus`
`Anycubic Kobra 3 V2`
`QIDI X-Max 3`
`QIDI Q2`
`FlashForge Adventurer 5M Pro`
`FlashForge AD5X`
`Sovol SV06 Plus Ace`
`Sovol Zero`
`Artillery Sidewinder X4 Plus`
`Raise3D E2`
`Voron 2.4 (kit)`
`FLSUN V400`
`FLSUN T1`




---