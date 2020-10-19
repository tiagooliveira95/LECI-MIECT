package aula2.ex2;

public class Processor {
	private final LetterGrid letterGrid;
	private final String[] words;

	public Processor(LetterGrid letterGrid, String[] words) {
		this.letterGrid = letterGrid;
		this.words = words;
	}

	/**
	 * Procura todas as plavras presentes em words
	 * @return array de Coordinates que contem as coordenadas de cada uma das words
	 */
	public Coordinates[] process() {
		Coordinates[] coord = new Coordinates[words.length];

		for(int k = 0; k<words.length; k++){
			coord[k] = getWordCoordinates(words[k].toUpperCase());
		}

		return coord;
	}

	/**
	 *
	 * Procura uma palavra na sopa de letras
	 *
	 * @param word palavra a ser procurada
	 * @return Coordinates da palavra encontrada
	 */
	public Coordinates getWordCoordinates(String word){
		Coordinates coordinates;
		int wordLength = word.length();

		for(int y = 0; y<letterGrid.height(); y++){
			for(int x = 0; x<letterGrid.width(); x++){

				//TODO: melhor código tentar obter as coordenadas do metudo em vez de criar novas para tentar reduzir o código

				coordinates = new Coordinates(x,y, x + wordLength-1,y);
				if(isRightSearchPossible(coordinates,wordLength) && searchHorizontal(coordinates,word)){
					return coordinates;
				}

				coordinates = new Coordinates(x,y, x - wordLength+1,y);
				if(isLeftSearchPossible(coordinates,wordLength) && searchHorizontal(coordinates,word)){
					return coordinates;
				}

				coordinates = new Coordinates(x,y, x,y + wordLength-1);
				if(isBottomSearchPossible(coordinates,wordLength) && searchVertical(coordinates,word)){
					return coordinates;
				}

				coordinates = new Coordinates(x,y, x,y - wordLength+1);
				if(isUpSearchPossible(coordinates,wordLength) && searchVertical(coordinates,word)){
					return coordinates;
				}

				//FIXME: tentar melhorar eficacia e evitar duplicação de código
				coordinates = new Coordinates(x, y, (x - word.length() + 1), (y - word.length() + 1));
				if(isDiagonalSearchPossible(coordinates,wordLength) && searchDiagonal(coordinates,word)){
					return coordinates;
				}

				coordinates = new Coordinates(x, y, (x + word.length() - 1), (y + word.length() - 1));
				if(isDiagonalSearchPossible(coordinates,wordLength) && searchDiagonal(coordinates,word)){
					return coordinates;
				}

				coordinates = new Coordinates(x, y, (x - word.length() + 1), (y + word.length() - 1));
				if(isDiagonalSearchPossible(coordinates,wordLength) && searchDiagonal(coordinates,word)){
					return coordinates;
				}

				coordinates = new Coordinates(x, y, (x + word.length() - 1), (y - word.length() + 1));
				if(isDiagonalSearchPossible(coordinates,wordLength) && searchDiagonal(coordinates,word)){
					return coordinates;
				}
			}
		}
		return null;
	}

	/**
	 *
	 * Verifica palavras horizontalmente
	 *
	 * @param coords coordenada da palavra
	 * @param word word a ser verificada
	 * @return true se a palavra existir na coordenada coords
	 */
	private boolean searchHorizontal(Coordinates coords, String word) {
		int index = coords.getX1();
		for (char letter : word.toCharArray()) {
			if (letterGrid.getAt(index, coords.getY1()) != letter)
				return false;
			index += coords.getX1() > coords.getY2() ? -1 : 1;
		}
		return true;
	}


	/**
	 *
	 * Verifica palavras verticalmente
	 *
	 * @param coords coordenada da palavra
	 * @param word word a ser verificada
	 * @return true se a palavra existir na coordenada coords
	 */
	private boolean searchVertical(Coordinates coords, String word){
		int wordLength = word.length();
		int y = coords.getY1();

		if(!isBottomSearchPossible(coords,wordLength) && !isUpSearchPossible(coords,wordLength)){
			return false;
		}

		for (char letter : word.toCharArray()) {
			if (letterGrid.getAt(coords.getX1(), y) != letter)
				return false;
			y += coords.getY1() > coords.getY2() ? -1 : 1;
		}
		return true;
	}

	/**
	 *
	 * Verifica palavaras na diagonal
	 *
	 * @param coords coordenada da palavra
	 * @param word word a ser verificada
	 * @return true se a palavra existir na coordenada coords
	 */
	private boolean searchDiagonal(Coordinates coords, String word){
		int x = coords.getX1(), y = coords.getY1();
		for (char letter : word.toCharArray()) {
			if (letterGrid.getAt(x, y) != letter)
				return false;
			x += coords.getX1() > coords.getX2() ? -1 : 1;
			y += coords.getY1() > coords.getY2() ? -1 : 1;
		}
		return true;
	}


	/**
	 * Verifica se é possivel procurar uma word para a direita numa determinada coordenada
	 * @param coords coordenada prevista da word
	 * @param wordLength tamanho da word
	 * @return true se for possivel encontrar uma word com tamanho um determinado wordLenght nesta coordenada
	 */
	private boolean isRightSearchPossible(Coordinates coords, int wordLength) {
		return coords.getX1() + wordLength <= letterGrid.width();
	}

	/**
	 * Verifica se é possivel procurar uma word para a esquerda numa determinada coordenada
	 * @param coords coordenada prevista da word
	 * @param wordLength tamanho da word
	 * @return true se for possivel encontrar uma word com tamanho um determinado wordLenght nesta coordenada
	 */
	private boolean isLeftSearchPossible(Coordinates coords, int wordLength) {
		return (coords.getX1() + 1) - wordLength >= 0;
	}

	/**
	 * Verifica se é possivel procurar uma word para a baixo numa determinada coordenada
	 * @param coords coordenada prevista da word
	 * @param wordLength tamanho da word
	 * @return true se for possivel encontrar uma word com tamanho um determinado wordLenght nesta coordenada
	 */
	private boolean isBottomSearchPossible(Coordinates coords, int wordLength){
		return coords.getY1() + wordLength <= letterGrid.height();
	}

	/**
	 * Verifica se é possivel procurar uma word para a cima numa determinada coordenada
	 * @param coords coordenada prevista da word
	 * @param wordLength tamanho da word
	 * @return true se for possivel encontrar uma word com tamanho um determinado wordLenght nesta coordenada
	 */
	private boolean isUpSearchPossible(Coordinates coords, int wordLength){
		return (coords.getY1() + 1) - wordLength >= 0;
	}

	/**
	 * Verifica se é possivel procurar uma word na diagonal numa determinada coordenada
	 * @param coords coordenada prevista da word
	 * @param wordLength tamanho da word
	 * @return true se for possivel encontrar uma word com tamanho um determinado wordLenght nesta coordenada
	 */
	private boolean isDiagonalSearchPossible(Coordinates coords, int wordLength) {
		return (coords.getY1() + 1) - wordLength >= 0 && (coords.getX1() + 1) - wordLength >= 0 ||
				coords.getY1() + wordLength <= letterGrid.height() && (coords.getX1() + 1) - wordLength >= 0 ||
				coords.getY1() + wordLength <= letterGrid.height() && coords.getX1() + wordLength <= letterGrid.width() ||
				(coords.getY1() + 1) - wordLength >= 0 && coords.getX1() +wordLength <= letterGrid.width();
	}
}
