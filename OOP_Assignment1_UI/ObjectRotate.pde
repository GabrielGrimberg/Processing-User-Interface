class ObjectRotate
{
  /* Variables for Start Menu */
  float xPOS; //Variable for the X Position.
  float yPOS; //Variable for the Y Position.
  
  ObjectRotate(float xPOS, float yPOS)
  {
    this.xPOS = xPOS;
    this.yPOS = yPOS;
  }
  
  
  void returnOption()
  {
    //Green colour
    stroke(0,255,0);
    
    //360, because angle is 360.
    for(int i = 0; i < 360; i += 10)
    {
      float xPos = width / xPOS + sin(radians(i) ) * 40; //Size of X
      float yPos = height / yPOS + cos(radians(i) ) * 40; //Size of Y
      float Movement = map(dist(mouseX, mouseY, xPos, yPos), -100, 100, -bendAmount / 20, bendAmount /20);
      
      pushMatrix();
      translate(xPos, yPos); //Fixed position
      ellipse(-bendAmount, 0, Movement, Movement);//Drawing the circle.
      popMatrix();
    }
    
  }
}