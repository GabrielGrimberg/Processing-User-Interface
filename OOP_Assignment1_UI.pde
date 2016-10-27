/***************************************** 
*                                        *
*  Authour: Gabriel Grimberg.            *
*  Module: Object Oriented Programming.  *
*  Type: Assignment 1.                   *
*  Language: Java (Processing).          *
*  Start Date: 25th of October 2016.     *
*  Due Date: 29th of November 2016.      *
*                                        *
******************************************/

/* Global Variables */
ArrayList<Telos> telosArray = new ArrayList<Telos>(); //Expense Class
int projectState = 0;

void setup()
{
  size(1270, 720);
  
  BackgroundStart(); //Background
  
  telosDataLoader();
  telosDataPrint();
  
}

void draw()
{  
  if(keyPressed && key == 'R' || key == 'r')
  {
    clear();
    projectState = 0;
  }
  if(keyPressed && key == ' ')
  {
    clear();
    projectState = 1;
  }
  
  switch(projectState)
  {
    case 0:
      BackgroundStart();
      break;
    case 1: 
      TelosCharacter();
      break;
  }
}

void BackgroundStart()
{
  int textPosX = 100; //Line X Position
  int textPosY = 650; //Line Y Position
  PImage telosBackgroundImage; //Image Variable
  
  telosBackgroundImage = loadImage("TelosBackground.jpg"); //Loading the image
  telosBackgroundImage.resize(displayWidth, displayHeight); //Image Size
  image(telosBackgroundImage, 0, 0); //Image Position
  
  text("Press Space to Continue", textPosX, textPosY); //Display text.
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
  Table DataText = loadTable("telosstats.txt", "tsv");
  
  telosArray.clear();
  
  for(int row = 0; row < DataText.getRowCount(); row++)
  {
    Telos telosStatsHolder = new Telos(DataText.getInt(row, 0), 
                                       DataText.getInt(row, 1), 
                                       DataText.getInt(row, 2), 
                                       DataText.getString(row, 3) 
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