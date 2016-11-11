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

import de.ilu.movingletters.*; //Lib for the text format.
import processing.sound.*; //Lib for the sound format.
import java.awt.Point;

/* Text Objects */
MovingLetters[] Word = new MovingLetters[3]; //<- How many enums.

/* Menu Objects */
MenuSelect selectStart;    //Object for Start Menu
MenuSelect selectEnd;      //Object for End Menu
MenuSelect selectTelos;    //Object for Telos Menu
MenuSelect selectAraxxor;  //Object for Araxxor Menu
LoadingScreen loadingWait; //Object for Loading Bar

SoundFile clickSound; //Clicking Sound.
SoundFile backgroundMusic; //Intro Music.
SoundFile telosCharMusic;
SoundFile araxxorCharMusic;

/* Global Variables */
/* Variables for reading for stats */
ArrayList<Telos> telosArray = new ArrayList<Telos>(); //Expense Class

/* Variables for Game State */
int menuAdvance = 0; //Advance variable from menu options.
int noMusicLoop = 0; //Making sure the music doesn't loop.
int charNoMusic = 0; //Making sure you can't hear the click again for second menu.
int telosAdv = 0; //Character state for Telos
int raxAdv = 0; //Character state for Araxxor
int noMusicRepeat = 0; //Stops the Musics in the Character Select from looping.

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
float cameraZoomNomad;
float cameraZoomBM;
float cameraZoomVind;
int noRepeatBG = 0; //Checker to stop the if statements which reduce the framerate.

/* Variables for the return option. */ 
float bendAmount = 20; //Used for the increase when mouse pointing away.


void setup()
{
  size(displayWidth, displayHeight); //Edit out for now..
  //fullScreen(); //Goes fullscreen.
  smooth();
  telosPrintData();
  for(TextForm Amount : TextForm.values())
  {
    Word[Amount.Pos] = new MovingLetters(this, Amount.Size, 0, 0);
  } 
  
  /* Creating new Objects */
  selectStart = new MenuSelect(width/3.0, height/2.0, 100, 50);
  selectEnd = new MenuSelect(width/1.5, height/2.0, 100, 50);
  selectTelos = new MenuSelect(width/3.0, height/2.0, 100, 50);
  selectAraxxor = new MenuSelect(width/1.5, height/2.0, 100, 50);
  loadingWait = new LoadingScreen(200);
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
      startTelos();
    } 
    else
    {
      loadingScreen();
    }
    
    if(rollingTheTime > 10 && noRepeatBG == 0 || noRepeatBG == 1) //10 seconds
    {
      noRepeatBG = 1;
      Araxxor();
    }
    
    if(rollingTheTime > 15 && noRepeatBG == 1 || noRepeatBG == 2) //15 seconds
    {
      noRepeatBG = 2;
      Nomad();
    }
    
    if(rollingTheTime > 20 && noRepeatBG == 2 || noRepeatBG == 3) //20 seconds
    {
      noRepeatBG = 3;
      BM();
    }
    if(rollingTheTime > 25 && noRepeatBG == 3 || noRepeatBG == 4) //20 seconds
    {
      noRepeatBG = 4;
      Vind();
    }
    if(rollingTheTime > 30 && noRepeatBG == 4 || noRepeatBG == 5) //25 seconds
    {
      noRepeatBG = 5;
      menuAdvance = 2; //Moving into character select.
    }
    break;
      
    case 2:
    if(rollingTheTime > 30) //25 seconds
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

void textDisplay(String text, TextForm size, int x, int y)
{
  Word[size.Pos].text(text, x, y);  
}

void startTelos()
{
  PImage telosPic; //Image Variable
  
  telosPic = loadImage("TelosBackground.jpg"); //Loading the image
  telosPic.resize(displayWidth, displayHeight); //Image Size
  image(telosPic,0,0,displayWidth + cameraZoomTelos,displayHeight + cameraZoomTelos); //Image Position 
  cameraZoomTelos += 1; //Image movement speed.
}

void Araxxor()
{
  PImage araxxorPic; //Image Variable
  
  araxxorPic = loadImage("rax.jpg"); //Loading the image
  araxxorPic.resize(displayWidth, displayHeight); //Image Size
  image(araxxorPic,0,0,displayWidth + cameraZoomRax,displayHeight + cameraZoomRax); //Image Position
  cameraZoomRax += 1; //Image movement speed.
}

