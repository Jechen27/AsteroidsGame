Spaceship bob = new Spaceship();
Asteroid [] rockos= new Asteroid[10];
Stars [] starField = new Stars[50];
boolean accel = false;
boolean turnR = false;
boolean turnL = false;
public void setup() 
{
  size(500,500);
  for (int i=0;i<starField.length;i++)
  starField[i] = new Stars();
  for (int i=0;i<rockos.length;i++)
  rockos[i] = new Asteroid();
}
public void draw() 
{
  background(0);
  if (accel==true)
  bob.accelerate(0.1);
  if (turnL==true)
  bob.turn(-3);
  if (turnR ==true)
  bob.turn(3);
  bob.move();
  bob.show();
  for (int i=0;i<starField.length;i++)
  starField[i].show();
  for (int i=0;i<rockos.length;i++)
  {
  rockos[i].move();
  rockos[i].show();
  }
}
public void keyPressed()
{
  if (key=='a')
  turnL = true;
  if (key=='d')
  turnR = true;
  if (key=='w')
  accel = true;
  if (key=='s')
  {
    bob.setX((int)(Math.random()*500));
    bob.setY((int)(Math.random()*500));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection((int)(Math.random()*360));
  }
}
public void keyReleased()
{
  if (key=='a')
  turnL = false;
  if (key=='d')
  turnR = false;
  if (key=='w')
  accel = false;
}