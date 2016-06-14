class torpille
{
  private PVector  position;
  private PVector vitesse;
  private PVector acceleration;
  private  boolean valide = true;

  torpille(PVector _souris, PVector _vaisseau)
  {
    this.vitesse = new PVector(0, 0);
    this.position= _souris.copy();
    this.acceleration = PVector.sub( _vaisseau, this.position);
  }

  void affiche()
  {

    color c = color(255, 128, 0);  // Define color 'c'
    fill(c);  // Use color variable 'c' as fill color
    ellipse(this.position.x, this.position.y, 15, 15) ;
  }

  void deplace()
  {
    this.acceleration.normalize();
    this.acceleration.mult(0.4);

    this.vitesse.add(this.acceleration);
    // Limit the velocity by topspeed
    this.vitesse.limit(5);
    // Location changes by velocity
    this.position.sub(this.vitesse); 
    limite();
  }

  void limite()
  {
    if (this.position.x<0 || this.position.x>width || this.position.y<0 || this.position.y>height)
    {
      this.valide = false;
    }
  }
  
    void collision()
  {
    for (int i = 0; i<lescibles.size(); i++)
    {
      
        cible lacible = lescibles.get(i);
        PVector levecteurcible = lacible.getvector();

        if (this.position.dist(levecteurcible)<30)
        {
          lacible.set_degat();
          this.valide = false;
        }
     
    }
  }
}