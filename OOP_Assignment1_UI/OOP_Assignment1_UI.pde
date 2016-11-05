/***************************************** 
*                                        *
*  Author: Gabriel Grimberg.             *
*  Module: Object Oriented Programming.  *
*  Type: Assignment 1.                   *
*  Language: Java (Processing).          *
*  Start Date: 25th of October 2016.     *
*  Due Date: 29th of November 2016.      *
*                                        *
******************************************/

/* Menu Objects */
MenuSelect selectStart;    //Object for Start Menu
MenuSelect selectEnd;      //Object for End Menu
MenuSelect selectTelos;    //Object for Telos Menu
MenuSelect selectAraxxor;  //Object for Araxxor Menu
LoadingScreen loadingWait; //Object for Loading Bar

import processing.sound.*;
SoundFile clickSound; //Clicking Sound.
SoundFile backgroundMusic; //Intro Music.

/* Global Variables */
/* Variables for reading for stats */
ArrayList<Telos> telosArray = new ArrayList<Telos>(); //Expense Class

/* Variables for Game State */
int menuAdvance = 0; //Advance variable from menu options.
int noMusicLoop = 0; //Making sure the music doesn't loop.
int charNoMusic = 0; //Making sure you can't hear the click again for second menu.
int telosAdv = 0; //Character state for Telos
int raxAdv = 0; //Character state for Araxxor

/*Variables for Loading Screen */
int movingSpeed = 0; //Speed the loading bar moves.

/* Boolean Variables for the Start Menu */
boolean mouseOnbox1 = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox1 = false; //Variable to highlight if box is pressed.
  
/* Boolean Variables for the End Menu */
boolean mouseOnbox2 = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox2 = false; //Variable to highlight if box is pressed.
    
/* Boolean Variables for the Telos Menu */
boolean mouseOnbox3 = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox3 = false; //Variable to highlight if box is pressed.
  
/* Boolean Variables for the Araxxor Menu */
boolean mouseOnbox4 = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox4 = false; //Variable to highlight if box is pressed.

/* Time Movement Variables */
float timeDelta = 0;
float rollingTheTime = 0;
int resetTime = 0;

/* Background Movement Speed Variables */
float cameraZoomTelos;
float cameraZoomRax;
float cameraZoomBM;
float cameraZoomYaka;
int noRepeatBG = 0; //Checker to stop the if statements which reduce the framerate.

/* Variables for the return option. */ 
float bendAmount = 20; //Used for the increase when mouse pointing away.


void setup()
{
  //size(displayWidth, displayHeight); //Edit out for now..
  fullScreen(); //Goes fullscreen.
  smooth();
  
  /* Creating new Objects */
  selectStart = new MenuSelect(width/3.0, height/2.0, 100, 50);
  selectEnd = new MenuSelect(width/1.5, height/2.0, 100, 50);
  selectTelos = new MenuSelect(width/3.0, height/2.0, 100, 50);
  selectAraxxor = new MenuSelect(width/1.5, height/2.0, 100, 50);
  loadingWait = new LoadingScreen(200);
  
  //telosDataPrint();
}

void draw()
{
  int programTimeRun = millis();
  timeDelta = (programTimeRun - resetTime) / 1000.0f;  
  resetTime = programTimeRun;
  
  rollingTheTime += timeDelta;
  
  switch(menuAdvance)
  {
    case 0:
      startMenu();;
      break;
    case 1:
    if(rollingTheTime > 5 && noRepeatBG == 0) //5 seconds
    {
      BackgroundStart();
    } 
    else
    {
      loadingScreen();
    }
    
    if(rollingTheTime > 10 && noRepeatBG == 0 || noRepeatBG == 1) //10 seconds
    {
      noRepeatBG = 1;
      BAraxxorStart();
    }
    
    if(rollingTheTime > 15 && noRepeatBG == 1 || noRepeatBG == 2) //15 seconds
    {
      noRepeatBG = 2;
      BMBackground();
    }
    
    if(rollingTheTime > 20 && noRepeatBG == 2 || noRepeatBG == 3) //20 seconds
    {
      noRepeatBG = 3;
      YakamaruB();
    }
    if(rollingTheTime > 25 && noRepeatBG == 3 || noRepeatBG == 4) //25 seconds
    {
      noRepeatBG = 4;
      menuAdvance = 2; //Moving into character select.
    }
    break;
      
    case 2:
    if(rollingTheTime > 25) //25 seconds
    {
      clear(); //Clears the introduction images.
      backgroundMusic.stop(); //Stops the background music.
      characterSelect();
    } 
    
    if(telosAdv == 1)
    {
      clear();
      TelosCharacter();
    }
    
    if(raxAdv == 1)
    {
      clear();
      AraxxorCharacter();
    }
    break;
  }
  
}

