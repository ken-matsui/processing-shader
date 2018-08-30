PShader sd;
int times = 0;

void setup() {
  size(600, 600, P2D);
  
  sd = loadShader("frag.glsl");
}

void draw() {
  sd.set("times", times);
  shader(sd);
  
  times += 3;
  
  rect(0, 0, width, height);
}