import java.util.Map;


// global variables
int mainX = 520;
int mainY = 720;
String timerDisplayText = "Welcome to My Microwave";
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
int presetLabelY=90;
int presetRow1Y=125;
int presetTimeDisplayRow1Y=155;
int presetRow2Y=200;
int presetTimeDisplayRow2Y=230;
int functionsRowY=280;
int numberRow1Y=350;
int numberRow2Y=425;
int numberRow3Y=500;
int numberRow4Y=575;
int letterRowY=625;
int savedTime;
int totalTime = 1000;
int timerCount = 0;
boolean doorOpen = false;

void setup() {
  size(520,720);
  
  //setting default values for the preset names and times
  presetTimes = new StringList();
  presetNames = new StringList();
  //loading default values
  for(int i = 0; i < presetButtonCount; i++){
      presetTimes.append("0");
      presetNames.append("Empty");
  }
  //saving time for the timer
  savedTime = millis();
}

void draw() {
  background(0);
  stroke(255);
  
  // This is the global timer.  It checks if 1 sec has passed.  Cooking Funcitons below use this timer for cook duration  
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    if(cooking){
      if(timerCount>0){
        timerDisplayText = getDisplayTimeFromString(timerCount + "");
        savedTime = millis(); // Save the current time to restart the timer!
        timerCount--;
      }else{
        timerDisplayText="Cooking Complete";
        timerCount=0;
        cookingTime="";
        cooking=false;
      }
    }
  }
  
  //adding the Display Section
  fill(0,0,255);
  textSize(28);
  textAlign(CENTER);
  text(timerDisplayText, 250, displayY);
  
  //adding the Preset Label
  fill(150);
  textSize(20);
  textAlign(CENTER);
  text("Presets", 250, presetLabelY);
  
  // adding Preset Buttons to the display
  presetButton(100,presetRow1Y,getPresetName(0),0);
  presetButton(200,presetRow1Y,getPresetName(1),1);
  presetButton(300,presetRow1Y,getPresetName(2),2);
  presetButton(400,presetRow1Y,getPresetName(3),3);
  presetButton(100,presetRow2Y,getPresetName(4),4);
  presetButton(200,presetRow2Y,getPresetName(5),5);
  presetButton(300,presetRow2Y,getPresetName(6),6);
  presetButton(400,presetRow2Y,getPresetName(7),7);
  //adding Preset Times to the display
  presetTimeDisplay(100,presetTimeDisplayRow1Y,0);
  presetTimeDisplay(200,presetTimeDisplayRow1Y,1);
  presetTimeDisplay(300,presetTimeDisplayRow1Y,2);
  presetTimeDisplay(400,presetTimeDisplayRow1Y,3);
  presetTimeDisplay(100,presetTimeDisplayRow2Y,4);
  presetTimeDisplay(200,presetTimeDisplayRow2Y,5);
  presetTimeDisplay(300,presetTimeDisplayRow2Y,6);
  presetTimeDisplay(400,presetTimeDisplayRow2Y,7);
  //adding Function buttons to the display
  setPresetButton(100,functionsRowY,"Set Preset");
  enterButton(200,functionsRowY,"Enter");
  timedHeatingButton(300,functionsRowY,"Time Cook");
  timedHeatingButton(400,functionsRowY,"Time Defrost");
  
  int leftNumColumn = mainX - 395;
  int centerNumColumn = mainX - 265;
  int rightNumColumn = mainX - 125;
  
  //adding Numbered Function buttons to the display
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
  
  //adding Start/Clear Function buttons to the display
  clearButton(leftNumColumn, numberRow4Y, "Stop/Clear");
  startButton(rightNumColumn, numberRow4Y, "Start");
  
  //adding letter buttons to the display.  it is hidden until setting a preset is active
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
  
  //adding the door button
  doorButton(50, 680, "Door");
  
  
  //State labels show cooking/not cooking  and Door Open/Closed  states
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
  
  
  fill(155);
  textSize(18);
  if(doorOpen){
    text("Door Open", 430, 697);
  }else{
    text("Door Closed", 420, 697);
  }
  
  if(doorOpen){
    fill(255,0,0);
  }else{
    fill(0,255,0);
  }
  circle(500,690,30);

}

//Button functions

void doorButton(int x, int y, String s){
  
  int size = 30;
  int offset = size+20;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(255,255,0); // Yellow
    if (mousePressed){
      delay(200);
      if(doorOpen){
        doorOpen = false;
        timerDisplayUpdate("Door Closed");
      }else{
        doorOpen = true;
        timerDisplayUpdate("Door Open");
        cookReady=false;
        timeCook=false;
        cooking=false;
      }
    }
  } else {
    fill(255); // White
  }

  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}


void presetTimeDisplay(int x, int y, int id){
  
  int size = 20;
  fill(0,0,255);
  textAlign(CENTER);
  textSize(size);
  text(getDisplayTimeFromString(getPresetTime(id)), x, y);
  
}

