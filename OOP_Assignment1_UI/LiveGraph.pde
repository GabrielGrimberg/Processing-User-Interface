class LiveGraph
{
  
  void graphRenderLive()
  {
    background(0);
    
    clear();
    //Going over and over through the tables.
    for(int i = 20; i < LiveGraph.getRowCount(); i++) 
    { 
      TableRow Row = LiveGraph.getRow(i);
      
      //Drawing the lines
      float FirstxPos = Row.getFloat("Width") * 5; 
      float FirstyPos = Row.getFloat("Height") * 5; 
   
      //Connecting the lines of the graph.
      if(i > 0) 
      {
        TableRow lastRow = LiveGraph.getRow(i-1);
        float lastXPos = lastRow.getFloat("Width") * 5; 
        float lastYPos = lastRow.getFloat("Height") * 5; 
        
        //Drawing the lines for the graph.
        line(lastXPos, lastYPos, FirstxPos, FirstyPos);
      }
    }
    
    //The update method to set the random values.
    TableRow Row = LiveGraph.addRow();
    
    //Random Values for Height
    Row.setFloat("Height", height / 5 * noise(LiveGraph.getRowCount() / 1.0));
    
    //Random Values for Width.
    Row.setFloat("Width", (LiveGraph.getRowCount()-1));
  }
    
}