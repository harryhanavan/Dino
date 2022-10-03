class Player{
  float posY = 0;
  float velY = 0;
  float gravity = 1;
  int size = 20;
  boolean duck = false;
  boolean dead = false;
  
  int runCount = -5;
  int lifespan;
  int score;
  
  Player(){
  }
  
  void jump(){
    if(posY == 0){
      gravity = 1;
      velY = 16;
    }
  }
  
  void show(){
    if(duck && posY == 0){
      if (runCount < 0){
        image(playerDuck, playerXpos - playerDuck.width / 2, height - groundHeight - (posY + playerDuck.height));
      }
      else{
        image(playerDuck1, playerXpos - playerDuck1.width / 2, height - groundHeight - (posY + playerDuck1.height));
      }
    }
    else{
      if(posY == 0){
        if (runCount < 0){
          image(playerRun1, playerXpos - playerRun1.width / 2, height - groundHeight - (posY + playerRun1.height));
      }
        else{
          image(playerRun2, playerXpos - playerRun2.width / 2, height - groundHeight - (posY + playerRun2.height));
        }
      }
      else{
          image(playerJump, playerXpos - playerJump.width / 2, height - groundHeight - (posY + playerJump.height));
      }
    }
    
    if(!dead){
       runCount++;
    }
    if(runCount>5){
      runCount=-5;
    }
  }
  
  void move(){
    posY += velY;
    if(posY > 0){
      velY -= gravity; 
    }
    else{
      velY = 0;
      posY = 0;
    }
    
    for(int i = 0; i < obstacles.size(); i++){
      if(dead){
        if(obstacles.get(i).collided(playerXpos, posY + playerDuck.height/2, playerDuck.width *0.5, playerDuck.height)){
          dead = true;
        }
      }
      else{
        if(obstacles.get(i).collided(playerXpos, posY + playerRun1.height/2, playerRun1.width *0.5, playerRun1.height)){
          dead = true;
        }
      }
      if(obstacles.get(i).collided(playerXpos, posY + playerRun1.height/2, playerRun1.width *0.5, playerRun1.height)){
        dead = true;
      }
    }
    for(int i = 0; i < birds.size(); i++){
      if(duck && posY == 0){
        if(birds.get(i).collided(playerXpos, posY + playerDuck.height/2, playerDuck.width *0.5, playerDuck.height)){
          dead = true;
        }
      }
      else{
        if(birds.get(i).collided(playerXpos, posY + playerRun1.height/2, playerRun1.width *0.5, playerRun1.height)){
        dead = true;
        }
      }
    }
    
  }
  
  
  void ducking(boolean isDucking){
    if(posY != 0 && isDucking){
      gravity = 3;
    }
    duck = isDucking;
  }
  
  
  void update(){
    incrementCounter();
    move();
  }
  
  
  void incrementCounter(){
    lifespan++;
    if(lifespan % 3 == 0){
      score += 1;
    }
  }
  
  
  
}
