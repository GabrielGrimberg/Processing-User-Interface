class LoadingScreen
{
  int sizeofBar = 200; //Size of the moving bar.
  
  LoadingScreen(int sizeofBar)
  {
    this.sizeofBar = sizeofBar;
  }
  
  void loadingAnimation()
  {
    for(movingSpeed = movingSpeed + 10; movingSpeed > 1000; movingSpeed = 10);
    {
      quad(0 + movingSpeed, displayHeight / 1.6,
           sizeofBar + movingSpeed, displayHeight / 1.6,
           sizeofBar+movingSpeed, displayHeight / 1.456,
           0 + movingSpeed, displayHeight / 1.456); //Moving bar
           
      fill(0);
      
      quad(1500,displayHeight / 1.6,
           985,displayHeight / 1.6,
           985,displayHeight / 1.456,
           1500,displayHeight / 1.456); //Back to start
           
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
  } 
}