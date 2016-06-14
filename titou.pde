
int rayon = 10;
int cadrillage = 40;

int proba_tir = 5;// probabilité de tir + eleve + difficile
PVector position;
vaisseau monvaisseau = new vaisseau();
PVector lasouris = new PVector(10,10);
float temps = 0;


ArrayList<cible> lescibles =  new ArrayList<cible>();


void setup(){
size(800,600); //taille de la fenetre
smooth(); // raffraichir la fenetre

position= new PVector(0,0);

// cree les cibles
creer_ennemies(nombredecibles);

}

void draw(){
background (0); // fond de couleur noir  

lasouris.x =mouseX;
 lasouris.y =mouseY;

 monvaisseau.affiche(lasouris);
 


noFill();
stroke(255);
for (int j=0;j<height;j+=cadrillage)
{
  for (int i = 0;i<width;i+=cadrillage)
  {
  rect(i,j,i+cadrillage,j+cadrillage);
  }
}
 fill(128, 128, 128);
 rect (0,0,150,65);


// afficher les cibles de la liste
for (int nc=0;nc<lescibles.size();nc++)
{
  cible lacible = lescibles.get(nc);
  if (lacible.etat==true)
  {
  lacible.affiche();
  }
  else
  {
    lacible.kill_missilles();
   lescibles.remove(nc); 
   score++;
  }
}




affichage();

// les ennemis sont tous deglingues passage au stage supèrieur
 if (score==nombredecibles)
 {
   nombredecibles++;
   creer_ennemies(nombredecibles);
   stage++;
   score = 0;
 }
}
void affichage()
{
  fill(255, 255, 255);
   textSize(15);
  text("Score = "+ score,10,15);
  text("Temps : de vol :"+millis()/1000,10,30);
  text("Stage : "+stage,10,45);
  text("Vie : "+vies,10,60);
}
void mouseMoved()
{
 position.x=mouseX;
 position.y=mouseY;
 lasouris.x =mouseX;
 lasouris.y =mouseY;
 monvaisseau.actualisation(lasouris);
}

void mousePressed()
{
   monvaisseau.tir();
 //lesmechantstire();
}

void creer_ennemies(int _nc)
{
 //creer une liste de cible
for (int nc=0;nc<_nc;nc++)
{
  lescibles.add(new cible((int)random(width),(int)random(height),nc, nombre_de_vie));
} 
}