void BackgroundStart()
{
  PImage telosBackgroundImage; //Image Variable
  
  telosBackgroundImage = loadImage("TelosBackground.jpg"); //Loading the image
  telosBackgroundImage.resize(displayWidth, displayHeight); //Image Size
  image(telosBackgroundImage,0,0,displayWidth + cameraZoomTelos,displayHeight + cameraZoomTelos); //Image Position 
  cameraZoomTelos += 1; //Image movement speed.
}

void BAraxxorStart()
{
  PImage araxxorBackgroundImage; //Image Variable
  
  araxxorBackgroundImage = loadImage("rax.jpg"); //Loading the image
  araxxorBackgroundImage.resize(displayWidth, displayHeight); //Image Size
  image(araxxorBackgroundImage,0,0,displayWidth + cameraZoomRax,displayHeight + cameraZoomRax); //Image Position
  cameraZoomRax += 1; //Image movement speed.
}

void BMBackground()
{
  PImage BMB; //Image Variable
  
  BMB = loadImage("Nomad.jpg"); //Loading the image
  BMB.resize(displayWidth, displayHeight); //Image Size
  image(BMB,0,0,displayWidth + cameraZoomBM,displayHeight + cameraZoomBM); //Image Position
  cameraZoomBM += 1; //Image movement speed.
}

void YakamaruB()
{
  PImage YakaB; //Image Variable
  
  YakaB = loadImage("KK.jpg"); //Loading the image
  YakaB.resize(displayWidth, displayHeight); //Image Size
  image(YakaB,0,0,displayWidth + cameraZoomYaka,displayHeight + cameraZoomYaka); //Image Position
  cameraZoomYaka += 1; //Image movement speed.
}

void TelosCharacter()
{
  int telosXPos = 320;
  int telosYPos = 700;
  PImage telosImage; //Image Variable
  
  telosImage = loadImage("Telos.png"); //Loading the image
  telosImage.resize(telosXPos, telosYPos); //Image Size
  imageMode(CENTER);
  image(telosImage, displayWidth / 2, displayHeight / 2, 320, 700);
}

void AraxxorCharacter()
{
  int araxxorXPos = 977;
  int araxxorYPos = 609;
  PImage araxxorImage; //Image Variable
  
  araxxorImage = loadImage("Araxxor.png"); //Loading the image
  araxxorImage.resize(araxxorXPos, araxxorYPos); //Image Size
  imageMode(CENTER);
  image(araxxorImage, displayWidth / 2, displayHeight / 2,
                      displayWidth / 2, displayHeight / 2);
}

/* Method to load data from the telos file */
void telosDataLoader()
{  
  //Reading in the file, in tsv mode.
  Table telosText = loadTable("telosstats.txt", "tsv");
  
  telosArray.clear();
  
  for(int row = 0; row < telosText.getRowCount(); row++)
  {
    Telos telosStatsHolder = new Telos(telosText.getInt(row, 0), 
                                       telosText.getInt(row, 1), 
                                       telosText.getInt(row, 2), 
                                       telosText.getString(row, 3) 
                                      );
    
    telosArray.add(telosStatsHolder);
    
  } 
}

/* Method that Displays the text file */
void telosDataPrint()
{
  for(Telos telosStatsHolder: telosArray)
  {
    println(telosStatsHolder);
  }  
}

void loadingScreen()
{
    background(0,0,0,255); //Background colour.
    fill(255);
    textSize(60); //Text size for loading.
    text("Loading...", displayWidth / 2.55,displayHeight / 1.7); //Loading message.
    textSize(50); //Text size for my name.
    text("Gabriel Grimberg ", displayWidth / 2.9, displayHeight / 3.5); //My name message.
    fill(0,255,0); //Colour of bar
    stroke(0);
    
    loadingWait.loadingNow();
}

