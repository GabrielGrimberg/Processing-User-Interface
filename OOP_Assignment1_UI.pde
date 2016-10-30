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
  
import processing.sound.*;
SoundFile clickSound;
SoundFile backgroundMusic;

/* Global Variables */
/* Variables for reading for stats */
ArrayList<Telos> telosArray = new ArrayList<Telos>(); //Expense Class

/* Variables for Game State */
int projectState = 0;
int menuAdvance = 0;
int noMusicLoop = 0; //Making sure the music doesn't loop.
int charNoMusic = 0; //Making sure you can't hear the click again.
int telosAdv = 0;
int raxAdv = 0;

/*Variables for Loading Screen */
int movingSpeed = 0; //Speed the loading bar moves.
//int timeMove = millis(); Problem

/* Boolean Variables for the Introduction Menu */
boolean mouseOnbox1 = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox1 = false; //Variable to highlight if box is pressed.
boolean mouseOnbox2 = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox2 = false; //Variable to highlight if box is pressed.

/* Boolean Variables for the Character Menu */
boolean telosBox = false; //Variable to check if the mouse is on the box.
boolean telosBoxPressed = false; //Variable to highlight if box is pressed.
boolean araxxorBox = false; //Variable to check if the mouse is on the box.
boolean araxxorBoxPressed = false; //Variable to highlight if box is pressed.

void setup()
{
  //size(displayWidth, displayHeight); //Edit out for now..
  fullScreen(); //Goes fullscreen.
 
}

void draw()
{
  if(menuAdvance == 0)
  {
    startMenu();
  }
  
  if(menuAdvance == 1)
  {
    //timeMove = 0; //Setting it back to 0 seconds. Problem
    
    if(millis() > 5000) //5 seconds
    {
      BackgroundStart();
    } 
    else
    {
      loadingScreen();
    }
    
    
    if(millis() > 7000) //7 seconds
    {
      BAraxxorStart();
    }
    
    if(millis() > 9000) //9 seconds
    {
      BMBackground();
    }
    
    if(millis() > 11000) //11 seconds
    {
      YakamaruB();
    }
    
    if(millis() > 15000) //15 seconds
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
    
  }//End for
  
}//End telosDataLoader()

/* Method that Displays the text file */
void telosDataPrint()
{
  for(Telos telosStatsHolder: telosArray)
  {
    println(telosStatsHolder);
  }
  
}//End telosDataPrint()

void loadingScreen()
{
  int sizeofBar = 200; //Size of the moving bar.
  
  for(movingSpeed = movingSpeed + 10; movingSpeed > 1000; movingSpeed = 10);
  {
    background(0,0,0,255); //Background colour.
    fill(255);
    textSize(60); //Text size for loading.
    text("Loading...", displayWidth / 2.55,displayHeight / 1.7); //Loading message.
    textSize(50); //Text size for my name.
    text("Gabriel Grimberg ", displayWidth / 2.9, displayHeight / 3.5); //My name message.
    fill(0,255,0); //Colour of bar
    stroke(0);
    
    quad(0 + movingSpeed, displayHeight / 1.6,
         sizeofBar + movingSpeed, displayHeight / 1.6,
         sizeofBar+movingSpeed, displayHeight / 1.456,
         0 + movingSpeed, displayHeight / 1.456); //Moving bar
         
    fill(0);
    
    quad(1500,displayHeight / 1.6,
         985,displayHeight / 1.6,
         985,displayHeight / 1.456,
         1500,displayHeight / 1.456); //Back to start
         
    quad(0, displayHeight / 1.6,
         displayWidth / 4.25,displayHeight / 1.6,
         displayWidth / 4.25,displayHeight / 1.456,
         0,displayHeight / 1.456); //Start from start
         
    noFill();
    stroke(255);
    
    quad(displayWidth / 4.25 ,displayHeight / 1.6,
         displayWidth / 1.3, displayHeight / 1.6,
         displayWidth / 1.3, displayHeight / 1.456,
         displayWidth / 4.25,displayHeight / 1.456); //The outter box
    stroke(0);
  }

}//End loadingScreen()

