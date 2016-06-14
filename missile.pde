class missile
{
  private PVector  position;
  private  PVector vitesse;
  private PVector acceleration;

  boolean existe = true;
  float direction;
  int largeur = 10;
  float topspeed = 5;
  int index = 0;

  missile(PVector _position_cible, PVector _position_vaisseau, int _index)
  {
    this.vitesse = new PVector(0, 0);
  
    this.position= _position_cible.copy();
    //this.position.x=_position_vaisseau.x;
    //this.position.y=_position_vaisseau.y;

    this.acceleration = PVector.sub(_position_vaisseau, this.position);
    this.index = _index;
  }


  void affiche()
  {
    color c = color(255, 0, 0);  // Define color 'c'
    fill(c);  // Use color variable 'c' as fill color
    noStroke();
    rect(this.position.x-(this.largeur/2), this.position.y-(this.largeur/2), this.largeur, this.largeur);
    this.limites();
  }

  void deplace()
  {
    this.acceleration.normalize();
    this.acceleration.mult(0.2);

    this.vitesse.add(this.acceleration);
    // Limit the velocity by topspeed
    this.vitesse.limit(this.topspeed);
    // Location changes by velocity
    this.position.add(this.vitesse);
    collision();
  }

  void limites()
  {
    if ((this.position.x<0) || (this.position.x>width) || (this.position.y<0) || (this.position.y>height) )
    {
      this.existe=false;
    }
  }
  void collision()
  {
    for (int i = 0; i<lescibles.size(); i++)
    {
      if (this.index!=i)
      {
        cible lacible = lescibles.get(i);
        PVector levecteurcible = lacible.getvector();

        if (this.position.dist(levecteurcible)<15)
        {
          lacible.set_degat();
          this.existe = false;
        }
        // controle de collision missile vaisseau
        
      }
    }
    if (this.position.dist(monvaisseau.position)<15)
        {
         vies--; 
         this.existe = false;
        }
  }
}