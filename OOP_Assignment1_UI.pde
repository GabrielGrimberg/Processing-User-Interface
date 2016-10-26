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

void setup()
{
  fullScreen();
  
  BackgroundStart(); //Background
}

void draw()
{
  
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