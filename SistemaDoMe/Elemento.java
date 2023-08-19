

public class Elemento
{
    // instance variables - replace the example below with your own
    private String titulo;
    private int duracion;
    private boolean loTengo;
    private String comentario;

    /**
     * Constructor for objects of class Elemento
     */
    public Elemento(String elTitulo, int tiempo)
    {
        // initialise instance variables
        titulo = elTitulo;
        duracion = tiempo;
        loTengo = false;
        comentario = "";
    }
   
    public void setComentario (String comentario)
    {
        this.comentario = comentario;
    }
    
    public String getComentario ()
    {
        return comentario;
    }

        public void setLotengo (boolean tengo)
    {
        loTengo = tengo;
    }
    
    public boolean getLotengo ()
    {
        return loTengo;
    }
    
        public void print ()
    {
        System.out.println("Elemento");
    }
    
    public String getTitulo()
    {
        return titulo;
    }
}
