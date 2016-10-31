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
  
  void selectDisplay()
  {
    rectMode(RADIUS);
    
    if(mouseX > boxXPoint - sizeOfbox &&  //If statement to check
       mouseX < boxXPoint + sizeOfbox &&  //If the mouse is anywhere
       mouseY > boxYPoint - sizeOfbox &&  //near the box.
       mouseY < boxYPoint + sizeOfbox)    
       
    {
      mouseOnbox = true; //Set true, continue to mousePressed()
    
    if(mousePressedOnbox == false) 
    { 
      stroke(255);
      fill(204, 102, 0);
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
  fill(0);
  }
  
}