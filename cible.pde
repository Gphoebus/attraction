class cible {

  PVector coordonnes;

  ArrayList<missile> lesmissiles =  new ArrayList<missile>(); // tableau de missile
  int nb_missilles =0;// nbr de missile en cours de tir
  int nb_max_missilles = 3;// nbr max de missille que peut tirer la cible simultanément
  int vie = 10; // nombre de vies de la cible
  int index = 0;// numero de la cible
  boolean etat = true;// touche
  int rayon = 15;// rayon de la cible
  boolean esttouche = false;
  int nb_maxi_clignotement = 4;
  int nb_clignotement = 0;
  int delai = 0;

  cible(int _x, int _y, int _index, int _vies)
  {

    coordonnes = new PVector(_x, _y);// nouvelle coordonnes de la cible
    this.index = _index; // index de la cible
    this.vie=_vies; // nb de vie de la cible
  }

  /**
   *affectation de vies a la cible
   **/
  void set_vies(int _vies)
  {
    this.vie=_vies;
  }

  /**
   *affichage de la cible
   **/
  void affiche()
  {
    if (this.esttouche==true){
     this.touche(); 
    }
    else
    {
      color c = color(255, 204, 0);  // Define color 'c'
      fill(c);  // Use color variable 'c' as fill color
      noStroke();  // Don't draw a stroke around shapes
    }
    float xcoin = rayon*cos(30*(PI/180));// calcul du sommet en x du cercle inscrit du triangle
    float ycoin =rayon*sin(30*(PI/180));// calcul du sommet en x du cercle inscrit du triangle
    // triangle(this.coordonnes.x,this.coordonnes.y-this.rayon,this.coordonnes.x+this.rayon,this.coordonnes.y+this.rayon,this.coordonnes.x-this.rayon,this.coordonnes.y+this.rayon);
    triangle(this.coordonnes.x, this.coordonnes.y-this.rayon, this.coordonnes.x+xcoin, this.coordonnes.y+ycoin, this.coordonnes.x-xcoin, this.coordonnes.y+ycoin);

 color c = color(255, 204, 0);  // Define color 'c'
    noFill();
    stroke(c);
    ellipse(this.coordonnes.x, this.coordonnes.y, 2*this.rayon, 2*this.rayon);

    fill(255, 255, 255);
    textSize(10);
    text("Vie = " + this.vie, this.coordonnes.x-(rayon), this.coordonnes.y-(1.5*rayon)); 

    for (int m=0; m < lesmissiles.size(); m++)
    {
      missile lemissile = lesmissiles.get(m);
      lemissile.deplace();
      lemissile.affiche();
      if (lemissile.existe==false)
      {
        lesmissiles.remove(m);
        this.nb_missilles--;
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
    if (nb_missilles<nb_max_missilles) {

      lesmissiles.add(new missile(this.getvector(), position, this.index)); 
      this.nb_missilles ++;
    }
  }

  void set_degat()
  {
    this.vie--;
    this.esttouche=true;
    this.delai= millis();
  }
  void kill_missilles()
  {
    for (int i = 0; i <lesmissiles.size(); i++)
    {
      lesmissiles.remove(i);
    }
  }

  void touche()
  {
    if (((millis()-this.delai)>0) && ((millis()-this.delai)<500))
    {
      color c = color(255, 100-(25*this.nb_clignotement), 0);  // Define color 'c'
      fill(c);  // Use color variable 'c' as fill color
      noStroke();  // Don't draw a stroke around shapes
      
      
    }
    if (((millis()-this.delai)>500) && ((millis()-this.delai)<1000))
    {
      color c = color(255, 204, 0);  // Define color 'c'
      fill(c);  // Use color variable 'c' as fill color
      noStroke();  // Don't draw a stroke around shapes
      //this.delai = millis();
      //this.nb_clignotement++;
      println("nochange");
      println(millis()-this.delai);
    }
    if ((millis()-this.delai)>1000)
      {
       this.delai = millis(); 
       this.nb_clignotement++;
      println("change");
      }
    
    if (this.nb_clignotement>=this.nb_maxi_clignotement)
    {
      this.esttouche = false;
      this.nb_clignotement=0;
      println("remise a zero");
    }
  }
}