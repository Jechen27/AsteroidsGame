class Bullet extends Floater
{
  public Bullet(Spaceship theShip)
  {	
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX = 5*Math.cos(dRadians)+theShip.getDirectionX();
    myDirectionY = 5*Math.sin(dRadians)+theShip.getDirectionY();
  }
  public void show()
  {
  	fill(myColor);   
    stroke(myColor);
    ellipse((float)myCenterX,(float)myCenterY,5,5);
  }
}