int mainX = 520;
int mainY = 720;
String timerDisplayText = "Welcome";

boolean cookReady = false;


boolean settingPresetName = false;
boolean settingPresetTime = false;
int setPresetID = 0;


String presetButton1Name = "EMPTY";
String presetButton2Name = "EMPTY";
String presetButton3Name = "POPCORN";
String presetButton4Name = "EMPTY";

String presetButton1Time = "";
String presetButton2Time = "";
String presetButton3Time = "";
String presetButton4Time = "";

void setup() {
  size(520,720);
}

void draw() {
  background(1);
  stroke(255);
  
  fill(0,0,255);
  textSize(28);
  textAlign(CENTER);
  text(timerDisplayText, 250, 40);
  
  presetButton(100,80,presetButton1Name,1);
  presetButton(200,80,presetButton2Name,2);
  presetButton(300,80,presetButton3Name,3);
  presetButton(400,80,presetButton4Name,4);
  
  setPresetButton(100,250,"Set Preset");
  enterButton(200,250,"Enter");
  
 
  int leftNumColumn = mainX - 395;
  int centerNumColumn = mainX - 265;
  int rightNumColumn = mainX - 125;
  
  numberedButton(leftNumColumn,350,"1");
  numberedButton(centerNumColumn,350,"2");
  numberedButton(rightNumColumn,350,"3");
  numberedButton(leftNumColumn,425,"4");
  numberedButton(centerNumColumn,425,"5");
  numberedButton(rightNumColumn,425,"6");
  numberedButton(leftNumColumn,500,"7");
  numberedButton(centerNumColumn,500,"8");
  numberedButton(rightNumColumn,500,"9");
  numberedButton(centerNumColumn,575,"0");
  
  clearButton(leftNumColumn, 575, "Stop/Clear");
  startButton(rightNumColumn, 575, "Start");
  
  letteredButton(10,650,"A");
  letteredButton(30,650,"B");
  letteredButton(50,650,"C");
  letteredButton(70,650,"D");
  letteredButton(90,650,"E");
  letteredButton(110,650,"F");
  letteredButton(130,650,"G");
  letteredButton(150,650,"H");
  letteredButton(170,650,"I");
  letteredButton(190,650,"J");
  letteredButton(210,650,"K");
  letteredButton(230,650,"L");
  letteredButton(250,650,"M");
  letteredButton(270,650,"N");
  letteredButton(290,650,"O");
  letteredButton(310,650,"P");
  letteredButton(330,650,"Q");
  letteredButton(350,650,"R");
  letteredButton(370,650,"S");
  letteredButton(390,650,"T");
  letteredButton(410,650,"U");
  letteredButton(430,650,"V");
  letteredButton(450,650,"W");
  letteredButton(470,650,"X");
  letteredButton(490,650,"Y");
  letteredButton(510,650,"Z");

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
      setPresetID=0;
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
      setPresetID = 0;  
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
      if(settingPresetName && setPresetID > 0){
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
      setPresetID=0;
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
  
  if(id==1){
    presetButton1Time="";
  }else if (id==2){
    presetButton2Time="";
  }else if (id==3){
    presetButton3Time="";
  }else if (id==4){
    presetButton4Time="";
  }
   
}

void setPresetTime(int id, String time){
  
  if(id==1){
    presetButton1Time+=time;
  }else if (id==2){
    presetButton2Time+=time;
  }else if (id==3){
    presetButton3Time+=time;
  }else if (id==4){
    presetButton4Time+=time;
  }
   
}

String getPresetTime(int id){
  
  if(id==1){
    return presetButton1Time;
  }else if (id==2){
    return presetButton2Time;
  }else if (id==3){
    return presetButton3Time;
  }else if (id==4){
    return presetButton4Time;
  }
  
  return "";
   
}

void resetPresetName(int id){
  
  if(id==1){
    presetButton1Name="";
  }else if (id==2){
    presetButton2Name="";
  }else if (id==3){
    presetButton3Name="";
  }else if (id==4){
    presetButton4Name="";
  }
   
}

void setPresetName(int id, String letter){
  
  if(id==1){
    presetButton1Name+=letter;
  }else if (id==2){
    presetButton2Name+=letter;
  }else if (id==3){
    presetButton3Name+=letter;
  }else if (id==4){
    presetButton4Name+=letter;
  }
   
}

String getPresetName(int id){
  
  if(id==1){
    return presetButton1Name;
  }else if (id==2){
    return presetButton2Name;
  }else if (id==3){
    return presetButton3Name;
  }else if (id==4){
    return presetButton4Name;
  }
  
  return "";
   
}
