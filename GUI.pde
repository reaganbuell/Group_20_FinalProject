class GUI {
  ArrayList<Button> bt;
  ArrayList<Box> bx;
  PImage wood;
  
  GUI() {
    this.bt = new ArrayList();
    this.bx = new ArrayList();
    wood = loadImage("GUI/wood.png");
    wood.resize(250,120);
  }

  void setupGUI() {
    s = new Score(0);
    t = new Timer();
    generateButtons();
    generateBoxes();
  }

  void display() {
    if(en.currentScreen == "Game"){
      image(wood,0,0);
      t.display();
      s.display();
      text("Life: ",30,60);
       // display lives
      for (int i = 0; i < a.lives; i ++) {
        image(heart, 80+20*i, 50);
      }
    }
    displayBttn(); 
    displayBox();
  }

  void generateBoxes() {
    String s = "How to play:";
    String b = "\n To move the character use the arrow keys. \n \n The objective of the game is to collect as many coins as possible while avoiding the enemies and reach the flag. There are 4 levels. \n \n Don't forget to type your initials in at the end of the game! \n \n To close this window click the 'X' at the top right corner of this box.";
    Box info = new Box("Box", 700, 500, s,b, new PVector(width/2-350, height/2-250),false);
    en.box.put("Info", info);
    
    //String h = "Catformer the Game";
    //String g = "";
    //Box menu = new Box("Box", 700, 500, h, g, new PVector(width/2-350, height/2-250), false);
    //en.box.put("Menu", menu);
    ////menu.setButtons();
    
    //String x = "The Game is Paused";
    //String y = "";
    //Box pause = new Box("Box", 700, 500, x, y, new PVector(width/2-350, height/2-250), false);
    //en.box.put("Pause", pause);
    
    String t = " High Scores";
    String d = "";
    Box high_score = new Box("Box", 700, 500, t, d, new PVector(width/2-350, height/2-250),true);
    en.box.put("High_score",high_score);
    
    String n = "Enter your name";
    String p = "";
    Box name = new Textbox("Text_box", 700, 500, n, p, new PVector(width/2-350, height/2-250),false);
    en.box.put("Name",name);
    
  }

  void generateButtons() {
    for (int i = 0; i < en.buttonName.length; i ++) {
      String n = en.buttonName[i];
      Button b = new Button(n,50);
      for (int j = 0; j < 3; j++) {
        b.loadImg(n+" (", ").png");
      }
      en.button.put(n, b);
    }
  }


  void detectBttn() {
    for (int i = 0; i < en.buttonName.length; i ++) {
      String n = en.buttonName[i];
      Button b = en.button.get(n);
      b.detect();
    }
  }

  void bttnAct() {
    Button pause = en.button.get("Pause");
    if (pause.status == "Clicked") {
      en.setScreen("Pause");
    }

    Button quit = en.button.get("Quit");
    if (quit.status == "Clicked") {
      exit();
    }

    Button resume = en.button.get("Resume");
    if (resume.status == "Clicked") {
      en.setScreen("Game");
    }

    Button restart = en.button.get("Restart");
    if (restart.status == "Clicked") {
      en.setScreen("Game");
      en.setScene("forest");
      a.reset();
      en.resetCoins();
      s.resetScore();
      t.resetTime();
      a.lives = 3;
    }

    Button info = en.button.get("Info");
    if (info.status == "Clicked") {
      en.setScreen("Home");
      Box infob = en.box.get("Info");
      infob.on = true;
    }
    
    Button high_score = en.button.get("High_score");
    if(high_score.status == "Clicked"){
      en.setScreen(en.currentScreen);
      Box bhigh_score = en.box.get("High_score");
      bhigh_score.on = true; 
    }

    Button home = en.button.get("Home");
    if (home.status == "Clicked") {
      en.setScene("forest");
      en.setScreen("Home");
    }

    Button start = en.button.get("Start");
    if (start.status == "Clicked") {
      en.setScreen("Game");
    }
    
    Button music = en.button.get("Music");
    if (music.status == "Clicked" && en.player.isPlaying()) {
      en.player.pause();
      music.status = "Normal";
    }
    if (music.status == "Clicked" && !en.player.isPlaying()) {
      en.player.play();
      music.status = "Normal";
    }  
  }

  

  // button 
  void displayBttn() {
    for (int i = 0; i < en.buttonName.length; i ++) {
      String n = en.buttonName[i];
      Button b = en.button.get(n);
      b.display();
    }
  }

  void displayBox() {
    for (int i = 0; i < en.boxName.length; i ++) {
      String n = en.boxName[i];
      Box b = en.box.get(n);
      b.display();
    }
  }
}