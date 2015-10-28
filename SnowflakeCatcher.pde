int sNum = 100;
Snowflake [] snow;
Person you;

void setup()
{
  size(800,600);
  background(20,48,87);
  snow = new Snowflake[sNum];
  for(int i = 0; i < snow.length; i++){
    snow[i] = new Snowflake();
  }
  you = new Person();
}
void draw()
{
  background(20,48,87);
  fill(0);
  you.keyPressed();
  you.move();
  you.show();
  for(int i = 0; i < snow.length; i++){
    snow[i].lookDown();
    //snow[i].wrap();
    snow[i].move(i);
    snow[i].show(); 
  }
}

class Snowflake
{
  private float x,y;
  private boolean isMoving;
  color sn = color(255,255,255,100);

  Snowflake()
  {
    x = (int)(Math.random()*800);
    y = (int)(Math.random()*1500)-1500;
    isMoving = true;

  }

  void show()
  {
    noStroke();
    fill(sn);
    ellipse(x,y,7,7);
  }

  void lookDown()
  {
    if((y > 600))
    {
      isMoving = false;
    }else 
    if((get((int)x,((int)y)+5) == color(0,0,0)) && y > 200)
    {
      sn = color(20,48,87);
    }
  }

  void move(int n)
  {
    if (isMoving == true)
    {
      if(n%2 == 0){
        y = y+0.6;
      }else if(n%3 == 0){
        y = y+0.8;
      }else{
        y = y+1;
      }
    }
  }

  void wrap()
  {
    if(isMoving == false){
      x = (int)(Math.random()*800);
      y = (int)(Math.random()*1500)-1500;
      isMoving = true;
    }
  }
}

class Person
{
  private float psX,psY, acc;
  private int direct;
  Person()
  {
    psX = 400;
    psY = 500;
  }
  void keyPressed()
  {
    if (key == 'd'){
      direct = 0;
    }else if (key == 'a'){
      direct = 1;
    }else if (key == ' '){
      direct = 2;
    }else{
      direct = 42;
    }
  }
  void move()
  {
    if(direct == 0){
      psX = psX + 1;
    }else if(direct == 1){
      psX = psX - 1;
    }else{
      psX = psX;
    }
  }
  void show()
  {
    stroke(0);
    strokeWeight(3);
    fill(0);
    line(psX,psY,psX+10,psY);
    line(psX+4,psY+5,psX,psY+13);
    line(psX,psY+13,psX-1,psY+20);

    //arm
    text("No arms... Deal with it", psX+20,psY+10);
    //arm
    
    line(psX-1,psY+20,psX+15,psY+15);
    line(psX+15,psY+15,psX+10,psY+30);
    
    line(psX-1,psY+20,psX-6,psY+35);
    line(psX-6,psY+35,psX-15,psY+45);
  }
}





















