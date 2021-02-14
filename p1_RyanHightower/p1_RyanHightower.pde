int mainX = 520;
int mainY = 720;
String timerDisplayText = "Welcome";
int setPresetNumber = 0;
boolean cookReady = true;

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
 
  
  String presetButton1Name = "Empty";
  String presetButton2Name = "Empty";
  String presetButton3Name = "Empty";
  String presetButton4Name = "Empty";
  
  presetButton(100,80,presetButton1Name);
  presetButton(200,80,presetButton2Name);
  presetButton(300,80,presetButton3Name);
  presetButton(400,80,presetButton4Name);
  
  setPresetButton(100,250,"Set Preset");
  
 
  int leftNumColumn = mainX - 395;
  int centerNumColumn = mainX - 265;
  int rightNumColumn = mainX - 125;
  
  numberedButton(leftNumColumn,350,"1","ABC");
  numberedButton(centerNumColumn,350,"2","DEF");
  numberedButton(rightNumColumn,350,"3","GHI");
  numberedButton(leftNumColumn,425,"4","JKL");
  numberedButton(centerNumColumn,425,"5","MNO");
  numberedButton(rightNumColumn,425,"6","PQR");
  numberedButton(leftNumColumn,500,"7","STU");
  numberedButton(centerNumColumn,500,"8","VWX");
  numberedButton(rightNumColumn,500,"9","YZ_");
  numberedButton(centerNumColumn,575,"0","");
  
  clearButton(leftNumColumn, 575, "Stop/Clear");
  startButton(rightNumColumn, 575, "Start");

}

void presetButton(int x, int y, String s){
  
  int size = 20;
  
  if ((mouseX > x) && (mouseX < (x + size)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      if(setPresetNumber>0){
        timerDisplayUpdate("Enter Preset Name");
      }else{
        timerDisplayUpdate("Cooking");
      }
      fill(0);
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
      setPresetNumber=1;
      timerDisplayUpdate("Choose Preset Button");
    }
  } else {
    fill(255); // Black
  }
  
  textAlign(CENTER);
  textSize(size);
  text(s, x, y);
  
}

void numberedButton(int x, int y, String s, String t){
  
  int size = 28;
  
  if ((mouseX > x) && (mouseX < (x + size)) && 
    (mouseY < y) && (mouseY > (y - size))) {
    fill(150); // White
    if (mousePressed){
      fill(0);
      timerDisplayUpdate(s);
    }
  } else {
    fill(255); // Black
  }
  
  textSize(size);
  text(s, x, y);
  textSize(12);
  text(t,x-3,y+15);
  
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
        setPresetNumber=0;
        timerDisplayUpdate("Cooking");
        //cook
      }else{
        fill(0);
        setPresetNumber=0;
        timerDisplayUpdate("Select Cook Time of Preset");
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
