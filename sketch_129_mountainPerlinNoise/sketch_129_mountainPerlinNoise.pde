/****
 https://www.youtube.com/watch?v=IKB1hWWedMk
 ****/

int cols, rows;
int scl = 20; //scale
int w = 1600; //2 fill view with terrain
int h = 1600; //2 fill view with terrain
float[][] terrain;
float fly =0;


void setup() {
  size(900, 800, P3D);
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows]; // initialz aft cols+rows 4 2d array

  //initialize 4 2D array (z values)
  //float yoff = 0;
  //for (int y = 0; y < rows; y++) {
  //  float xoff = 0;
  //  for (int x = 0; x < cols; x++) {
  //    terrain[x][y] = map(noise(xoff,yoff),0,1,-250,250);
  //    xoff += 0.1;
  //  }
  //  yoff += 0.1;
  //}
}

void draw() {

  //fly -= 0.01; //undulate wave
  fly -= 0.1; //mt flyover

  float yoff = fly; //  start @ fly 4 animation NOT starting @ 0 everytime
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -250, 250);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  background(0);
  stroke(255);
  noFill();

  translate(width/2, height/2+50); //translate lower by +50
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) { //rows-1 can only go 2 2nd last row
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]); //Y+1=crucial, z value at y and y+1 
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}