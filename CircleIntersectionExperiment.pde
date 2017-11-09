final int r1 = 200;
final int r2 = 100;

void setup()
{
  size(800,800);
}

float t = 0.0;

void draw()
{
  int x;
  
  t = millis()/1000.0;
  
  background(0);
  
  noFill();
  
  translate(width/2,height/2);

  x = (int)(175 + 75*sin(t));
  
  PVector c1 = new PVector(0,0);
  PVector c2 = new PVector(x,0);
  
  stroke(255);
  ellipse(c1.x,c1.y,2*r1,2*r1);
  
  stroke(128);
  ellipse(c2.x,c2.y,2*r2,2*r2);
  
  stroke(color(255,0,0));
  line(c1.x,c1.y,c2.x,c2.y);
  
  float d = c1.dist(c2);
  
  float t = (r1*r1 - r2*r2 + d*d)/(2*d);
  float f = sqrt(r1*r1 - t*t);
  
  PVector v1a = new PVector(t, (c2.y-f*(c2.x-c1.x)/d));
  PVector v1b = new PVector(t, (c2.y+f*(c2.x-c1.x)/d));
 
  line(c1.x,c1.y,v1a.x,v1a.y);
  line(c1.x,c1.y,v1b.x,v1b.y);
  
  line(c2.x,c2.y,v1a.x,v1a.y);
  line(c2.x,c2.y,v1b.x,v1b.y);
  
  line(v1a.x,v1a.y,v1b.x,v1b.y);
 
  float alpha1 = -acos(t/r1) - HALF_PI;
  float alpha2 = -alpha1;
  
  PVector g1 = new PVector(v1a.x + 100*cos(alpha1), v1a.y + 100*sin(alpha1));
  PVector g2 = new PVector(v1b.x + 100*cos(alpha2), v1b.y + 100*sin(alpha2));
  
  stroke(color(0,0,255));
  
  line(v1a.x,v1a.y,g1.x,g1.y);
  line(v1b.x,v1b.y,g2.x,g2.y);
 
  float alpha3 = -asin((d-t)/r2);
  float alpha4 = -alpha3;
  
  PVector g3 = new PVector(v1a.x + 100*cos(alpha3), v1a.y + 100*sin(alpha3));
  PVector g4 = new PVector(v1b.x + 100*cos(alpha4), v1b.y + 100*sin(alpha4));
  
  line(v1a.x,v1a.y,g3.x,g3.y);
  line(v1b.x,v1b.y,g4.x,g4.y);
  
}