void Nomad()
{
  PImage nomadPic; //Image Variable
  
  nomadPic = loadImage("Nomad.jpg"); //Loading the image
  nomadPic.resize(displayWidth, displayHeight); //Image Size
  image(nomadPic,0,0,displayWidth + cameraZoomNomad,displayHeight + cameraZoomNomad); //Image Position
  cameraZoomNomad += 1; //Image movement speed.
}

void BM()
{
  PImage BMPic; //Image Variable
  
  BMPic = loadImage("BM.jpg"); //Loading the image
  BMPic.resize(displayWidth, displayHeight); //Image Size
  image(BMPic,0,0,displayWidth + cameraZoomBM,displayHeight + cameraZoomBM); //Image Position
  cameraZoomBM += 1; //Image movement speed.
}

void Vind()
{
  PImage vindPic; //Image Variable
  
  vindPic = loadImage("Vind.jpg"); //Loading the image
  vindPic.resize(displayWidth, displayHeight); //Image Size
  image(vindPic,0,0,displayWidth + cameraZoomVind,displayHeight + cameraZoomVind); //Image Position
  cameraZoomVind += 1; //Image movement speed.
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
  
  if(noMusicRepeat == 0)
  {
    telosCharMusic = new  SoundFile(this, "TelosChar.mp3");
    telosCharMusic.play();
    noMusicRepeat = 1;
  }
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
  
  if(noMusicRepeat == 0)
  {
    araxxorCharMusic = new  SoundFile(this, "AraxxorChar.mp3");
    araxxorCharMusic.play();
    noMusicRepeat = 1;
  }
}

/* Method to load data from the telos file */
void telosLoadData()
{
  telosArray.clear();
  
  //Loading from a file.
  Table DataLoading = loadTable("telosstats.csv", "header");
  for(int i = 0 ; i < DataLoading.getRowCount(); i ++)
  {
    TableRow Row = DataLoading.getRow(i);
    Telos DataObject = new Telos(Row);
    telosArray.add(DataObject);
  }
}

/* Method that Displays the text file */
void telosPrintData()
{
  for(Telos ShowMeData: telosArray)
  {
    println(ShowMeData);
  }
}

void loadingScreen()
{
    background(0); //Background colour.
    stroke(255); 
    textDisplay("Gabriel Grimberg", TextForm.Biggest, displayHeight / 2, 100);
    textDisplay("Loading", TextForm.Biggest, 525, 400);
    fill(0,255,0); //Colour of bar
    stroke(0);
    
    loadingWait.loadingAnimation();
    
    textDisplay("Please wait...", TextForm.Normal, 570, 515);
}

void startMenu()
{
  background(0); //Background colour.
  stroke(255);
  textDisplay("Gabriel Grimberg", TextForm.Biggest, displayHeight / 2, 100);
  
  selectStart.selectDisplay1(); //Start Object
  selectEnd.selectDisplay2(); //End Object

  returnOption();
  stroke(0); //Black colour for the letters.
  textDisplay("Start", TextForm.Biggest, 340, 370);
  textDisplay("End", TextForm.Biggest, 805, 370);
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
  background(0); //Background colour.
  stroke(255);
  textDisplay("Select your character", TextForm.Biggest, 260, 100);

  selectTelos.selectDisplay3(); //Telos Object
  selectAraxxor.selectDisplay4(); //Araxxor Object
  
  stroke(0); //Black colour for the letters.
  textDisplay("Telos", TextForm.Big, 360, 380);
  textDisplay("Araxxor", TextForm.Big, 770, 380);
     
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
  //Green colour
  stroke(0,255,0);
  
  //360, because angle is 360.
  for(int i = 0; i < 360; i += 20)
  {
    float xPos = width / 1.1 + sin(radians(i) ) * 40; //Size of X
    float yPos = height / 1.2 + cos(radians(i) ) * 40; //Size of Y
    float Movement = map(dist(mouseX, mouseY, xPos, yPos), -100, 100, -bendAmount / 20, bendAmount /20);
    
    pushMatrix();
    translate(xPos, yPos); //Fixed position
    //rotate(radians(90) - atan2(mouseX-xPos, mouseY-yPos)); //May leave out...
    ellipse(-bendAmount, 0, Movement, Movement);//Drawing the circle.
    popMatrix();
  }
  
}