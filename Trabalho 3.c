#include<stdlib.h>
#include<stdio.h>

typedef struct{
	int x,y;
}Triangulo;

confereponto(Triangulo ponto1,Triangulo ponto2,Triangulo ponto3){
	int valor;
	valor = (ponto1.x*(ponto2.y-ponto3.y) + ponto2.x*(ponto3.y-ponto1.y)+ ponto3.x*(ponto1.y-ponto2.y));
	return(valor);
}

int main(){
	Triangulo t1,t2,t3,p;
	int laco,valor,valor1,valor2,valor3;
	FILE *LeituraT;
	FILE *LeituraP;
	FILE *Grava;
	LeituraT=fopen("Triangulos.txt","r");
	LeituraP=fopen("Pontos.txt","r");
	Grava=fopen("Resultados.txt","w");
	for(laco=0;laco<10;laco++){
		fscanf(LeituraT,"%i %i",&t1.x,&t1.y);
		fscanf(LeituraT,"%i %i",&t2.x,&t2.y);
		fscanf(LeituraT,"%i %i",&t3.x,&t3.y);
		fscanf(LeituraP,"%i %i",&p.x,&p.y);
		valor = confereponto(t1,t2,t3);
		valor1 = confereponto(p,t2,t3);
		valor2 = confereponto(t1,p,t3);
		valor3 = confereponto(t1,t2,p);
		if(valor==valor1+valor2+valor3){
			printf("A coordenada esta dentro do triangulo\n");
			fprintf(Grava,"1\n");
		}else{
			printf("A coordenada esta fora do triangulo\n");
			fprintf(Grava,"0\n");
		}
	}
	system("pause");
	return(0);
}
