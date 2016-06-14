class cible{

 PVector coordonnes;
 
 ArrayList<missile> lesmissiles =  new ArrayList<missile>();
 int nb_missilles =0;
 int nb_max_missilles = 3;
 int vie = 10;
 int index = 0;
 boolean etat = true;
 int rayon = 15;
 
 cible(int _x,int _y, int _index, int _vies)
  {
 
    coordonnes = new PVector(_x,_y);
    this.index = _index;
    this.vie=_vies; 
  }
  void set_vies(int _vies)
  {
   this.vie=_vies; 
  }
  void affiche()
  {
    color c = color(255, 204, 0);  // Define color 'c'
    fill(c);  // Use color variable 'c' as fill color
    noStroke();  // Don't draw a stroke around shapes
   
    triangle(this.coordonnes.x,this.coordonnes.y-this.rayon,this.coordonnes.x+this.rayon,this.coordonnes.y+this.rayon,this.coordonnes.x-this.rayon,this.coordonnes.y+this.rayon);
    
    noFill();
    stroke(c);
    ellipse(this.coordonnes.x,this.coordonnes.y,2*this.rayon,2*this.rayon);
    
    fill(255, 255, 255);
    textSize(10);
    text("Vie = " + this.vie, this.coordonnes.x-(rayon), this.coordonnes.y-(1.5*rayon)); 
    
    for (int m=0; m < lesmissiles.size();m++)
{
 missile lemissile = lesmissiles.get(m);
 lemissile.deplace();
 lemissile.affiche();
 if (lemissile.existe==false)
 {
 lesmissiles.remove(m);
 nb_missilles--;
 }
}
    if (this.vie<=0)
    {
      this.etat=false;
    }
    int tiraleatoire = floor(random(100));
if (tiraleatoire<15)
{
  lesmechantstire();
}
  }
  
void lesmechantstire()
{
  if (floor(random(100))<proba_tir)
  {
  
 //cible lacible = lescibles.get(tir);
 ajoute_missille();
 
  }
}
  
  PVector getvector()
  {
   return this.coordonnes;
  }
  
  void ajoute_missille()
  {
    if (nb_missilles<nb_max_missilles){
      
    lesmissiles.add(new missile(this.getvector(),position,this.index)); 
    this.nb_missilles ++;
    }
  }
  
  void set_degat()
  {
   this.vie--; 
  }
  void kill_missilles()
  {
    for(int i = 0;i <lesmissiles.size();i++)
    {
      lesmissiles.remove(i);
    }
   
  }
}