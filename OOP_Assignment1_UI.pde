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
int projectState = 0;

void setup()
{
  fullScreen();
  
  BackgroundStart(); //Background
}

void draw()
{
  if(keyPressed && key == ' ')
  {
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