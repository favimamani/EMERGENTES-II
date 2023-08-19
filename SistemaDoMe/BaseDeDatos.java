import java.util.ArrayList; 

public class BaseDeDatos
{
    // instance variables - replace the example below with your own
    private ArrayList<Elemento> items;

    public BaseDeDatos()
    {
        items = new ArrayList<Elemento> ();
    }

    public void addElemento(Elemento elElemento)
    {
        items.add(elElemento);
    }
    
    public void list ()
    {
        for(Elemento item : items){
            item.print();
            System.out.println(); // imprime linea vacia
        }
    }
}
