import java.util.Map;

int mainX = 520;
int mainY = 720;
String timerDisplayText = "Welcome";

boolean cookReady = false;
boolean cooking = false;

int presetButtonCount = 8;
boolean settingPresetName = false;
boolean settingPresetTime = false;
boolean settingCookTime = false;
int setPresetID = -1;

boolean timeCook = false;
boolean timeDefrost = false;

String cookingTime = "";
  
StringList presetTimes;
StringList presetNames;

int displayY=40;
int presetRow1Y=100;
int presetTimeDisplayRow1Y=130;
int presetRow2Y=170;
int presetTimeDisplayRow2Y=200;
int functionsRowY=300;
int numberRow1Y=350;
int numberRow2Y=425;
int numberRow3Y=500;
int numberRow4Y=575;
int letterRowY=625;

int savedTime;
int totalTime = 1000;
int timerCount = 0;

void setup() {
  size(520,700);
  presetTimes = new StringList();
  presetNames = new StringList();
  
  for(int i = 0; i < presetButtonCount; i++){
      presetTimes.append("5");
      presetNames.append("stuff");
  } //<>//
  
  savedTime = millis();
}

void draw() {
  background(0);
  stroke(255);
  
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  //print(timerCount);
  if (passedTime > totalTime) {
    if(cooking){
      if(timerCount>0){
        timerDisplayText = getDisplayTimeFromString(timerCount + "");
        savedTime = millis(); // Save the current time to restart the timer!
        timerCount--;
      }else{
        timerDisplayText="Cooking Complete";
        timerCount=0;
        cooking=false;
      }
    }
  }
  
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
  
  presetTimeDisplay(100,presetTimeDisplayRow1Y,0);
  presetTimeDisplay(200,presetTimeDisplayRow1Y,1);
  presetTimeDisplay(300,presetTimeDisplayRow1Y,2);
  presetTimeDisplay(400,presetTimeDisplayRow1Y,3);
  presetTimeDisplay(100,presetTimeDisplayRow2Y,4);
  presetTimeDisplay(200,presetTimeDisplayRow2Y,5);
  presetTimeDisplay(300,presetTimeDisplayRow2Y,6);
  presetTimeDisplay(400,presetTimeDisplayRow2Y,7);
  
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
  
  
  fill(155);
  textSize(18);
  if(cooking){
    text("Cooking", 440, 656);
  }else{
    text("Not Cooking", 420, 656);
  }
  
  if(cooking){
    fill(255,0,0);
  }else{
    fill(0,255,0);
  }
  circle(500,650,30);

}


void presetTimeDisplay(int x, int y, int id){
  
  int size = 20;
  fill(0,0,255);
  textAlign(CENTER);
  textSize(size);
  text(getDisplayTimeFromString(getPresetTime(id)), x, y);
  
}

void timedHeatingButton(int x, int y, String s){
  
  int size = 12;
  int offset = size+20;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // Grey
    if (mousePressed){
      timerDisplayUpdate("Enter Time and press Enter");
      settingCookTime=true;
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
        delay(200);
        setPresetID = id;
        resetPresetName(setPresetID);
        timerDisplayUpdate("Enter Name then Press Enter");
      }else{
         timerDisplayUpdate("Cooking " + getPresetName(id));
         cooking = true;
         timerCount = Integer.parseInt(getPresetTime(id));
      }
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
      delay(200);
      settingPresetName = false;
      settingPresetTime = true;
      resetPresetTime(setPresetID);
      timerDisplayUpdate("Set Time(Secs) and Press Enter");
    }else if (settingPresetTime && mousePressed){
      delay(200);
      timerDisplayUpdate(getPresetName(setPresetID) + " button set for " +  getDisplayTimeFromString(getPresetTime(setPresetID)));  
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
  
  int size = 26;
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
  int offset = 20;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY <= y) && (mouseY >= (y - size))) {
    fill(150); // White
    if (mousePressed){  
      if(settingPresetTime){
        delay(500);
        if(getPresetTimeLengthById(setPresetID) < 4){
          setPresetTime(setPresetID, s);
          timerDisplayUpdate(getPresetTime(setPresetID));
        }else{
          timerDisplayUpdate("Max Cook Time Exceeded");
        }
      }else if (settingCookTime){
        delay(500);
        if(cookingTime.length() < 4){
          cookingTime+=s;
          cookReady=true;
          timeCook=true;
          timerDisplayUpdate(getDisplayTimeFromString(cookingTime));
        }else{
          timerDisplayUpdate("Max Cook Time Exceeded");
        }
      }else{
        fill(150);
      }
    }else{
      fill(150);
    }
  } else {
    fill(255); // Black
  }
  
  textSize(size);
  text(s, x, y);
}

void clearButton(int x, int y, String s){
  int size = 15;
  int offset = size + 25;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY <= y) && (mouseY >= (y - size))) {
    fill(150); // White
    if (mousePressed){
      fill(0);
      setPresetID=-1;
      timerDisplayUpdate("Welcome");
      cookReady=false;
      timeCook=false;
      cooking=false;
      settingCookTime=false;
      settingPresetName=false;
      cookingTime="";
      
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
  int offset = size + 10;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      if(timeCook){
        //fill(0);
        timerDisplayUpdate("Time Cooking");
        cooking = true;
        timerCount = Integer.parseInt(cookingTime);
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

int getPresetTimeLengthById(int id){
  String time = getPresetTime(id);
  return time.length();
}

String getDisplayTimeFromString(String time){
  
  String returnvalue = "";
  
  if(time.length()> 0){
    int intTime = Integer.valueOf(time);
    int totalMinutes = intTime / 60;
    int remainderSeconds= intTime % 60;
    int hours = totalMinutes / 60;
    int remainderMinutes = totalMinutes % 60;
    
    if(hours>0){
      returnvalue+= hours + ":";
    }
    
    if(remainderMinutes>0){
      if(hours>0){
        returnvalue+= padWithZeros(remainderMinutes) + ":";
      }else{
        returnvalue+= remainderMinutes + ":";
      }
    }
    
    if(remainderMinutes>0){
      returnvalue+= padWithZeros(remainderSeconds) + "";
    }else{
      returnvalue+= remainderSeconds + "";
    }
  }
  
  return returnvalue; 
}

String padWithZeros(int time){
  String returnValue = str(time);
  
  if(returnValue.length()<2){
    returnValue = "0" + time;
  }
  return returnValue;
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
