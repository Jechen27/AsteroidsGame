class Stars //note that this class does NOT extend Floater
{
  private int myX,myY;
  public Stars()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show(){ellipse(myX,myY,2,2);}
}