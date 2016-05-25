![CommuniCube Logo](https://raw.githubusercontent.com/designBuddies/CommuniCube/master/other/img/logo.png)
## Introduksjon
CommuniCube-systemet består av to komponenter: et gitt antall CommuniCubes, og en laptop som kjører et program(DesktopApp) i Processing IDE, et utviklingsmiljø basert på blant annet Java, og som er designet for visuell representasjon av data.

Mer om prosjektet finner du [**her**](http://www.uio.no/studier/emner/matnat/ifi/INF1510/v16/prosjekter/designbuddies/index.html)

## Innholdsfortegnelse
* [Introduksjon](#introduksjon)
* [Funksjonalitet](#funksjonalitet)
..* [Kjørerekkefølge](#hver-kjøring-av-programmet-utføres-i-denne-rekkefølgen)
..* [Arduino](#arduino)
..* [DesktopApp](#desktopapp)
* [Hardware](#hardware)
..* [Deler](#deler)
..* [Schematics](#schematics)
* [Video](#video)
* [Credits](#credits)

## Funksjonalitet
##### Hver kjøring av programmet utføres i denne rekkefølgen:
1. Bruker starter programmet.
2. Bruker velger en spørsmålsfil.
3. DesktoppApp oppretter en svarfil basert på informasjon i spørsmålsfil.
4. DesktopApp sender signal til alle tilkoblede CC om at de skal starte innsamling av data.
5. Respondent svarer.
6. Communicube sender svaret til DesktopApp via serialport.
7. Communicube setter seg seg i ferdigmodus.
8. DesktopApp skriver resultat til skjerm.
9. Bruker trykker tast for å avslutte DesktopApp.
10. DesktopApp skriver resultatene til fil.

##### Arduino
[**_Kode_**](https://github.com/designBuddies/CommuniCube/blob/master/ArduinoCode/ArduinoCode.ino)  
Så lenge Arduino er i svar-modus, lytter den etter om en av de fire kretsene lukkes. Om en av kretsene lukkes sender Arduino svaret over serial(emulert i en USB-kabel) til DesktopApp, og går til svart-modus. Dette vil si at LED lampen slutter å lyse og at Aduinoen ikke leser eller sender flere svar fra den aktuelle basen.

##### DesktopApp
[**_Kode_**](https://github.com/designBuddies/CommuniCube/blob/master/DesktopApp/DesktopApp.pde)  
Alle Baser (Arduinoer) er koblet til en PC som kjører DestopApp. DesktopApp tar i mot data over serial USB) og legger de inn i en array. Deretter brukes denne til å lage en grafisk fremstilling av dataene. Når programmet avsluttes skrives spørsmålet, de unike IDene til basene og hva de har svart til fil.



## Hardware
### Deler
##### Deler pr. Base
* 1 Arduino UNO
* 5 220Ω Resistorer
* 1 Grønn LED
* 2 Breadboards
* 1 USB Kabel
* 1 110mm * 170mm boks
* 1 70mm * 70mm kvadrat
* 4 30mm * 20mm treangler i formingsskum
* Diverse ledninger

##### Deler pr. Kloss
* 1 70mm * 70mm boks
* Maling i 4 farger

### Schematics
![Schematics](https://raw.githubusercontent.com/designBuddies/CommuniCube/master/other/img/schematics.png)



### Filer for laserkutter
#### Base
![Lazercut Base v2](https://raw.githubusercontent.com/designBuddies/CommuniCube/master/other/img/caseplan_base.png)
#### Boks
![Lazercut Boks v2](https://raw.githubusercontent.com/designBuddies/CommuniCube/master/other/img/caseplans_boks.png)

## Video
*Kommer snart*

## Credits
Andreas Finn Hansen ([@andrefh](https://github.com/andrefh))  
Andreas Nyborg Hansen ( [@AndreasNH](https://github.com/AndreasNH))  
Bendik Hess-Bolstad (@???)  
Julie Hagen Nilsen (@???)  
Ståle Hoberg ([@staaleho](https://github.com/staaleho))  
Tonje Mjøvik (@???)
