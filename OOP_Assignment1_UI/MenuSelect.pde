class MenuSelect
{
  /* Variables for Start Menu */
  float boxXPoint; //Variable for the X Position.
  float boxYPoint; //Variable for the Y Position.
  int sizeOfbox = 100; //Variable for the size of the box
  int boxCurve = 50; //Variable for the curve of the box.
  
  MenuSelect(float boxXPoint, float boxYPoint, int sizeOfbox, int boxCurve)
  {
    this.boxXPoint = boxXPoint;
    this.boxYPoint = boxYPoint;
    this.sizeOfbox = sizeOfbox;
    this.boxCurve = boxCurve;
  }
  
  void selectDisplay1()
  {
    rectMode(RADIUS);
    
    if(mouseX > boxXPoint - sizeOfbox &&  //If statement to check
       mouseX < boxXPoint + sizeOfbox &&  //If the mouse is anywhere
       mouseY > boxYPoint - sizeOfbox &&  //near the box.
       mouseY < boxYPoint + sizeOfbox)    
       
    {
      mouseOnbox1 = true; //Set true, continue to mousePressed()
    
    if(mousePressedOnbox1 == false) 
    { 
      stroke(255);
      fill(204, 102, 0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnbox1 = false;
  }
  
  //Drawing the box.
  rect(boxXPoint, boxYPoint, sizeOfbox, sizeOfbox, boxCurve);
  fill(0);
  }
  
  void selectDisplay2()
  {
    rectMode(RADIUS);
    
    if(mouseX > boxXPoint - sizeOfbox &&  //If statement to check
       mouseX < boxXPoint + sizeOfbox &&  //If the mouse is anywhere
       mouseY > boxYPoint - sizeOfbox &&  //near the box.
       mouseY < boxYPoint + sizeOfbox)    
       
    {
      mouseOnbox2 = true; //Set true, continue to mousePressed()
    
    if(mousePressedOnbox2 == false) 
    { 
      stroke(255);
      fill(204, 102, 0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnbox2 = false;
  }
  
  //Drawing the box.
  rect(boxXPoint, boxYPoint, sizeOfbox, sizeOfbox, boxCurve);
  fill(0);
  }
  
  void selectDisplay3()
  {
    rectMode(RADIUS);
    
    if(mouseX > boxXPoint - sizeOfbox &&  //If statement to check
       mouseX < boxXPoint + sizeOfbox &&  //If the mouse is anywhere
       mouseY > boxYPoint - sizeOfbox &&  //near the box.
       mouseY < boxYPoint + sizeOfbox)    
       
    {
      mouseOnbox3 = true; //Set true, continue to mousePressed()
    
    if(mousePressedOnbox3 == false) 
    { 
      stroke(255);
      fill(204, 102, 0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnbox3 = false;
  }
  
  //Drawing the box.
  rect(boxXPoint, boxYPoint, sizeOfbox, sizeOfbox, boxCurve);
  fill(0);
  }
  
  void selectDisplay4()
  {
    rectMode(RADIUS);
    
    if(mouseX > boxXPoint - sizeOfbox &&  //If statement to check
       mouseX < boxXPoint + sizeOfbox &&  //If the mouse is anywhere
       mouseY > boxYPoint - sizeOfbox &&  //near the box.
       mouseY < boxYPoint + sizeOfbox)    
       
    {
      mouseOnbox4 = true; //Set true, continue to mousePressed()
    
    if(mousePressedOnbox4 == false) 
    { 
      stroke(255);
      fill(204, 102, 0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnbox4 = false;
  }
  
  //Drawing the box.
  rect(boxXPoint, boxYPoint, sizeOfbox, sizeOfbox, boxCurve);
  fill(0);
  }
  
  void SkipMenuFxn()
  {
    rectMode(RADIUS);
    
    if(mouseX > boxXPoint - sizeOfbox &&  //If statement to check
       mouseX < boxXPoint + sizeOfbox &&  //If the mouse is anywhere
       mouseY > boxYPoint - sizeOfbox &&  //near the box.
       mouseY < boxYPoint + sizeOfbox)    
       
    {
      mouseOnboxSkip = true; //Set true, continue to mousePressed()
    
    if(mousePressedOnSkip == false) 
    { 
      stroke(255);
      fill(204, 102, 0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseOnboxSkip = false;
  }
  
  //Drawing the box.
  rect(boxXPoint, boxYPoint, sizeOfbox, sizeOfbox, boxCurve);
  fill(0);
  }
  
}