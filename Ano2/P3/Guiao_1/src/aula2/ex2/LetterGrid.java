package aula2.ex2;

public class LetterGrid {
	private final char[][] letterGrid;

	public LetterGrid(char[][] letterGrid) {
		this.letterGrid = letterGrid;
	}

	public int height(){
		return letterGrid[0].length;
	}

	public int width(){
		return letterGrid.length;
	}

	public char getAt(int x, int y){
		if(x>=0 && x<width() && y>=0 && y<height()){
			return letterGrid[y][x];
		}else{
			return Character.UNASSIGNED;
		}
	}
}
