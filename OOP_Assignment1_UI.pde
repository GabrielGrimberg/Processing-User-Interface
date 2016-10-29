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

/* Global Variables */
/* Variables for reading for stats */
ArrayList<Telos> telosArray = new ArrayList<Telos>(); //Expense Class

/* Variables for Game State */
int projectState = 0;

/*Variables for Loading Screen */
int movingSpeed = 0;
int timeMove = second();

/* Variables for Start Menu */
float boxXPoint; //Variable for the X Position.
float boxYPoint; //Variable for the Y Position.
int sizeOfbox = 100; //Variable for the size of the box
int boxCurve = 50; //Variable for the curve of the box.
boolean mouseOnbox = false; //Variable to check if the mouse is on the box.
boolean mousePressedOnbox = false; //Variable to highlight if box is pressed.

void setup()
{
  size(displayWidth, displayHeight);
  
  //BackgroundStart(); //Background
  
  //telosDataLoader();
  //telosDataPrint();
  
}

void draw()
{
  startMenu();
  
  if(keyPressed && key == 'Y' || key == 'y')
  {
    timeMove = 0; //Setting it back to 0 seconds.
    
    if(timeMove > 6) //6 seconds
    {
      BackgroundStart();
    }   
    else
    {
      loadingScreen();
    }
    
    if(timeMove > 10) //10 seconds
    {
      BAraxxorStart();
    }
    
    if(timeMove > 20) //20 seconds
    {
      //Choose character
    }
  }
  if(keyPressed && key == 'E' || key == 'e')
  {
    exit(); //Ending the programing.
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


void TelosCharacter()
{
  int telosXPos = 320;
  int telosYPos = 700;
  PImage telosImage; //Image Variable
  
  telosImage = loadImage("Telos.png"); //Loading the image
  telosImage.resize(telosXPos, telosYPos); //Image Size
  image(telosImage, 460, 20); //Image Position

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
    
    quad(displayWidth / 1.2,displayHeight / 1.6,
         displayWidth / 1.1,displayHeight / 1.6,
         displayWidth / 1.1,displayHeight / 1.456,
         displayWidth / 1.2,displayHeight / 1.456); //Back to start
         
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
  background(0,0,0,255); //Background colour.
  fill(255);
  textSize(50); //Text size for my name.
  text("Gabriel Grimberg ", 
        displayWidth / 2.9, displayHeight / 3.5); //My name message.
        
  boxXPoint = width/3.0; //X Position of box.
  boxYPoint = height/2.0; //Y Position of box.
  
  rectMode(RADIUS);
  
  if(mouseX > boxXPoint - sizeOfbox &&  //If statement to check
     mouseX < boxXPoint + sizeOfbox &&  //If the mouse is anywhere
     mouseY > boxYPoint - sizeOfbox &&  //near the box.
     mouseY < boxYPoint + sizeOfbox)    
  {
    mouseOnbox = true; //Set true, continue to mousePressed()
    
    if(!mousePressedOnbox) 
    { 
      stroke(255);
      fill(153); 
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnbox = false;
  }
  
  //Drawing the box.
  rect(boxXPoint, boxYPoint, sizeOfbox, sizeOfbox, boxCurve);
}
void mousePressed() 
{
  if(mouseOnbox) //If true
  { 
    mousePressedOnbox = true; //Set variable to true
    fill(255, 255, 255); //To highlight the box.
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