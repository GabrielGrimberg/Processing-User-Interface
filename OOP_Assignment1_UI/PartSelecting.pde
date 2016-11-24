class PartSelecting
{
  PVector Location;
  boolean circleGlow;
  
  PartSelecting(float xPos, float yPos, boolean glowingPart)
  {
    Location = new PVector(xPos,yPos);
    circleGlow = glowingPart;
  }
  void display()
  {
    if(circleGlow == true)
    {
      float glowRadius = 100.0 + 15 * sin(frameCount / (3 * frameRate) * TWO_PI); 
      strokeWeight(2);
      fill(255, 0);
      
      for(int i = 0; i < glowRadius; i++)
      {
        stroke(255, 255.0 * (1 - i / glowRadius) );
        ellipse(Location.x, Location.y, i, i);
      }
    }

  }
}