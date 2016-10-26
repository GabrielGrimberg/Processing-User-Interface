class Telos
{
  int enrage;
  int minimumHit;
  int maximumHit;
  String lootTable;
  
  //Default contructor
  Telos()
  {
    enrage = 0;            //Intizilazing to 0
    minimumHit = 0;        //Intizilazing to 0
    maximumHit = 0;        //Intizilazing to 0
    lootTable = "Default"; //Intizilazing to 0
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