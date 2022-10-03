class Obstacle{
float posX;
float posY;
int h;
int w;
int type;

Obstacle(int t){
  posX = width;
  type = t;
  switch(type){
    case 0: w = 20;
            h = 40;
            break;
    case 1: w = 30;
            h = 60;
            break;
    case 2: w = 60;
            h = 40;
            break;
  }
}

  void show(){
    switch(type){
    case 0: image(smallObstacle,posX - smallObstacle.width/2, height - groundHeight - smallObstacle.height);
            break;
    case 1: image(bigObstacle,posX - bigObstacle.width/2, height - groundHeight - bigObstacle.height);
            break;
    case 2:image(manySmallObstacles,posX - manySmallObstacles.width/2, height - groundHeight - manySmallObstacles.height);
            break;
    }
  }

  void move(float speed){
    posX -= speed;
  }

  boolean collided(float playerX, float playerY, float playerWidth, int playerHeight){
    float playerLeft = playerX - playerWidth/2;
    float playerRight = playerX + playerWidth/2;
    float thisLeft = posX - w/2;
    float thisRight = posX + w/2;
    
    if(playerLeft < thisRight && playerRight > thisLeft){
      float playerDown = playerY - playerHeight / 2;
      float playerUp = playerY + playerHeight / 2;
      float thisUp = posY + h/2;
      float thisDown = posY + h/2;
      if(playerDown < thisUp && playerUp >= thisDown){
        return true;
      }    
    }
    return false;
  }
}
