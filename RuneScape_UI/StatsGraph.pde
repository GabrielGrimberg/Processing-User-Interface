class StatsGraph
{
  /* Telos */
  /* Making the graph */
  void telosGraphPlot()
  {
    StartingPoint = EndingPoint = telosArray.get(0).HighestEnrage; 
    for (Telos Enrage: telosArray)
    {
      if(Enrage.HighestEnrage < StartingPoint) //Getting the starting point for the graph.
      {
        StartingPoint = Enrage.HighestEnrage;
      }
      if (Enrage.HighestEnrage > EndingPoint) //Getting the ending point for the graph.
      {
        EndingPoint = Enrage.HighestEnrage;
      }    
    }
  }

  /* Drawing the graph */
  void telosGraphDraw()
  {
    stroke(0,255,0);
    line(Border, height - Border, width - Border, height - Border);
    line(Border, Border, Border, height - Border);
    
    
    for(int i = 1 ; i < telosArray.size() ; i ++)
    {
      stroke(0,255,0); //Colour of graph.
      
      //Graph position locations.
      float xPos1 = map(i - 1, 0, telosArray.size() - 1, Border, width - Border); 
      float yPos1 = map(telosArray.get(i - 1).HighestEnrage, StartingPoint, EndingPoint, height - Border, Border);
      float xPos2 = map(i, 0, telosArray.size() - 1, Border, width - Border);
      float yPos2 = map(telosArray.get(i).HighestEnrage, StartingPoint, EndingPoint, height - Border, Border);
      
      line(xPos1, yPos1, xPos2, yPos2); //Drawing the line from the coordinates found.
      
      //Display results while moving the mouse.
      if (mouseX >= xPos1 && mouseX <= xPos2)
      {      
        fill(0);
        rect(xPos1, yPos1, 5, 5);
        fill(255);
        text("Enrage: " + telosArray.get(i - 1).HighestEnrage, xPos1 + 10, yPos1);
        text("Maximum Hit: " + telosArray.get(i - 1).MaxHit, xPos1 + 10, yPos1 + 10);
        text("Minimum Hit: " + telosArray.get(i - 1).MinHit, xPos1 + 10, yPos1 + 20);
        text("Loot Table: " + telosArray.get(i - 1).Package, xPos1 + 10, yPos1 + 30);
      } 
    }  
  }
  
  /* Araxxor */
  /* Making the graph */
  void raxGraphPlot()
  {
    raxStartingPoint = raxEndingPoint = telosArray.get(0).HighestEnrage; 
    for (Rax Enrage: raxArray)
    {
      if(Enrage.HighestEnrage < raxStartingPoint) //Getting the starting point for the graph.
      {
        raxStartingPoint = Enrage.HighestEnrage;
      }
      if (Enrage.HighestEnrage > raxEndingPoint) //Getting the ending point for the graph.
      {
        raxEndingPoint = Enrage.HighestEnrage;
      }    
    }
  }
  
  /* Drawing the graph */
  void raxGraphDraw()
  {
    stroke(255,0,0);
    line(Border, height - Border, width - Border, height - Border);
    line(Border, Border, Border, height - Border);
    
    
    for(int i = 1 ; i < raxArray.size() ; i ++)
    {
      stroke(255,0,0); //Graph colour.
      
      //Graph position locations.
      float xPos1 = map(i - 1, 0, telosArray.size() - 1, Border, width - Border);
      float yPos1 = map(telosArray.get(i - 1).HighestEnrage, StartingPoint, EndingPoint, height - Border, Border);
      float xPos2 = map(i, 0, telosArray.size() - 1, Border, width - Border);
      float yPos2 = map(telosArray.get(i).HighestEnrage, StartingPoint, EndingPoint, height - Border, Border);
      
      line(xPos1, yPos1, xPos2, yPos2); //Drawing the line from the coordinates found.
      
      //Display results while moving the mouse.
      if (mouseX >= xPos1 && mouseX <= xPos2)
      {      
        fill(0);
        rect(xPos1, yPos1, 5, 5);
        fill(255);
        text("Enrage: " + raxArray.get(i - 1).HighestEnrage, xPos1 + 10, yPos1);
        text("Maximum Hit: " + raxArray.get(i - 1).MaxHit, xPos1 + 10, yPos1 + 10);
        text("Minimum Hit: " + raxArray.get(i - 1).MinHit, xPos1 + 10, yPos1 + 20);
        text("Loot Table: " + raxArray.get(i - 1).Package, xPos1 + 10, yPos1 + 30);
      } 
    }  
  }
      
}