package aula1.ex2;

public class Pessoa {
    private final String nome;
    private final int cc;
    private final Data dataNasc;

    public Pessoa(String nome, int cc, Data dataNasc) {
        assert nome.length() > 0 : "O nome deve ser um tamanho superior a 0";
        assert cc > 0 : "Numero de cartão de cidadão inválido";

        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    public String getNome() {
        return nome;
    }

    public int getCc() {
        return cc;
    }

    public Data getDataNasc() {
        return dataNasc;
    }

    @Override
    public String toString() {
        return "Pessoa{" +
                "nome='" + nome + '\'' +
                ", cc=" + cc +
                ", dataNasc=" + dataNasc +
                '}';
    }


    public int compareByCC(Pessoa o) {
        if(cc > o.getCc()){
            return 1;
        } else {
            return 0;
        }
    }

    public int compareByName(Pessoa o){
        return nome.compareTo(o.getNome());
    }
}
