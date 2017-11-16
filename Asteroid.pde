class Asteroid extends Floater
{
  private int rot = (int)(Math.random()*4+1)*(int)Math.pow(-1,(int)(Math.random()*2));
  public Asteroid()
  {
  	corners = 8;
    int [] xS = new int [corners];
    int [] yS = new int [corners];
    xS[0] = -4;
    xS[1] = -8;
    xS[2] = -8;
    xS[3] = -4;
    xS[4] = 4;
    xS[5] = 8;
    xS[6] = 8;
    xS[7] = 4;
    yS[0] = 8;
    yS[1] = 4;
    yS[2] = -4;
    yS[3] = -8;
    yS[4] = -8;
    yS[5] = -4;
    yS[6] = 4;
    yS[7] = 8;
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myDirectionX=(int)(Math.random()*2+1)*(int)Math.pow(-1,(int)(Math.random()*2));
    myDirectionY=(int)(Math.random()*2+1)*(int)Math.pow(-1,(int)(Math.random()*2));
    myPointDirection=0;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY=y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  public void move ()
  {
    turn(rot);
    super.move();
  }
}