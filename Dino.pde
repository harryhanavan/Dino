  import grafica.*;
  import controlP5.*;
  import java.util.*;
  import java.util.Objects;
  import java.text.SimpleDateFormat;
  ControlP5 cp5;
  int index = 0;
  String BrIn,BrOut,WaIn,WaOut,JoIn,JoOut;
  String Year,Month,Day,t24,tMinute,tSecond;

PImage playerRun1;
PImage playerRun2;
PImage playerJump;
PImage playerDuck;
PImage playerDuck1;
PImage smallObstacle;
PImage bigObstacle;
PImage manySmallObstacles;
PImage bird;
PImage bird1;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Bird> birds = new ArrayList<Bird>();
ArrayList<Ground> grounds = new ArrayList<Ground>();

int obstacleTimer = 0;
int minTimeBetObs = 60;
int randomAddition = 0;
int groundCounter = 0;
float speed = 10; //10 is default

int groundHeight = 50;
float playerXpos = 100;

int highscore = 0;

Player dino;

void setup(){
  size (1000,800);
  frameRate(60);
  
  playerRun1 = loadImage ("playerRun1.png");
  playerRun2 = loadImage ("playerRun2.png");
  playerJump = loadImage ("playerJump.png");
  playerDuck = loadImage ("playerDuck.png");
  playerDuck1 = loadImage ("playerDuck1.png");
  smallObstacle = loadImage ("smallObstacle.png");
  bigObstacle = loadImage ("bigObstacle.png");
  manySmallObstacles = loadImage ("manySmallObstacles.png");
  bird = loadImage ("bird.png");
  bird1 = loadImage ("bird1.png");

  
  dino = new Player();
}


void draw(){
  background(250);
  stroke(0);
  strokeWeight(2);
  line(0, height - groundHeight - 30, width, height - groundHeight - 30);
  
  updateObstacles();
  if(dino.score > highscore){
    highscore = dino.score;
  }
  textSize(20);
  fill(0);
  text("Score: " + dino.score,5,20);
  text("Highscore: " + highscore, width -(140+(str(highscore).length()*10)),20);
  
}

void keyPressed(){
  switch(key){
    case ' ': dino.jump();
              break;
    case 's': if(!dino.dead){
                dino.ducking(true);
              }
              break;
    
    
  }
}
void keyReleased(){
  switch(key){
    case 's': if(!dino.dead){
                dino.ducking(false);
              }
              break;
    case 'r': if(dino.dead){
                reset();
              }
              break;
  }
}

void updateObstacles(){
  showObstacles();
  dino.show();
  if(!dino.dead){
    obstacleTimer++;
    speed += 0.002;
    if(obstacleTimer > minTimeBetObs + randomAddition){
      addObstacles();
    }
    groundCounter++;
    if(groundCounter > 10){
      groundCounter = 0;
      grounds.add(new Ground());
    }
    moveObstacles();
    dino.update();
  }
  else{
    textSize(64);
    fill(0);
    text("Game Over!",height/2,width/2);
    textSize(32);
    text("Press 'r' to restart",(height/2),(width/2)+100);
  }
}

void showObstacles(){
  for(int i = 0; i < grounds.size(); i++){
      grounds.get(i).show();
  }
    for(int i = 0; i < obstacles.size(); i++){
      obstacles.get(i).show();
  }
    for(int i = 0; i < birds.size(); i++){
      birds.get(i).show();
  }
}


void addObstacles(){
  if(random(1) < 0.15){
    birds.add(new Bird(floor(random(3))));
  }
  else{
    obstacles.add(new Obstacle(floor(random(3))));
  }
  randomAddition = floor(random(50));
  obstacleTimer = 0;
}

void moveObstacles(){
    for(int i = 0; i < grounds.size(); i++){
      grounds.get(i).move(speed);
      if(grounds.get(i).posX < -playerXpos){
        grounds.remove(i);
        i--;
      }
  }
    for(int i = 0; i < obstacles.size(); i++){
      obstacles.get(i).move(speed);
      if(obstacles.get(i).posX < -playerXpos){
        obstacles.remove(i);
        i--;
      }
  }
    for(int i = 0; i < birds.size(); i++){
      birds.get(i).move(speed);
      if(birds.get(i).posX < -playerXpos){
        birds.remove(i);
        i--;
      }
  }
   
}

void reset(){
  dino = new Player();
  obstacles = new ArrayList<Obstacle>();
  birds = new ArrayList<Bird>();
  grounds = new ArrayList<Ground>();
  
  obstacleTimer = 0;
  randomAddition = floor(random(50));
  groundCounter = 0;
  speed = 10;
  }
