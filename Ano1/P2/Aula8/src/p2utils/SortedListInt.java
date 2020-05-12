package p2utils;



public class SortedListInt<E extends Comparable<E>>
{
  // private attributes
  private Node<E> n = null;
  private int size = 0;

  public SortedListInt() { }

  /**
   * @return Number of elements in the list
   */
  public int size() { return size; }

  /** Checks if the list is empty.
   * @return  {@code true} if list empty, otherwise {@code false}.
   */
  public boolean isEmpty() { return size == 0; }

  /**
   * @return  First element in the list
   */
  public E first() {
    assert !isEmpty(): "empty!";
      return n.elem;
  }

  /** Inserts a new element in the list.
   * @param e the element to be inserted
   */
  public void insert(Node<E> e) {
    n = insert(n,e);
    size++;
  }
  private Node<E> insert(Node<E> n, Node<E> e) {
    if (n == null || e < n.elem)
      return new Node<E>(e.elem,n);
    n.next = insert(n.next,e);
    return n;
  }

  /** Removes the first element in the list.
   */
  public void removeFirst() {
    assert !isEmpty(): "empty!";
    n = n.next;
    size--;
  }

  /** Checks if the list is sorted.
   * @return {@code true} if sorted, {@code false} otherwise
   */
  public boolean isSorted() { 
    if (size < 2)
      return true;
    return isSorted(n,n.next);
  }
  private boolean isSorted(Node<E> prev, Node<E> n) {
    if (n == null) return true;
    if (n.elem < prev.elem) return false;
    return isSorted(n,n.next);
  }

  public void print(){
    print(n);
  }

  private void print(Node<E> e){
    if(e != null){
      System.out.println(e.elem);
      print(e.next);
    }
  }

}
