package aula1.ex2;

public class Data {
    private int dia;
    private int mes;
    private int ano;

    public Data(int dia, int mes, int ano) {
        assert  dia > 0 && dia <=31 : "Dia deve ser um valor entre 0 e 31";
        assert  mes > 1 && mes <=12 : "Mes deve ser um valor entre 1 e 12";
        assert  ano > 1970 && ano <=9999 : "Ano deve ser um valor entre 1970 e 9999";

        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    }

    @Override
    public String toString() {
        return "Data{" +
                "dia=" + dia +
                ", mes=" + mes +
                ", ano=" + ano +
                '}';
    }
}
