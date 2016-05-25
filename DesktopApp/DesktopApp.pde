/**
 * Dette programmet vil kun kjore om det er koblet til 4 baser som kjører [ArduinoCode](https://github.com/designBuddies/CommuniCube/blob/master/ArduinoCode/ArduinoCode.ino) til
 * serialportene som koden spessefiserer. (COM5, COM6, COM7, COM9)
 *
 * Programmet er kun testet paa en Acer sonic master x550J med Windows 10.
 */
import processing.serial.*;

//Initialiserer variabler
Serial PortOne, PortTwo, PortThree, PortFour, PortFive, PortSix;
//Oppsett av writer;
PrintWriter output;
//Variabler for a holde diverse verdier
String value;
String bruker;
int svar;

//Setter dimensjoner for soylediagram
int distX = 100;
int distY = 550;

//Holdeverdier for svar.
int antSvar1 = 0;
int antSvar2 = 0;
int antSvar3 = 0;
int antSvar4 = 0;

//Oppsett av variabler for soylediagram
PFont font;
PFont heading;

//Variabler for lagring av data.
PrintWriter input;
String line;
BufferedReader reader;

void setup()
{
  //Leser inn fra sporsmolsfil, og oppretter utdatafil
  selectInput("Select a file to process:", "fileSelected");
  // Setter storrelse paa vinduet til applikasjon
  size(900,700);
  //Tekstformatering
  font = createFont("Arial",16,true);
  heading = createFont("Lobster", 32, true);
  //initialiserer USB-porter
  PortOne = new Serial(this, Serial.list()[0], 9600); // "COM5"
  PortTwo = new Serial(this, Serial.list()[1],9600); // "COM6"
  PortThree = new Serial(this, Serial.list()[2], 9600); // "COM7"
  PortFour = new Serial(this, Serial.list()[3],9600); // "COM9"

  //Leser fil frem til lineskift
  PortOne.bufferUntil('\n');
  PortTwo.bufferUntil('\n');
  PortThree.bufferUntil('\n');
  PortFour.bufferUntil('\n');
}

/**
 * Setter opp applikasjonsvindu
 */
void draw(){
  //applikasjonsvindu
   background(255,255,255,255);
   stroke(0, 0, 0, 255);
   fill(245,245,245);
   rect(130, 120, 560, 460, 10);
   line(distX+100, 552, distX+100, 150);
   line(distX+100, 552, distX+500, 552);
   stroke(0,0,0);
   fill(0,46,235);
   rect (100+distX, distY, 100, - antSvar1*100);
   fill(60,248,0);
   rect (200+distX, distY, 100, - antSvar2*100);
   fill(240,30,0);
   rect (300+distX, distY, 100, - antSvar3*100);
   fill(255,255,0);
   rect (400+distX, distY, 100, - antSvar4*100);
   textFont(font,16);
   fill(0);
   //Tekst X-akse
   text("Svar 1",120+distX, distY+20);
   text("Svar 2",220+distX, distY+20);
   text("Svar 3",320+distX, distY+20);
   text("Svar 4",420+distX, distY+20);
   //tekst Y-akse
   text("1",distX+80, 520);
   text("2",distX+80, 420);
   text("3",distX+80, 320);
   text("4",distX+80, 220);
   //heading
   textFont(heading,32);
   fill(0);
   text("CommuniCube", 300,100);
   if (value != null) {
     output.println(value);
     value = null;
    }
}

/**
 * Metode som kalles naar bruker avgir et svar
 * @param USB port som det skal leses fra
 */
void serialEvent(Serial thisPort) {
  try {
    if (thisPort == PortOne) {
      angiSvar(PortOne);
    }
    if(thisPort == PortTwo) {
      angiSvar(PortTwo);
    }
    if (thisPort == PortThree) {
      angiSvar(PortThree);
    }
    if (thisPort == PortFour) {
      angiSvar(PortFour);
    }
 }
 catch(Exception e) {
   println(e);
  }
}
/**
 * Leser inn fil basert paa brukervalg, og oppretter utfil.
 * @param Fil som det skal skrives til
 */
void fileSelected(File selection) {
   if (selection == null) {
     println("Window was closed or the user hit cancel.");
   } else {
     reader = createReader(selection.getAbsolutePath());
     try{
       line = reader.readLine();
     }catch(IOException io){
         line = null;
     }
     if(line == null){
       noLoop();
     }else{
       output = createWriter(line + ".txt");
     }

     try{
       line = reader.readLine();
     }catch(IOException io){
         line = null;
     }
     if(line == null){
       noLoop();
     }else{

       output.println(line);
     }
   }
}
/**
 * Metoden kalles nar serial mottar data. Svar printes.
 * @param serial som lytter etter data
 */
void angiSvar(Serial port){
  value = port.readStringUntil('\n');
  String[] arr = value.split(",");
  svar = Integer.parseInt(arr[1].replace("\n","").trim());
  bruker = arr[0];
  println(value);
  println(arr[0]);
  println(svar);
  if ( svar == 1) {
  antSvar1++;
  }
  if (svar == 2) {
    antSvar2++;
  }
  if (svar == 3) {
    antSvar3++;
  }
  if(svar == 4) {
    antSvar4++;
  }
}
/**
 * Skrivet til fil og avslutter programmet
 */
void keyPressed() {
  output.flush();
  output.close();
  exit();
}
