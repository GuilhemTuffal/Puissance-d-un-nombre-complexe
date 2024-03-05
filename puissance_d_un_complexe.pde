/**
Ce programme permet d'afficher les puissance successives d'un nombre complexe. Si la variable point vaut false alors une petite croix sera fait au niveau du nombre complexe,
sinon ce sera seulement le pixel qui sera mis en noir. Cliquer simplement sur le nombre complexe dont vous voulez voir la puissance. Il est possible de supprimer les anciens
points en appuyant sur la touche s.
*/

//paramètres

float taille=2.0;
int vitesse=200;//en hertz entre 1 et 200
boolean point=false;

//programme
boolean clique;
float[] point_de_depart;
float[] point_actuel;

float[] calcul(float[] z, float[] z_) {
  float a=z[0];
  float b=z[1];
  float a_=z_[0];
  float b_=z_[1];
  float[] z__=new float[2];
  z__[0]=a_*a-b_*b;
  z__[1]=a*b_+b*a_;
  return z__;
}
void place_(float x, float y) {
  point_de_depart=new float[2];
  point_de_depart[0]=x;
  point_de_depart[1]=y;
  point_actuel=new float[2];
  point_actuel[0]=point_de_depart[0];
  point_actuel[1]=point_de_depart[1];
  clique=true;
}
void place(float x, float y) {
  point_de_depart=new float[2];
  point_de_depart[0]=(x-350.0)/100;
  point_de_depart[1]=(y-350.0)/100;
  point_actuel=new float[2];
  point_actuel[0]=point_de_depart[0];
  point_actuel[1]=point_de_depart[1];
  clique=true;
}
void dessine() {
  if (point) {
    point(point_actuel[0]*100, point_actuel[1]*100);
  } else {
    line(point_actuel[0]*100-taille, point_actuel[1]*100-taille, point_actuel[0]*100+taille, point_actuel[1]*100+taille);
    line(point_actuel[0]*100+taille, point_actuel[1]*100-taille, point_actuel[0]*100-taille, point_actuel[1]*100+taille);
  }
  point_actuel=calcul(point_de_depart, point_actuel);
  if (point_actuel[0]*100+350<0 || point_actuel[1]*100+350<0 || point_actuel[1]*100+350>700 || point_actuel[0]*100+350>700) {
    println("Le point est hors de l'écran");
    clique=false;
  } else if (pow(point_actuel[0]*100, 2)+pow(point_actuel[1]*100, 2)<5) {
    println("Le point a convergé");
    clique=false;
  }
}
void setup() {
  size(700, 700);
  background(150);
  translate(width/2, height/2);
  line(0-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);
  for (int i=0; i<7; i++) {
    line(-5, (i-3)*100, 5, (i-3)*100);
  }
  for (int i=0; i<7; i++) {
    line((i-3)*100, 5, (i-3)*100, -5);
  }
  frameRate(vitesse);
}
void draw() {
  translate(width/2, height/2);
  if (clique==true) {
    dessine();
  }
}

void mouseClicked() {
  if (clique==false) {
    place(mouseX, mouseY);
    //place_(0.001, 0.9991);
    println(sqrt(pow(point_actuel[0], 2)+pow(point_actuel[1], 2)));
  }
}
void keyPressed() {
  if (key == 's' || key == 'S') {
    background(150);
  line(0-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);
  for (int i=0; i<7; i++) {
    line(-5, (i-3)*100, 5, (i-3)*100);
  }
  for (int i=0; i<7; i++) {
    line((i-3)*100, 5, (i-3)*100, -5);
  }
  }
}