void timedHeatingButton(int x, int y, String s){
  
  int size = 15;
  int offset = size+20;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size)) && !cooking && setPresetID==-1) {
    fill(255,255,0); // Yellow
    if (mousePressed){
      timerDisplayUpdate("Enter Time and press Enter");
      cookingTime="";
      settingCookTime=true;
    }
  } else {
    if(cooking || setPresetID>-1){
      fill(150); // Grey
    }else{
      fill(255); // White
    }
  }

  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}

void presetButton(int x, int y, String s, int id){
  
  int size = 20;
  int offset = size+10;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size)) && !settingCookTime && !cooking) {
    fill(255,255,0); // Yellow
    if (mousePressed){
      if((settingPresetName)){
        delay(200);
        setPresetID = id;
        resetPresetName(setPresetID);
        timerDisplayUpdate("Enter Name then Press Enter");
      }else if(settingPresetTime){
        timerDisplayUpdate("Finish Setting Time for " + getPresetName(setPresetID));
      }else{
         if(!doorOpen){
           //updates the time count so that the global timer will start countin down
           // sets the cooking  state to to true
           timerDisplayUpdate("Cooking " + getPresetName(id));
           cooking = true;
           timerCount = Integer.parseInt(getPresetTime(id));
         }else{
           timerDisplayUpdate("Close Door Before Cooking");
         }
      }
    }
  } else {
    if(settingCookTime || cooking){
      fill(150); // Grey
    }else{
      fill(255); // White
    }
  }
  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}

void setPresetButton(int x, int y, String s){
  
  int size = 20;
  int offset = size*2;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size)) && !settingCookTime && !cooking && setPresetID==-1)  {
    fill(255,255,0); // Yellow
    if (mousePressed){
      fill(0);
      settingPresetName = true;
      setPresetID=-1;
      timerDisplayUpdate("Choose Preset Button");
    }
  } else {
    if(settingCookTime || cooking || setPresetID > -1){
      fill(150); // Grey
    }else{
      fill(255); // White
    }
  }
  
  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}


void enterButton(int x, int y, String s){
  
  int size = 20;
  int offset = size+10;
  
  if ((mouseX >= (x - offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size)) && !settingCookTime && !cooking && setPresetID>-1) {
    fill(255,255,0); // Yellow
    if(settingPresetName && mousePressed){
      delay(200);
      String presetName = getPresetName(setPresetID);
      if(presetName.length() > 0){
        settingPresetName = false;
        settingPresetTime = true;
        resetPresetTime(setPresetID);
        timerDisplayUpdate("Set Time(Secs) and Press Enter");
      }else{
        timerDisplayUpdate("At Least One Charachter Required");
      }
    }else if (settingPresetTime && mousePressed){
      delay(200);
      String presetTime = getPresetTime(setPresetID);
      if(presetTime.length() > 0){
        timerDisplayUpdate(getPresetName(setPresetID) + " button set for " +  getDisplayTimeFromString(getPresetTime(setPresetID)));  
        settingPresetName = false;
        settingPresetTime = false;
        setPresetID = -1;  
      }else{
        timerDisplayUpdate("At Least One Number Required"); 
      }
    }
  } else {
    if(settingCookTime || cooking || setPresetID == -1){
      fill(150); // Grey
    }else{
      fill(255); // White
    }
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
    fill(255,255,0); // Yellow
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
    (mouseY <= y) && (mouseY >= (y - size)) && !cooking && !settingPresetName) {
    fill(255,255,0); // Yellow
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
        fill(255,255,0); // Yellow
      }
    }else{
      fill(255,255,0); // Yellow
    }
  } else {
    if(cooking || settingPresetName){
      fill(150); // Grey
    }else{
      fill(255); // White
    }
  }
  
  textSize(size);
  text(s, x, y);
}

void clearButton(int x, int y, String s){
  int size = 20;
  int offset = size + 25;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY <= y) && (mouseY >= (y - size))) {
    fill(255,255,0); // Yellow
    if (mousePressed){
      fill(0);
      setPresetID=-1;
      timerDisplayUpdate("Welcome to My Microwave");
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
  int size = 20;
  int offset = size + 10;
  
  if ((mouseX >= (x-offset)) && (mouseX <= (x + offset)) && 
    (mouseY < y) && (mouseY > (y - size)) && !cooking && !doorOpen && !settingPresetName && !settingPresetTime) {
    fill(255,255,0); // Yellow
    if (mousePressed){
      if(timeCook && cookingTime != ""){
        //updates the time count so that the global timer will start countin down
        // sets the cooking  state to to true
        timerDisplayUpdate("Time Cooking");
        cooking = true;
        settingCookTime=false;
        timerCount = Integer.parseInt(cookingTime);
      }else{
        fill(0);
        timerDisplayUpdate("Select Function or Preset");
      }
    }
  } else {
    if(cooking || doorOpen || settingPresetName || settingPresetTime){
      fill(150); // Grey
    }else{
      fill(255); // White
    }
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

//converts seconds to hours:minutes:seconds for display
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
