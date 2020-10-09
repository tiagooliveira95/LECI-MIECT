package aula1.ex2;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

import static java.util.Calendar.*;

public class Ex2 {

    private static ArrayList<Pessoa> pessoas = new ArrayList<>();
    private static Scanner sc;
    public static void main(String[] args) {
        sc = new Scanner(System.in);

        System.out.println("Menu:");
        System.out.println("    1 - Ver Lista");
        System.out.println("    2 - Ver Lista - Ordem nome");
        System.out.println("    3 - Ver Lista - Ordem CC");
        System.out.println("    4 - Adicionar pessoa a lista");
        System.out.println("    5 - Remover pessoa");
        System.out.println("    6 - Quit");

        int command =  sc.nextInt();

        switch (command){
            case 1: {
                showList(-1);
                break;
            }
            case 2: {
                showList(0);
                break;
            }
            case 3: {
                showList(1);
                break;
            }
            case 4: {
                addPerson();
                break;
            }
            case 5: {
                removePerson();
                break;
            }
            case 6:{
                System.exit(0);
            }
            default: System.err.println("Comando inválido");
        }
        System.out.println("Selecione um comando: ");
    }

    private static void showList(int orderType){
        if(orderType == -1) printUnorderedList();
        main(null);
    }

    private static void printUnorderedList(){
        for(Pessoa p : pessoas){
            System.out.println(p.toString());
        }
    }

    private static void addPerson() {
        System.out.println("Insira um nome");
        String name = sc.next();

        System.out.println("Insira o CC");
        int cc = sc.nextInt();

        System.out.println("Insira a data de nascimento (dd/MM/yyyy)");
        Calendar cal = Calendar.getInstance();

        long timestamp;

        try {
            timestamp = new SimpleDateFormat("dd/MM/yyyy").parse(sc.next()).getTime();
            cal.setTimeInMillis(timestamp);
        }catch (ParseException pe){
            pe.printStackTrace();
            System.exit(1);
        }

        Data data = new Data(cal.get(DAY_OF_MONTH), cal.get(MONTH), cal.get(YEAR));

        Pessoa pessoa = new Pessoa(name,cc, data);

        pessoas.add(pessoa);

        System.out.println("Pessoa adicionada com sucesso");

        main(null);
    }

    private static void removePerson(){}

}
