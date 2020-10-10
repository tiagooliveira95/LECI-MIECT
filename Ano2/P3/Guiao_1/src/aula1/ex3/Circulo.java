package aula1.ex3;

public class Circulo {
	private final double raio;
	private final Ponto centro;

	public Circulo(double x, double y, double r) {
		this.raio = r;
		this.centro = new Ponto(x,y);


	}

	public Circulo(Ponto centro, double r) {
		this.raio = r;
		this.centro = centro;
	}

	public double getRaio() {
		return raio;
	}


	public Ponto getCentro() {
		return centro;
	}

	public boolean isEqualTo(Circulo circulo){
		return centro.getX() == circulo.centro.getX() && centro.getY() == circulo.centro.getY() && raio == circulo.raio;
	}

	public boolean hasSameDimensions(Circulo circulo){
		return raio == circulo.getRaio();
	}

	public boolean intersectsWith(Circulo circulo){
		double a = centro.getX() - circulo.getCentro().getX();
		double b = centro.getY() - circulo.getCentro().getY();

		return Math.sqrt(Math.pow(a,2) + Math.pow(b,2)) < getRaio() + circulo.getRaio();
	}

	@Override
	public String toString() {
		return "Circulo{" +
				"raio=" + raio +
				", centro=" + centro +
				'}';
	}

	public double getPerimiter() {
		return 2 * Math.PI * raio;
	}
}
