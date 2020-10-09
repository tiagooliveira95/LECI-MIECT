package aula1.ex2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.util.Calendar.*;

public class Ex2 {

    private static final ArrayList<Pessoa> pessoas = new ArrayList<>();
    private static Scanner sc;
    
    public static void main(String[] args) {
        sc = new Scanner(System.in);
        showMainMenu();
    }
    
    private static void showMainMenu(){
        System.out.println("Menu:");
        System.out.println("    1 - Ver Lista");
        System.out.println("    2 - Ordenar lista por nome");
        System.out.println("    3 - Ordenar lista por CC");
        System.out.println("    4 - Adicionar pessoa a lista");
        System.out.println("    5 - Remover pessoa");
        System.out.println("    6 - Quit");
        System.out.println("Selecione um comando: ");

        int command =  sc.nextInt();

        switch (command){
            case 1:{
                showList();
                break;
            }
            case 2: {
                printNameOrderedList();
                break;
            }
            case 3:{
                printCcOrderedList();
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
            default: {
                System.err.println("Comando inválido");
                showMainMenu();
            }
        }
    }

    private static void showList(){
        printUnorderedList();
        showMainMenu();
    }

    private static void printUnorderedList(){
        if(pessoas.size() == 0){
            System.out.println("Lista de pessoas vazia");
            return;
        }

        System.out.println();
        for(Pessoa p : pessoas){
            System.out.println(p.toString());
        }
        System.out.println();
    }

    private static void printCcOrderedList(){
        pessoas.sort(Pessoa::compareByCC);
        showList();
    }

    private static void printNameOrderedList(){
        pessoas.sort(Pessoa::compareByName);
        showList();
    }

    private static void addPerson() {
        System.out.println("Insira um nome");
        String name = sc.next();

        System.out.println("Insira o CC");
        int cc = sc.nextInt();

        System.out.println("Insira a data de nascimento (dd/MM/yyyy)");
        Calendar cal = Calendar.getInstance();

        long timestamp = 0L;

        while(timestamp == 0L) {
            try {
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                df.setLenient(false);
                timestamp = df.parse(sc.next()).getTime();
                cal.setTimeInMillis(timestamp);
            } catch (ParseException pe) {
                System.err.println("Data invalida, volte a tentar.");
            }
        }

        Data data = new Data(cal.get(DAY_OF_MONTH), cal.get(MONTH), cal.get(YEAR));

        Pessoa pessoa = new Pessoa(name,cc, data);

        pessoas.add(pessoa);

        System.out.println("Pessoa adicionada com sucesso");

        showMainMenu();
    }

    private static void removePerson(){
        System.out.println("Selecione o CC da pessoa a remover:");
        int cc = sc.nextInt();
        
        for(int k = 0; k<pessoas.size(); k++){
            if(pessoas.get(k).getCc() == cc){
                pessoas.remove(k);
                break;
            }else if(k == pessoas.size() -1){
                System.err.println("CC não encontrado");
            }
        }

        System.out.println("Pessoa removida com sucesso!");
        showMainMenu();
    }
}