void startMenu()
{
  /* Variables for Start Menu (Box 1) */
  float box1XPoint; //Variable for the X Position.
  float box1YPoint; //Variable for the Y Position.
  int sizeOfbox1 = 100; //Variable for the size of the box
  int box1Curve = 50; //Variable for the curve of the box.
  
  /* Variables for Start Menu (Box 1) */
  float box2XPoint; //Variable for the X Position.
  float box2YPoint; //Variable for the Y Position.
  int sizeOfbox2 = 100; //Variable for the size of the box
  int box2Curve = 50; //Variable for the curve of the box.
  
  background(0,0,0,255); //Background colour.
  fill(255);
  
  /* For Option 1 */
  textSize(50); //Text size for my name.
  text("Gabriel Grimberg", 
        displayWidth / 2.9,
        displayHeight / 3.5); //My name message.       
  box1XPoint = width/3.0; //X Position of box.
  box1YPoint = height/2.0; //Y Position of box.
  
  rectMode(RADIUS);
  
  if(mouseX > box1XPoint - sizeOfbox1 &&  //If statement to check
     mouseX < box1XPoint + sizeOfbox1 &&  //If the mouse is anywhere
     mouseY > box1YPoint - sizeOfbox1 &&  //near the box.
     mouseY < box1YPoint + sizeOfbox1)    
  {
    mouseOnbox1 = true; //Set true, continue to mousePressed()
    
    if(!mousePressedOnbox1) 
    { 
      stroke(255);
      fill(153); 
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnbox1 = false;
  }
  
  //Drawing the box.
  rect(box1XPoint, box1YPoint, sizeOfbox1, sizeOfbox1, box1Curve);
  fill(0);
  text("Start", 
        displayWidth / 3.5,
        displayHeight / 1.91); //My name message.
  
  /* For Option 2 */      
  box2XPoint = width/1.5; //X Position of box.
  box2YPoint = height/2.0; //Y Position of box.
  
  rectMode(RADIUS);
  
  if(mouseX > box2XPoint - sizeOfbox2 &&  //If statement to check
     mouseX < box2XPoint + sizeOfbox2 &&  //If the mouse is anywhere
     mouseY > box2YPoint - sizeOfbox2 &&  //near the box.
     mouseY < box2YPoint + sizeOfbox2)    
  {
    mouseOnbox2 = true; //Set true, continue to mousePressed()
    
    if(!mousePressedOnbox2) 
    { 
      stroke(255);
      fill(153); 
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnbox2 = false;
  }
  
  //Drawing the box.
  rect(box2XPoint, box2YPoint, sizeOfbox2, sizeOfbox2, box2Curve);
  fill(0);
  text("End", 
        displayWidth / 1.59,
        displayHeight / 1.91); //My name message.
        
}//End startMenu()

void mousePressed() 
{
  if(mouseOnbox1) //If true
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
    }
  } 
  else 
  {
    mousePressedOnbox1 = false; //If not, set to false.
  }
  
  if(mouseOnbox2) //If true
  {     
    mousePressedOnbox2 = true; //Set variable to true
    fill(255, 255, 255); //To highlight the box.
    clickSound = new SoundFile(this, "Click.mp3");
    clickSound.play();
    exit(); //Terminating the program
  } 
  else 
  {
    mousePressedOnbox1 = false; //If not, set to false.
  }
  
  //Character Menu Part (Telos)
  if(telosBox) //If true
  {
    if(charNoMusic == 0)
    {
      telosBoxPressed = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
      charNoMusic = 1;
      telosAdv = 1;
    }
  } 
  else 
  {
    telosBoxPressed = false; //If not, set to false.
  }
  
  //Character Menu Part (Araxxor)
  if(araxxorBox) //If true
  {
    if(charNoMusic == 0)
    {
      araxxorBoxPressed = true; //Set variable to true
      fill(255, 255, 255); //To highlight the box.
      clickSound = new SoundFile(this, "Click.mp3");
      clickSound.play();
      charNoMusic = 1;
      raxAdv = 1;
    }
  } 
  else 
  {
    araxxorBoxPressed = false; //If not, set to false.
  }
}

void mouseReleased() 
{
  mousePressedOnbox1 = false; //If mouse released set it back to false.
  mousePressedOnbox2 = false; //If mouse released set it back to false.
  
  telosBoxPressed = false; //If mouse released set it back to false.
  araxxorBoxPressed = false; //If mouse released set it back to false.
}

void characterSelect()
{
  /* Variables for Start Menu (Box 1) */
  float telosXPoint; //Variable for the X Position.
  float telosYPoint; //Variable for the Y Position.
  int sizeTelos = 100; //Variable for the size of the box
  int curveTelos = 50; //Variable for the curve of the box.
  
  /* Variables for Start Menu (Box 1) */
  float raxXPoint; //Variable for the X Position.
  float raxYPoint; //Variable for the Y Position.
  int sizeRax = 100; //Variable for the size of the box
  int curveRax = 50; //Variable for the curve of the box.
  
  background(0,0,0,255); //Background colour.
  fill(255);
  
  /* For Option 1 */
  textSize(50); //Text size for my name.
  text("Select your character:", 
        displayWidth / 2.9,
        displayHeight / 3.5); //My name message.       
  telosXPoint = width/3.0; //X Position of box.
  telosYPoint = height/2.0; //Y Position of box.
  
  rectMode(RADIUS);
  
  if(mouseX > telosXPoint - sizeTelos &&  //If statement to check
     mouseX < telosXPoint + sizeTelos &&  //If the mouse is anywhere
     mouseY > telosYPoint - sizeTelos &&  //near the box.
     mouseY < telosYPoint + sizeTelos)    
  {
    telosBox = true; //Set true, continue to mousePressed()
    
    if(!telosBoxPressed) 
    { 
      stroke(255);
      fill(153); 
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    telosBox = false;
  }
  
  //Drawing the box.
  rect(telosXPoint, telosYPoint, sizeTelos, sizeTelos, curveTelos);
  fill(0);
  text("Telos", 
        displayWidth / 3.5,
        displayHeight / 1.91); //My name message.
  
  /* For Option 2 */      
  raxXPoint = width/1.5; //X Position of box.
  raxYPoint = height/2.0; //Y Position of box.
  
  rectMode(RADIUS);
  
  if(mouseX > raxXPoint - sizeRax &&  //If statement to check
     mouseX < raxXPoint + sizeRax &&  //If the mouse is anywhere
     mouseY > raxYPoint - sizeRax &&  //near the box.
     mouseY < raxYPoint + sizeRax)    
  {
    araxxorBox = true; //Set true, continue to mousePressed()
    
    if(!araxxorBoxPressed) 
    { 
      stroke(255);
      fill(153); 
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    araxxorBox = false;
  }
  
  //Drawing the box.
  rect(raxXPoint, raxYPoint, sizeRax, sizeRax, curveRax);
  fill(0);
  text("Araxxor", 
        displayWidth / 1.59,
        displayHeight / 1.91); //My name message.
        
}//End characterSelect()