class Dude {
  private float xPos, yPos, dia;
  private float xVel, yVel;
  private boolean follower;
  private color clr;

  public Dude(float x, float y, boolean follower) {
    xPos = x;
    yPos = y;
    dia = 40;
    xVel = random(2, 4);
    yVel = random(2, 4);
    this.follower = follower;
    clr = follower ? color(255, 0, 0) : color(255, 255, 255);
  }

  public void update(Dude otherDude) {
    if (!follower) {
      xPos += xVel;
      yPos += yVel;
      checkWall();
    } else {
      follow(otherDude);
      checkWall();
    }
  }
  private void follow(Dude otherDude) {
    if (xPos < otherDude.getX()) { // otherDude is to my right
      xVel = abs(xVel);
    }
    xPos += xVel;

    if (yPos > otherDude.getY()) { // otherDude is above me
      yVel = -1 * abs(yVel);
    }
    yPos += yVel;
  }

  public void show() {
    fill(clr);
    strokeWeight(2);
    stroke(0);
    circle(xPos, yPos, dia);
  }

  void checkWall() {
    if (xPos > width - dia/2 || xPos < dia/2) {
      xVel = -xVel;
    }
    if (yPos > height - dia/2 || yPos < dia/2) {
      yVel = -yVel;
    }
  }

  public float getX() {
    return xPos;
  }

  public float getY() {
    return yPos;
  }
}
