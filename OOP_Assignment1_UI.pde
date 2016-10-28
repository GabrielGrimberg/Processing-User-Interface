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
ArrayList<Telos> telosArray = new ArrayList<Telos>(); //Expense Class
//int projectState = 0;
int movingSpeed = 0;

void setup()
{
  size(displayWidth, displayHeight);
  
  //BackgroundStart(); //Background
  
  //telosDataLoader();
  //telosDataPrint();
  
}

void draw()
{ 
  if(millis() > 6000) //6 seconds
  {
    BackgroundStart();
  }   
  else
  {
    loadingScreen();
  }
  
  if(millis() > 10000) //10 seconds
  {
    BAraxxorStart();
  }
  
  if(millis() > 20000) //20 seconds
  {
    //Choose character
  }
  
  /*
  if(keyPressed && key == 'R' || key == 'r')
  {
    clear();
    projectState = 1;
  }
  if(keyPressed && key == ' ')
  {
    clear();
    projectState = 2;
  }
  
  switch(projectState)
  {
    case 1:
      BackgroundStart();
      break;
    case 2: 
      TelosCharacter();
      break;
  }
  */
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