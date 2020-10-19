package aula2.ex2;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;

public class LetterSoup {

	public static void main(String[] args) {

		File soupFile = new File( "src/aula2/ex2/soup_v1.txt");

		ArrayList<String> data = new ArrayList<>();

		try (BufferedReader br = new BufferedReader(
				new InputStreamReader(new FileInputStream(soupFile), StandardCharsets.ISO_8859_1))) {

			String line;
			while ((line = br.readLine()) != null) {
				byte[] str = line.getBytes(StandardCharsets.ISO_8859_1);
				data.add(new String(str));
			}
		} catch( IOException ioe ){
			ioe.printStackTrace();
			System.exit(1);
		}

		LetterGrid letterGrid = getLetterGrid(data);
		String[] words = getWords(data, letterGrid.height());

		Processor processor = new Processor(letterGrid,words);
		Coordinates[] coordinates = processor.process();

		for(int k = 0; k< words.length; k++){
			System.out.println(words[k] + " POSITION AT: " + coordinates[k]);
		}

	}

	static LetterGrid getLetterGrid(ArrayList<String> data){
		int firstLineLength = data.get(0).length();

		if(firstLineLength > 80 || data.size() < firstLineLength){
			System.err.println("Tamanho da sopa de letras inválido");
			System.exit(1);
		}
		char[][] grid = new char[firstLineLength][firstLineLength];

		for(int k = 0; k<firstLineLength; k++){
			grid[k] = data.get(k).toCharArray();
		}
		return new LetterGrid(grid);
	}

	static String[] getWords(ArrayList<String> data, int gridHeight){
		ArrayList<String> words = new ArrayList<>();

		for(int k = gridHeight; k<data.size(); k++){
			words.addAll(
					Arrays.asList(
							data.get(k)
									.replace(",", "")
									.replace(";", "")
									.replaceAll("\\s+"," ")
									.split(" ")));
		}
		return words.toArray(String[]::new);
	}
}
