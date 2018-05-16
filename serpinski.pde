String init = "F-G-G";
int recurs = 0;
int recursLim = 5;
float angle = 120;
float len = 10;
float degrees = 0;
float weight = 1;
float frRate = 10;
float weightV = 1;

boolean done = false;

ArrayList<Character> sequence = new ArrayList<Character>();
ArrayList<String> grammar = new ArrayList<String>();

void setup() {
  size(1200,900,P3D);
  
  for(int i = 0; i < init.length(); i++) {
    sequence.add(init.charAt(i));
  }
  
  grammar.add("F-G+F+G-F");
  
  grammar.add("GG");
}

void draw() {
  
  frameRate(frRate);
  
  println(weight);
  
  background(0);
  
  createSequence();
  
  serpinskify();
}

void createSequence() {
  if(!done) {
    for(int i = 0; i < recursLim; i++) {
      ArrayList<Character> tempSequence = new ArrayList<Character>();
      
      int currentLen = sequence.size();
      
      for(int j = 0; j < currentLen; j++) {
        if(sequence.get(j) == 'F') {
          for(int k = 0; k < grammar.get(0).toCharArray().length; k++) { 
            tempSequence.add(grammar.get(0).toCharArray()[k]);
          }
        }
        
        if(sequence.get(j) == 'G') {
          for(int k = 0; k < grammar.get(1).toCharArray().length; k++) { 
            tempSequence.add(grammar.get(1).toCharArray()[k]);
          }
        }
        
        if(sequence.get(j) =='-' || sequence.get(j) == '+') {
          tempSequence.add(sequence.get(j));
        }
      }
      
      sequence = tempSequence;
    }
  }
  
  done = true;
}

void serpinskify() {
  beginShape();
  translate(width/3, 2*height/3);
  
  for(int i = 0; i < sequence.size(); i++) {
    if(sequence.get(i) == 'F' || sequence.get(i) == 'G') {
      rotateY(degrees);
      fill(random(0,255), random(0,255), random(0,255));
      stroke(100 + weightV*4 , 50, 100 - weightV*4);
      strokeWeight(weight);
      line(0, 0, 0, 0, -len, random(-5, 5));
      translate(0, -len);
    }
    
    if(sequence.get(i) == '+') {
      rotate(radians(-angle));
    }
    
    if(sequence.get(i) == '-') {
      rotate(radians(angle));
    }
  }
  endShape();
  
  rotateY(radians(degrees));
  degrees+= 0.01;
  
  weight += weightV;
      
  if(weight > 50) {
    weightV = -0.5;
  }
  
  if(weight < 1) {
    weightV = 0.5;
  }
}