void startMenu()
{
  background(0,0,0,255); //Background colour.
  fill(255);
  
  textSize(50); //Text size for my name.
  text("Gabriel Grimberg", 
        displayWidth / 2.9,
        displayHeight / 3.5); //My name message.
  
  selectStart.selectDisplay1(); //Start Object
  text("Start", 
        displayWidth / 3.5,
        displayHeight / 1.91); //Start the game message. 
        
  selectEnd.selectDisplay2(); //End Object
  text("End", 
        displayWidth / 1.59,
        displayHeight / 1.91); //Ending the game message.
  
  returnOption();
        
}

void mousePressed() 
{
  mouseClickStart();  //For the Start Option (Menu 1)
  mouseClickEnd();    //For the End Option (Menu 1)
  mouseClickTelos();  //For the Telos Option (Menu 2)
  mouseClickAraxxor();//For the Araxxor Option (Menu 2)
}

void mouseReleased() 
{
  mousePressedOnbox1 = false; //If mouse released set it back to false.
  mousePressedOnbox2 = false; //If mouse released set it back to false.
  mousePressedOnbox3 = false; //If mouse released set it back to false.
  mousePressedOnbox4 = false; //If mouse released set it back to false.
}

void characterSelect()
{
  background(0,0,0,255); //Background colour.
  fill(255);
  
  textSize(50); //Text size for my name.
  text("Select your character:", 
        displayWidth / 2.9,
        displayHeight / 3.5); //My name message.       

  selectTelos.selectDisplay3(); //Telos Object
  text("Telos", 
        displayWidth / 3.5,
        displayHeight / 1.91); //My name message.
        
  selectAraxxor.selectDisplay4(); //Araxxor Object
  text("Araxxor", 
        displayWidth / 1.69,
        displayHeight / 1.91); //My name message.      
}

void mouseClickStart()
{
  if(mouseOnbox1 == true) //If true
  {
    if(noMusicLoop == 0)
    {
      mousePressedOnbox1 = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
    
      backgroundMusic = new  SoundFile(this, "BMusic.mp3");
      backgroundMusic.play();
      menuAdvance = 1; //Setting to 1 so it doesn't overlap.
      noMusicLoop = 1; //Making sure the music doesn't break.
      rollingTheTime = 0;
    }
  } 
  else 
  {
    mousePressedOnbox1 = false; //If not, set to false.
  }
}

void mouseClickEnd()
{
  if(mouseOnbox2 == true) //If true
  {     
    mousePressedOnbox2 = true; //Set variable to true
    fill(255, 255, 255); //To highlight the box.
    clickSound = new SoundFile(this, "Click.mp3");
    clickSound.play();
    exit(); //Terminating the program
  } 
  else 
  {
    mousePressedOnbox2 = false; //If not, set to false.
  }
}

void mouseClickTelos()
{
 //Character Menu Part (Telos)
  if(mouseOnbox3 == true) //If true
  {
    if(charNoMusic == 0)
    {
      mousePressedOnbox3 = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
      charNoMusic = 1;
      telosAdv = 1;
    }
  } 
  else 
  {
    mousePressedOnbox3 = false; //If not, set to false.
  } 
}

void mouseClickAraxxor()
{
  //Character Menu Part (Araxxor)
  if(mouseOnbox4 == true) //If true
  {
    if(charNoMusic == 0)
    {
      mousePressedOnbox4 = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
      charNoMusic = 1;
      raxAdv = 1;
    }
  } 
  else 
  {
    mousePressedOnbox4 = false; //If not, set to false.
  }
}

void returnOption()
{
  //360, because angle is 360.
  for(int i = 0; i < 360; i += 20)
  {
    float xPos = width/1.1+sin(radians(i)) * 40; //Size of X
    float yPos = height/1.2+cos(radians(i)) * 40; //Size of Y
    float Roating = map(dist(mouseX, mouseY, xPos, yPos), -100, 100, -bendAmount / 20, bendAmount /20);
    
    //Glow effect, still in work...
    for(int mousePointing = 2; mousePointing > 0; mousePointing -= 2)
    {
      pushMatrix();

      translate(xPos, yPos); //Fixed position
      //rotate(radians(90) - atan2(mouseX-xPos, mouseY-yPos)); May leave out...
      //Drawing the circle.
      ellipse(-bendAmount, 0, mousePointing-Roating, mousePointing-Roating);
      
      popMatrix();
    }
  }
}