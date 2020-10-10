package aula1.ex3;

import java.util.Scanner;

public class Ex3 {
	private static Scanner sc;


	public static void main(String[] args) {
		sc = new Scanner(System.in);
		showMainMenu();
	}

	private static void showMainMenu(){
		System.out.println("Menu:");
		System.out.println("    1 - Calcular perímetro de um paralelogramo");
		System.out.println("    2 - Calcular perímetro de um circulo");
		System.out.println("    3 - Comparar e Verificar se existe intercepção entre 2 circulos");
		System.out.println("    4 - Quit");
		System.out.println("Selecione um comando: ");

		int command =  sc.nextInt();

		switch (command){
			case 1:{
				printPerimetroParalelogramo();
				break;
			}
			case 2: {
				printPerimetroCirculo();
				break;
			}
			case 3:{
				printDataCirculo();
			}
			case 4:{
				System.exit(0);
			}
			default: {
				System.err.println("Comando inválido");
				showMainMenu();
			}
		}
	}

	private static void printPerimetroParalelogramo(){
		System.out.println("Digite a altura em centímetros");
		int x = sc.nextInt();

		System.out.println("Digite a largura em centímetros");
		int y = sc.nextInt();

		int p = y*2 + x*2;

		System.out.printf("%nO perímetro deste paralelogramo é %d centímetros%n%n", p);
		showMainMenu();
	}

	private static void printPerimetroCirculo(){
		System.out.println("Digite a o raio do circulo em centímetros");
		int r = sc.nextInt();

		Circulo c = new Circulo(0,0,r);

		System.out.printf("%nO perímetro do circulo é %f centímetros%n%n", c.getPerimiter());
		showMainMenu();
	}

	private static void printDataCirculo(){
		System.out.println("Digite a coordenada x1 do centro em centímetros");
		int x1 = sc.nextInt();

		System.out.println("Digite o coordenada y1 do centro em centímetros");
		int y1 = sc.nextInt();

		System.out.println("Digite a o raio do circulo 1 em centímetros");
		int r1 = sc.nextInt();

		System.out.println("Digite a coordenada x2 do centro em centímetros");
		int x2 = sc.nextInt();

		System.out.println("Digite o coordenada y2 do centro em centímetros");
		int y2 = sc.nextInt();

		System.out.println("Digite a o raio do circulo 2 em centímetros");
		int r2 = sc.nextInt();

		Circulo c1 = new Circulo(x1,y1,r1);
		Circulo c2 = new Circulo(x2,y2,r2);


		System.out.printf("%nSobrepostos: %s%nInterceptam-se: %s%nDimensões iguais: %s%n%n",
				c1.isEqualTo(c2),
				c1.intersectsWith(c2),
				c1.hasSameDimensions(c2));
		showMainMenu();
	}
}
