class Telos
{
  int enrage;       //How mad the boss is
  int minimumHit;   //Lowest he can hit
  int maximumHit;   //Hardest he can hit
  String lootTable; //Basiclly the loot you get when killing him
  
  //Default contructor
  Telos()
  {
    enrage = 0;            //Intizilazing to 0
    minimumHit = 0;        //Intizilazing to 0
    maximumHit = 0;        //Intizilazing to 0
    lootTable = "Bronze"; //Intizilazing to Bronze as it's the start.
  }
  
  //Paramaterised Constructor
  Telos( int enrage, int minimumHit, int maximumHit, String lootTable)
  {
    this.enrage = enrage;
    this.minimumHit = minimumHit;
    this.maximumHit = maximumHit;
    this.lootTable = lootTable;
  }
  
}