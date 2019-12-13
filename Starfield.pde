//your code here
Particle[] star = new Particle[2000];

void setup()
{
	//your code here\
	size(400,400);
	background(0,0,0);
	for(int i = 0; i < star.length; i++){
		star[i] = new Particle(200,200);
		}
}

void build(int i){
	if((int)(Math.random()*1000) == (int)(Math.random()*1000)){
		star[i] = new OddballParticle(200,200);
	}else{
		star[i] = new Particle(200,200);
	}
}

void draw()
{
	//your code here
	background(0);

	for(int i = 0; i < star.length; i++){
		star[i].move();
		if( star[i].x < 0 || star[i].y < 0 || star[i].x > 400 || star[i].y > 400){
			build(i);
		}

	}
}

class Particle
{
	double x,y; // positions
	double angle, speed, proxy; // inital constants
	int colour; // rainbow
	//your code here
	Particle(int widthh, int hightt){
		x = (double)widthh;
		y = (double)hightt;
		angle = ((2*Math.PI)/360)*Math.random()*360;
		speed = (Math.random()*4);
		colour = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
		proxy = 1;
	}
	Particle(){}

	void move(){
		//background(0,0,0);
		x = x + Math.cos(angle)*speed*proxy/100;
		y = y + Math.sin(angle)*speed*proxy/100;
		proxy++;
		fill(colour);
		ellipse((float)x, (float)y, 2, 2);
	}
}

class OddballParticle extends Particle  //inherits from Particle
{
	double radii,rings,rate;
	OddballParticle(int widthh, int hightt){
		x = (double)widthh;
		y = (double)hightt;
		speed = 1;
		angle = ((2*Math.PI)/360)*Math.random()*360;
		colour = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
		radii = 1;
		rate = (int)(Math.random()*4);
		proxy = 1;
	}
	

	void move(){
		fill(colour);
		x = x + Math.cos(angle)*speed*proxy/20;
		y = y + Math.sin(angle)*speed*proxy/20;
		radii = radii + rate;
		proxy++;
		ellipse((float)x, (float)y, (float)radii, (float)radii);
	}

}


