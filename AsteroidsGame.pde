Spaceship bob = new Spaceship();
ArrayList <Asteroid> rockos= new ArrayList <Asteroid>();
ArrayList <Bullet> shootos= new ArrayList <Bullet>();
Stars [] starField = new Stars[50];
boolean accel = false;
boolean turnR = false;
boolean turnL = false;
boolean shoot = false;
boolean addAst = false;
boolean laser = false;
int timerS = 0;
int timerA = 0;
int lives = 3;
int score = 0;
int limiter = 0;
public void setup() 
{
  size(500,500);
  for (int i=0;i<starField.length;i++)
  starField[i] = new Stars();
  for (int i=0;i<10;i++)
  rockos.add(new Asteroid());
}
public void draw() 
{
  background(0);
  makeObj();
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
  checkCollision();
  for (int i=0;i<rockos.size();i++)
  rockos.get(i).show();
  for (int i=0;i<shootos.size();i++)
  shootos.get(i).show();
  textSize(12);
  text("Lives: "+lives,450,25);
  text("Score: "+score,10,25);
  if (lives<1)
  lives=0;
  if (lives == 0)
  {
  textSize(32);
  text("Game Over",170,250);
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
  if (key == ' ')
  shoot = true;
  if (key == 'r')
  addAst = true;
  if (key == 'l')
  laser = !laser;
}
public void keyReleased()
{
  if (key=='a')
  turnL = false;
  if (key=='d')
  turnR = false;
  if (key=='w')
  accel = false;
  if (key==' ')
  shoot = false;
  if (key=='r')
  addAst = false;
}
public void makeObj()
{
  timerS--;
  if (timerS < 0) {timerS=0;}
  if (shoot ==true && timerS==0)
  {
    shootos.add(new Bullet(bob));
    if (laser==true && limiter < 2)
    {
      timerS = 3;
      limiter++;
    }
    else
    {
    timerS = 50;
    limiter = 0;
    } 
  }
  timerA--;
  if (timerA < 0) {timerA=0;}
  if (addAst ==true && timerA==0)
  {
    rockos.add(new Asteroid());
    timerA = 50;
  }
}
public void checkCollision()
{
  for (int i=0;i<rockos.size();i++)
  {
    rockos.get(i).move();
    if (dist(rockos.get(i).getX(),rockos.get(i).getY(),bob.getX(),bob.getY())<=20)
    {
    rockos.remove(i);
    lives--;
    }
  }
  for (int i=0;i<shootos.size();i++)
  {
    shootos.get(i).move();
    for (int r=0;r<rockos.size();r++)
    if (dist(rockos.get(r).getX(),rockos.get(r).getY(),shootos.get(i).getX(),shootos.get(i).getY())<=20)
    {
      rockos.remove(r);
      shootos.remove(i);
      score+=100;
      if(score%1000==0)
      lives++;
      break;
    }
  }
}