import java.util.Map;

int mainX = 520;
int mainY = 720;
String timerDisplayText = "Welcome";

boolean cookReady = false;

int presetButtonCount = 8;
boolean settingPresetName = false;
boolean settingPresetTime = false;
int setPresetID = -1;

boolean timeCook = false;
boolean timeDefrost = false;

String presetButton1Name = "POPCORN";
String presetButton2Name = "EMPTY";
String presetButton3Name = "EMPTY";
String presetButton4Name = "EMPTY";
String presetButton5Name = "EMPTY";
String presetButton6Name = "EMPTY";
String presetButton7Name = "EMPTY";
String presetButton8Name = "EMPTY";

  
StringList presetTimes;
StringList presetNames;

String presetButton1Time = "";
String presetButton2Time = "";
String presetButton3Time = "";
String presetButton4Time = "";

int displayY=40;
int presetRow1Y=100;
int presetRow2Y=150;
int functionsRowY=250;
int numberRow1Y=350;
int numberRow2Y=425;
int numberRow3Y=500;
int numberRow4Y=575;
int letterRowY=650;

void setup() {
  size(520,720);
  presetTimes = new StringList();
  presetNames = new StringList();
  
  for(int i = 0; i < presetButtonCount; i++){
      presetTimes.append("0");
      presetNames.append("BOOBS");
  } //<>//
}

void draw() {
  background(1);
  stroke(255);
  
  fill(0,0,255);
  textSize(28);
  textAlign(CENTER);
  text(timerDisplayText, 250, displayY);
  
  presetButton(100,presetRow1Y,getPresetName(0),0);
  presetButton(200,presetRow1Y,getPresetName(1),1);
  presetButton(300,presetRow1Y,getPresetName(2),2);
  presetButton(400,presetRow1Y,getPresetName(3),3);
  presetButton(100,presetRow2Y,getPresetName(4),4);
  presetButton(200,presetRow2Y,getPresetName(5),5);
  presetButton(300,presetRow2Y,getPresetName(6),6);
  presetButton(400,presetRow2Y,getPresetName(7),7);
  
  setPresetButton(100,functionsRowY,"Set Preset");
  enterButton(200,functionsRowY,"Enter");
  timedHeatingButton(300,functionsRowY,"Time Cook");
  timedHeatingButton(400,functionsRowY,"Time Defrost");
  
  int leftNumColumn = mainX - 395;
  int centerNumColumn = mainX - 265;
  int rightNumColumn = mainX - 125;
  
  numberedButton(leftNumColumn,numberRow1Y,"1");
  numberedButton(centerNumColumn,numberRow1Y,"2");
  numberedButton(rightNumColumn,numberRow1Y,"3");
  numberedButton(leftNumColumn,numberRow2Y,"4");
  numberedButton(centerNumColumn,numberRow2Y,"5");
  numberedButton(rightNumColumn,numberRow2Y,"6");
  numberedButton(leftNumColumn,numberRow3Y,"7");
  numberedButton(centerNumColumn,numberRow3Y,"8");
  numberedButton(rightNumColumn,numberRow3Y,"9");
  numberedButton(centerNumColumn,numberRow4Y,"0");
  
  clearButton(leftNumColumn, numberRow4Y, "Stop/Clear");
  startButton(rightNumColumn, numberRow4Y, "Start");
  
  letteredButton(10,letterRowY,"A");
  letteredButton(30,letterRowY,"B");
  letteredButton(50,letterRowY,"C");
  letteredButton(70,letterRowY,"D");
  letteredButton(90,letterRowY,"E");
  letteredButton(110,letterRowY,"F");
  letteredButton(130,letterRowY,"G");
  letteredButton(150,letterRowY,"H");
  letteredButton(170,letterRowY,"I");
  letteredButton(190,letterRowY,"J");
  letteredButton(210,letterRowY,"K");
  letteredButton(230,letterRowY,"L");
  letteredButton(250,letterRowY,"M");
  letteredButton(270,letterRowY,"N");
  letteredButton(290,letterRowY,"O");
  letteredButton(310,letterRowY,"P");
  letteredButton(330,letterRowY,"Q");
  letteredButton(350,letterRowY,"R");
  letteredButton(370,letterRowY,"S");
  letteredButton(390,letterRowY,"T");
  letteredButton(410,letterRowY,"U");
  letteredButton(430,letterRowY,"V");
  letteredButton(450,letterRowY,"W");
  letteredButton(470,letterRowY,"X");
  letteredButton(490,letterRowY,"Y");
  letteredButton(510,letterRowY,"Z");

}

