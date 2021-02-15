int mainX = 520;
int mainY = 720;
String timerDisplayText = "Welcome";
int setPresetNumber = 0;
boolean cookReady = false;
boolean settingPreset = false;
boolean doOnce = false;
boolean mouseReleased = true;

String presetButton1Name = "Empty";
String presetButton2Name = "Empty";
String presetButton3Name = "Popcorn";
String presetButton4Name = "Empty";

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
  
  if ((mouseX > x) && (mouseX < (x + size)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // Grey
    if (mousePressed){
      print(settingPreset);
      print(setPresetNumber);
      if((settingPreset)){
        setPresetNumber = id;
        resetPresetName(setPresetNumber);
        timerDisplayUpdate("Enter Preset Name");
      }else{
        timerDisplayUpdate("Cooking " + getPresetName(id));
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
  
  if ((mouseX > x) && (mouseX < (x + size)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      fill(0);
      settingPreset = true;
      setPresetNumber=0;
      timerDisplayUpdate("Choose Preset Button");
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
 
  if ((mouseX >= x-3) && (mouseX <= (x + 3)) && 
    (mouseY <= y) && (mouseY > (y - size)) &&
    settingPreset) {
    fill(255,0,0);
    if(settingPreset && mousePressed){
        setPresetName(setPresetNumber,s);
    } 
  } else {
      if(settingPreset){
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
  
  if ((mouseX > x) && (mouseX < (x + size)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      
      if(settingPreset){
        //test;
      }
      
      fill(0);
      timerDisplayUpdate(s);
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
      setPresetNumber=0;
      timerDisplayUpdate("Welcome");
      cookReady=false;
      settingPreset=false;
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
