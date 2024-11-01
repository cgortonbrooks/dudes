Dude firstDude, follower;

void setup() {
  size(400, 400);
  firstDude = new Dude(random(width), random(height), false);
  follower = new Dude(width / 2, height / 2, true);
}

void draw() {
  background(255);

  firstDude.update(follower);
  firstDude.show();

  follower.update(firstDude);
  follower.show();
}
