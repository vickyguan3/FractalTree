private double fractionLength = .7; 
private int smallestBranch = 5; 
private double branchAngle = .1;  
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(225, 215, 0); 
  strokeWeight(.5);
  line(320,480,320,380);   
  drawBranches(320, 400, 200, 3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1, angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  
  branchLength = branchLength*fractionLength;
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength - 80, angle1 + PI/5);
    drawBranches(endX2, endY2, branchLength - 3, angle2 - PI/5);
  }
} 
