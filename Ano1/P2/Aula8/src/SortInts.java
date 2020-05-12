import p2utils.SortedListInt;

import static java.lang.System.*;
import java.io.*;
import java.util.Scanner;

public class SortInts
{
  public static void main(String[] args) throws Exception {

    if(args.length == 0){
      out.println("usage: java -ea SortInts file1, file 2...");
    }

    SortedListInt numbers = new SortedListInt();
    for(String dir : args){
      File f = new File(dir);
      if(!f.isFile()) throw new IOException(dir + " is not a file!");
      numbers = insertNumbers(numbers, new Scanner(f));
      if(!numbers.isSorted()) throw new Exception("An error occurred while sorting numbers.");
    }
    numbers.print();
  }

  private static SortedListInt insertNumbers(SortedListInt numbers, Scanner scn) throws NumberFormatException{
    if(!scn.hasNext()) return numbers;
    String line = scn.nextLine();
    try {
      int numb = Integer.parseInt(line);
      numbers.insert(numb);
    }catch (NumberFormatException nfe){
      throw new NumberFormatException( "'" + line + "' is not an integer!");
    }
    return insertNumbers(numbers, scn);
  }
}


