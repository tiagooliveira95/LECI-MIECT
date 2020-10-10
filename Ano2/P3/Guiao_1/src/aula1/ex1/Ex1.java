package aula1.ex1;

import java.util.Scanner;

public class Ex1 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Escreva uma algo");

        String userValue = sc.nextLine();
        StringBuilder builder = new StringBuilder();

        int numericValuesCount = 0;
        boolean isLowerCase = true;
        boolean isUpperCase = true;
        int wordLength;

        for(int k = 0; k< userValue.length(); k++){
            char c = userValue.charAt(k);
            numericValuesCount += Character.isDigit(c) ? 1 : 0;
            isLowerCase = isLowerCase && c == Character.toLowerCase(c);
            isUpperCase = isUpperCase && c == Character.toUpperCase(c);

            // Se o tamanho for impar o ultimo char é sempre igual ao original
            if(userValue.length() % 2 == 1 && k == userValue.length() - 1){
                builder.append(c);
            }else {
                // Se k for par, incrementa se 1 para obter o próximo char
                // Se k é impar substrai se 1 para obter o char anterior
                builder.append(userValue.charAt(k + (k % 2 == 0 ? 1 : -1)));
            }
        }

        wordLength = userValue.trim().split(" ").length;

        System.out.printf(
                "Contador Numérico: %d\n" +
                "UpperCase: %b\n" +
                "LowerCase: %b\n" +
                "Word Count: %d\n" +
                        "Fliped: %s%n",
                numericValuesCount,
                isUpperCase && numericValuesCount != userValue.length(),
                isLowerCase && numericValuesCount != userValue.length(),
                wordLength,
                builder.toString());
    }
}
