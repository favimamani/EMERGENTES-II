import java.util.ArrayList;
public class Agenda
{
    private ArrayList<Nota> lista;
    public Agenda(){
        //inicializar una coleccion
       lista = new ArrayList<Nota>();
    }
    
    public void addNota(Nota nota){
    lista.add(nota);
    }
    public void listarNotas(){
      if ( lista.size() > 0 ){
        //mostrar notas
        for(Nota item : lista ){
        item.mostrar();
        }
        }
        else{
            System.out.println("---------------------");
            System.out.println("No hay notas en la agenda");
            System.out.println("---------------------");
        }
    }
}
    