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

/* Boolean Variables for the Introduction Menu */
boolean mouseOnbox = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox = false; //Variable to highlight if box is pressed.

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
  int timeMove = millis(); //Problem
  
  switch(menuAdvance)
  {
    case 0:
      startMenu();;
      break;
    case 1:
    //timeMove = 0; //Setting it back to 0 seconds. Problem
    if(timeMove > 5000) //5 seconds
    {
      BackgroundStart();
    } 
    else
    {
      loadingScreen();
    }
    
    if(timeMove > 7000) //7 seconds
    {
      BAraxxorStart();
    }
    
    if(timeMove > 9000) //9 seconds
    {
      BMBackground();
    }
    
    if(timeMove > 11000) //11 seconds
    {
      YakamaruB();
    }
    
    if(timeMove > 15000) //15 seconds
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
  image(telosBackgroundImage, 0, 0); //Image Position 
}

void BAraxxorStart()
{
  PImage araxxorBackgroundImage; //Image Variable
  
  araxxorBackgroundImage = loadImage("AraxxorBackground.png"); //Loading the image
  araxxorBackgroundImage.resize(displayWidth, displayHeight); //Image Size
  image(araxxorBackgroundImage, 0, 0); //Image Position
}

void BMBackground()
{
  PImage BMB; //Image Variable
  
  BMB = loadImage("BMB.png"); //Loading the image
  BMB.resize(displayWidth, displayHeight); //Image Size
  image(BMB, 0, 0); //Image Position 
}

void YakamaruB()
{
  PImage YakaB; //Image Variable
  
  YakaB = loadImage("YakamaruB.png"); //Loading the image
  YakaB.resize(displayWidth, displayHeight); //Image Size
  image(YakaB, 0, 0); //Image Position 
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
  
  selectStart.selectDisplay(); //Start Object
  text("Start", 
        displayWidth / 3.5,
        displayHeight / 1.91); //Start the game message. 
        
  selectEnd.selectDisplay(); //End Object
  text("End", 
        displayWidth / 1.59,
        displayHeight / 1.91); //Ending the game message.
        
}

void mousePressed() 
{
  if(!mouseOnbox == true) //If true
  {
    if(noMusicLoop == 0)
    {
      mousePressedOnbox = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
    
      backgroundMusic = new  SoundFile(this, "BMusic.mp3");
      backgroundMusic.play();
      menuAdvance = 1; //Setting to 1 so it doesn't overlap.
      noMusicLoop = 1; //Making sure the music doesn't break.
    }
  } 
  else 
  {
    mousePressedOnbox = false; //If not, set to false.
  }
  
  if(mouseOnbox == true) //If true
  {     
    mousePressedOnbox = true; //Set variable to true
    fill(255, 255, 255); //To highlight the box.
    clickSound = new SoundFile(this, "Click.mp3");
    clickSound.play();
    exit(); //Terminating the program
  } 
  else 
  {
    mousePressedOnbox = false; //If not, set to false.
  }
  
  //Character Menu Part (Telos)
  if(mouseOnbox == true) //If true
  {
    if(charNoMusic == 0)
    {
      mousePressedOnbox = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
      charNoMusic = 1;
      telosAdv = 1;
    }
  } 
  else 
  {
    mousePressedOnbox = false; //If not, set to false.
  }
  
  //Character Menu Part (Araxxor)
  if(mouseOnbox == true) //If true
  {
    if(charNoMusic == 0)
    {
      mousePressedOnbox = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
      charNoMusic = 1;
      raxAdv = 1;
    }
  } 
  else 
  {
    mousePressedOnbox = false; //If not, set to false.
  }
}

void mouseReleased() 
{
  mousePressedOnbox = false; //If mouse released set it back to false.
}

void characterSelect()
{
  background(0,0,0,255); //Background colour.
  fill(255);
  
  textSize(50); //Text size for my name.
  text("Select your character:", 
        displayWidth / 2.9,
        displayHeight / 3.5); //My name message.       

  selectTelos.selectDisplay(); //Telos Object
  text("Telos", 
        displayWidth / 3.5,
        displayHeight / 1.91); //My name message.
        
  selectAraxxor.selectDisplay(); //Araxxor Object
  text("Araxxor", 
        displayWidth / 1.69,
        displayHeight / 1.91); //My name message.      
}