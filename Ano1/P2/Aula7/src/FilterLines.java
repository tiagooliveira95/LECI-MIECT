import p2utils.LinkedList;

import static java.lang.System.*;
import java.io.*;
import java.util.Scanner;
// import java.util.*;   // => "error: reference to LinkedList is ambiguous"
// java.util.LinkedList colide com p2utils.LinkedList!


public class FilterLines
{
  public static void main(String[] args) throws IOException
  {
    if (args.length != 1) {
      err.printf("Usage: java -ea FilterLines text-file\n");
      exit(1);
    }
    File fil = new File(args[0]);

    // Criar listas para as linhas curtas, médias e longas.
    LinkedList<String> lstCurtas = new LinkedList<String>();
    LinkedList<String> lstMedias = new LinkedList<String>();
    LinkedList<String> lstLongas = new LinkedList<String>();

    Scanner sf = new Scanner(fil);
    // exceções poderiam ser intercetadas e mostrar mensagem de erro.
    while (sf.hasNextLine()) {
      String line = sf.nextLine();

      if(line.length() < 20){
        lstCurtas.addLast(line);
      } else if (line.length() > 50) {
        lstMedias.addLast(line);
      }else{
        lstLongas.addLast(line);
      }
      //20 curtas, 20-40 medias, else longas
    }
    sf.close();

    // Escrever conteúdo das listas...
    out.println("Curtas---|---------|---------|---------|---------");
    lstCurtas.print();

    out.println("Médias---|---------|---------|---------|---------");
    lstMedias.print();

    out.println("Longas---|---------|---------|---------|---------");
    lstLongas.print();
  }
}