void timedHeatingButton(int x, int y, String s){
  
  int size = 12;
  int offset = size+20;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // Grey
    if (mousePressed){
      timerDisplayUpdate("Enter Time");
    }
  } else {
    fill(255); // Black
  }

  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}

void presetButton(int x, int y, String s, int id){
  
  int size = 20;
  int offset = size+10;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // Grey
    if (mousePressed){
      if((settingPresetName)){
        setPresetID = id;
        resetPresetName(setPresetID);
        timerDisplayUpdate("Enter Name then Press Enter");
      }else{
        timerDisplayUpdate("Cooking " + getPresetName(id) + " for " + getPresetTime(id));
        //cook for saved time
      }
      //fill(0);
    }
  } else {
    fill(255); // Black
  }

  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}

void setPresetButton(int x, int y, String s){
  
  int size = 15;
  int offset = size*2;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      fill(0);
      settingPresetName = true;
      setPresetID=-1;
      timerDisplayUpdate("Choose Preset Button");
    }
  } else {
    fill(255); // Black
  }
  
  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}


void enterButton(int x, int y, String s){
  
  int size = 15;
  int offset = size+10;
  
  if ((mouseX >= (x - offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if(settingPresetName && mousePressed){
      delay(100);
      settingPresetName = false;
      settingPresetTime = true;
      resetPresetTime(setPresetID);
      timerDisplayUpdate("Set Cook Time and Press Enter");
    }else if (settingPresetTime && mousePressed){
      delay(100);
      timerDisplayUpdate(getPresetName(setPresetID) + " button set for " + getPresetTime(setPresetID));  
      settingPresetName = false;
      settingPresetTime = false;
      setPresetID = -1;  
    }
  } else {
    fill(255); // Black
  }
  
  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}


void letteredButton(int x, int y, String s){
  
  int size = 24;
  int offset = 3;
 
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY <= y) && (mouseY > (y - size)) &&
    settingPresetName) {
    fill(255,0,0);
    if(settingPresetName && mousePressed){
      delay(500);
      setPresetName(setPresetID,s);
    } 
  } else {
      if(settingPresetName && setPresetID > -1){
        fill(255);
      }else{
        fill(0);
      }
  }
  
  textSize(size);
  text(s, x, y);
  
}




void numberedButton(int x, int y, String s){
  
  int size = 28;
  int offset = 10;
  
  if ((mouseX > (x-offset)) && (mouseX < (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      
      if(settingPresetTime){
        delay(500);
        setPresetTime(setPresetID, s);
        timerDisplayUpdate(getPresetTime(setPresetID));
      }else
      
      fill(0);
      //timerDisplayUpdate(s);
    }
  } else {
    fill(255); // Black
  }
  
  textSize(size);
  text(s, x, y);
}

void clearButton(int x, int y, String s){
  int size = 15;
  
  if ((mouseX > x) && (mouseX < (x + size)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      fill(0);
      setPresetID=-1;
      timerDisplayUpdate("Welcome");
      cookReady=false;
      settingPresetName=false;
    }
  } else {
    fill(255); // Black
  }
  
  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
}


void startButton(int x, int y, String s){
  int size = 15;
  
  if ((mouseX > x) && (mouseX < (x + size)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      if(cookReady){
        fill(0);
        timerDisplayUpdate("Cooking");
        //cook
      }else{
        fill(0);
        timerDisplayUpdate("Select Cook Time or Preset");
      }
    }
  } else {
    fill(255); // Black
  }
  
  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
}

void timerDisplayUpdate(String s){
  timerDisplayText=s;
}

void resetPresetTime(int id){
  presetTimes.set(id,"");  
}

void setPresetTime(int id, String number){  
  String time = getPresetTime(id);
  time+=number;
  presetTimes.set(id,time);   
}

String getPresetTime(int id){
  return presetTimes.get(id);    
}

void resetPresetName(int id){
  presetNames.set(id,""); 
}

void setPresetName(int id, String letter){
  String name = getPresetName(id);
  name+=letter;
  presetNames.set(id,name); 
}

String getPresetName(int id){
  return presetNames.get(id); 
}
