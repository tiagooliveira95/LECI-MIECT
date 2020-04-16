
import p2utils.LinkedList;

import static java.lang.System.*;

public class TestList1
{
  public static void main(String[] args) {
    LinkedList<Integer> lst = new LinkedList<Integer>();

    for(int i=0; i<10; i++) {
      lst.addFirst(i);
      lst.addLast(100+i);
    }

    out.println("first " + lst.first());


    out.println("last  " + lst.last());

    lst.removeFirst();

    LinkedList<Integer> cln = lst.clone();

    out.println("clone first " + cln.first());

    LinkedList<Integer> rev = cln.reverse();

    out.println("rev first " +  rev.first());
    out.println("rev last " +  rev.last());

    out.println("Contem 5 ? " + rev.contains(5));
    rev.remove(5);
    out.println("Contem 5 depois de remover ? " + rev.contains(5));

    LinkedList<Integer> another = new LinkedList<Integer>();
    another.addFirst(123);
    another.addFirst(999);


    LinkedList<Integer> conc = rev.concatenate(another);

    for(int p=0; p<conc.size(); p++)
      out.println(conc.get(p));

  }
}

