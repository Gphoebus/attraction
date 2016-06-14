 class vaisseau
 {
private PVector position = new PVector(10,10);;
private PVector acceleration = new PVector(0.01,0.01);
private PVector vitesse = new PVector(10,10); 
private PVector lasouris = new PVector(10,10);

private ArrayList<torpille> lestorpilles =  new ArrayList<torpille>();
  
private int torpilles_maxi = 4;
private int torpilles_lancee = 0;
   
  /*
  *  Constructeur vaisseau
  */
   vaisseau()
  {
    
  }
   
  void affiche(PVector _vecteur)
  {
     this.lasouris = _vecteur.copy();
   if (PVector.dist(this.lasouris,this.position)>25)
 {
   this.acceleration = this.lasouris.sub(position);
 this.acceleration.normalize();
 this.acceleration.mult(0.8);
 
 this.vitesse.add(this.acceleration);
 this.vitesse.limit(6);
  this.position.add(this.vitesse); 
 }
 else
 {
    line ((int)this.position.x,(int)this.position.y,this.lasouris.x,this.lasouris.y);
 }


// Affichage du vaisseau
 color c = color(0, 0,255);  // Define color 'c'
    fill(c);  // Use color variable 'c' as fill color 
ellipse ((int)this.position.x,(int)this.position.y,10,10); 


// affichage de l ombre du vaisseau
 c = color(128, 128,128);  // Define color 'c'
 stroke(c);
    noFill();  // Use color variable 'c' as fill color 
ellipse((int)this.position.x,(int)this.position.y,50,50);

for(int i=0;i<this.lestorpilles.size();i++)
{
 
 torpille latorpille = lestorpilles.get(i);
 if (latorpille.valide==true)
 {
  latorpille.affiche();
 latorpille.deplace();
 latorpille.collision();
 }
 else
 {
   this.lestorpilles.remove(i);
   this.torpilles_lancee--;
 }

} 

  }
   
   void tir()
   {
     if (this.torpilles_lancee<this.torpilles_maxi)
  {
   lestorpilles.add(new torpille(lasouris,position));  
   this.torpilles_lancee++;
  } 
   }
   void actualisation(PVector _vecteur)
   {
     this.lasouris = _vecteur.copy();
   }
 }