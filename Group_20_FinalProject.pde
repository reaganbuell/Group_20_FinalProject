// when restart, the zombie does not return to the inital position
import java.util.Map;
Sprite a;
Enemy e;
Score s;
static Timer t;
static PImage bg,heart;
static PImage[] plfImg,btnImg;
static boolean left,right,up,down,mouse;


Enivornment en;

void setup(){
  size(1800,750);
  frameRate(60);
  
  en = new Enivornment();
  en.setupEnv();   
  
  t = new Timer();
  left = false; right = false; up = false; down = false;
}

void draw(){
  en.display();
  en.detectBttn();
  en.bttnAct();
  
  if(a.lives > 0 && en.currentScreen == "Game"){
    if(a.currentState == "Dead"){
      en.resetCoins();
    }
    t.update();
    t.display();
    a.update();
    a.display();
    e.update();
    e.display();
    if(en.detectFlag()){
      a.reset();
      e.reset();
      switch(en.currentScene){
        case "forest":
          en.setScene("winter");
          break;
        case "winter":
          en.setScene("desert");
          break;
        case "desert":
          en.setScene("graveyard");
          break;
        case "graveyard":
          en.setScreen("Win");
          break;
      }
    }
  }
  
  else if(en.currentScreen == "Win"){
      en.getScreen("Win").updateText(2,str(s.score+5*a.lives+10-int(t.frameCnt/240)));
  }
  else if(en.currentScreen == "Pause"){
    // pause
  }
  else{
    en.setScreen("Lose");
    en.getScreen("Lose").updateText(2,str(s.score+5*a.lives+10-int(t.frameCnt/240)));
  }
  
}


void mousePressed(){
  mouse = true;
}
void mouseReleased(){
  mouse = false;
}

void keyPressed(){
  switch (keyCode){
    case 37://left
      left = true;
      break;
    case 39://right
      right = true;
      break;
    case 38://up
      up = true;
      break;
    case 40://down
      down = true;
      break;
  }
}


void keyReleased(){
  switch (keyCode){
    case 37://left
      left = false;
      break;
    case 39://right
      right = false;
      break;
    case 38://up
      up = false;
      break;
    case 40://down
      down = false;
      break;
  }
}