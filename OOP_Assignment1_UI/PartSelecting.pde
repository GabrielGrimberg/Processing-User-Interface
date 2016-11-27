class PartSelecting
{
  PVector Location;
  boolean circleGlow;
  
  PartSelecting(float xPos, float yPos, boolean glowingPart)
  {
    Location = new PVector(xPos,yPos);
    circleGlow = glowingPart;
  }
  void CircleDisplay()
  {
    if(circleGlow == true)
    {
      //How fast and how much the circles expands.
      float glowRadius = 100.0 + 10 * sin(frameCount / (2 * frameRate) * TWO_PI);
      
      //Stroke weight for the circle.
      
      //Colour for the circle.
      strokeWeight(1.2);
      fill(255, 0);
      
      //Resizing of the circle.
      for(int i = 0; i < glowRadius; i++)
      {
        stroke(255, 255.0 * (1 - i / glowRadius) );
        ellipse(Location.x, Location.y, i, i);
      }
    }

  }
}