//Isabella Caldas Rojas
//Proyecto 2019-2

import TUIO.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress direccion;
NetAddress direccionRemota;

int puerto;
String ip;

TuioProcessing tuio;

int posX1;
int posY1;

int posX2;
int posY2;

int posX3;
int posY3;

int tam = 100;

void setup()
{
  size(640,480);
  tuio = new TuioProcessing(this);
  
  ip = "127.0.0.1";
  puerto = 6070;
  
  oscP5 = new OscP5(this,puerto);
  direccionRemota = new NetAddress(ip,puerto);
}

void draw()
{
  background(80, 30, 250);
  ellipse(posX1, posY1, tam, tam);
  fill(100, 100, 100);

  ellipse(posX2, posY2, tam, tam);
  fill(200, 200, 200);

  ellipse(posX3, posY3, tam, tam);
  fill(20, 250, 100);
}

void updateTuioObject(TuioObject objetoTuio)
{
  if (objetoTuio.getSymbolID() == 0)
  {
    posX1 = round(objetoTuio.getX()*width);
    posY1 = round(objetoTuio.getY()*height);
  }

  if (objetoTuio.getSymbolID() == 2)
  {
    posX2 = round(objetoTuio.getX()*width);
    posY2 = round(objetoTuio.getY()*height);
  }

  if (objetoTuio.getSymbolID() == 4)
  {
    posX3 = round(objetoTuio.getX()*width);
    posY3 = round(objetoTuio.getY()*height);
  }
  
  float xi;
  float xf;
  float yi;
  float yf;
  
  int Close1 = 0;
  int Close2 = 0;
  int Close3 = 0;
    
  float distancia1 = sqrt(pow((posX2-posX1),2)+pow((posY2-posY1),2));//Bolita 1 y bolita2
  float distancia2 = sqrt(pow((posX3-posX1),2)+pow((posY3-posY1),2));//Bolita 1 y bolita3
  float distancia3 = sqrt(pow((posX3-posX2),2)+pow((posY3-posY2),2));//Bolita 2 y bolita3
  
  if(distancia1 < 200)
  {
    xi = posX1;
    xf = posX2;
    yi = posY1;
    yf = posY2;
    Close1 = 1;
    line(xi,yi,xf,yf);
  }
  
  if(distancia2 < 200)
  {
    xi = posX1;
    xf = posX3;
    yi = posY1;
    yf = posY3;
    Close2 = 1;
    line(xi,yi,xf,yf);
  }
  
  if(distancia3 < 200)
  {
    xi = posX2;
    xf = posX3;
    yi = posY2;
    yf = posY3;
    Close3 = 1;
    line(xi,yi,xf,yf);
  }
  
  OscMessage bola1 = new OscMessage("/isabella/bola1");
  //bola1.add(posX1);
  bola1.add(Close1); //Bola 1(0) y 2(2)
  oscP5.send(bola1,direccionRemota);
  
  OscMessage bola2 = new OscMessage("/isabella/bola3");
  //bola1.add(posX1);
  bola2.add(Close2); //Bola 1(0) y 2(2)
  oscP5.send(bola2,direccionRemota);
  
  OscMessage bola3 = new OscMessage("/isabella/bola3");
  //bola1.add(posX1);
  bola1.add(Close3); //Bola 1(0) y 2(2)
  oscP5.send(bola3,direccionRemota);
}


/*void identificateTuioObject(TuioObject objetoTuio)
{
  if(objetoTuio.getSymbolID() == 173)
  {
    println("Entra");
  }
}

void removeTuioObject(TuioObject objetoTuio)
{
  println("salio");
}*/
