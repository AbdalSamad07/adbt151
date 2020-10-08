Player playerLeft;
Player playerRight;
Ball ball;

int Player1Score = 0;
int Player2Score = 0;

void setup() {
  size(800, 600);
  ball = new Ball(width/2, height/2, 50); 
  ball.speedX = 8;
  ball.speedY = random(-3, 3); 

  playerLeft = new Player(15, height/2, 30, 200);
  playerRight = new Player(width-15, height/2, 30, 200);
}

void draw() {
  background(#000000); 
  ball.display(); 
  ball.move(); 
  ball.display(); 

  playerLeft.move();
  playerLeft.display();
  playerRight.move();
  playerRight.display();

  if (Player1Score == 10)
  {
    fill(0, 0, 255);
    textSize(90);
    text("Player 1 Wins", 400, 300);
    stop();
  }
  if (Player2Score == 10)
  {

    fill(0, 0, 255);
    textSize(90);
    text("Player 2 Wins", 400, 300);
    stop();
  }

  if (ball.right() > width) {
    Player1Score++;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    Player2Score++;
    ball.x = width/2;
    ball.y = height/2;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }

  if (playerLeft.bottom() > height) {
    playerLeft.y = height-playerLeft.h/2;
  }

  if (playerLeft.top() < 0) {
    playerLeft.y = playerLeft.h/2;
  }

  if (playerRight.bottom() > height) {
    playerRight.y = height-playerRight.h/2;
  }

  if (playerRight.top() < 0) {
    playerRight.y = playerRight.h/2;
  }


  if ( ball.left() < playerLeft.right() && ball.y > playerLeft.top() && ball.y < playerLeft.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - playerLeft.y, -playerLeft.h/2, playerLeft.h/2, -10, 10);
  }

  if ( ball.right() > playerRight.left() && ball.y > playerRight.top() && ball.y < playerRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - playerRight.y, -playerRight.h/2, playerRight.h/2, -10, 10);
  }


  textSize(40);
  textAlign(CENTER);
  text(Player2Score, width/2+50, 30); // Right side score
  text(Player1Score, width/2-50, 30); // Left side score
}

void keyPressed() {
  if (keyCode == UP) {
    playerRight.speedY=-15;
  }
  if (keyCode == DOWN) {
    playerRight.speedY=15;
  }
  if (key == 'w') {
    playerLeft.speedY=-15;
  }
  if (key == 's') {
    playerLeft.speedY=15;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    playerRight.speedY=0;
  }
  if (keyCode == DOWN) {
    playerRight.speedY=0;
  }
  if (key == 'w') {
    playerLeft.speedY=0;
  }
  if (key == 's') {
    playerLeft.speedY=0;
  }
}
