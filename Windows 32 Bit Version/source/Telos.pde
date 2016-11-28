class Telos
{
  int Year;          //Year of boss.
  int HighestEnrage; //Highest Enrage done by a player.
  int AvgEnrage;     //Average Enrage by from everyone.
  String Package;    //Basiclly the loot you get when killing him.
  int MaxHit;        //Telos hardest hit.
  int MinHit;        //Telos minimum hit.
  
  Telos(String Seperate)
  {
    String[] Fields = Seperate.split(",");
    Year = Integer.parseInt(Fields[0]);
    HighestEnrage = Integer.parseInt(Fields[1]);
    AvgEnrage = Integer.parseInt(Fields[2]);
    Package = Fields[3];
    MaxHit = Integer.parseInt(Fields[4]);
    MinHit = Integer.parseInt(Fields[5]);  
  }
  
  Telos(TableRow Row)
  {
    Year = Row.getInt(0);
    HighestEnrage = Row.getInt(1);
    AvgEnrage = Row.getInt(2);
    Package = Row.getString(3);
    MaxHit = Row.getInt(4);
    MinHit = Row.getInt(5);
  }
  
  String toString()
  {
    return Year + "\t" 
    + HighestEnrage + "\t" 
    + AvgEnrage + "\t" 
    + Package + "\t" 
    + MaxHit + "\t" 
    + MinHit;
  }
  
}