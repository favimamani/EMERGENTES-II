public class DVD extends Elemento
{
    // instance variables - replace the example below with your own
    private String director;

    public DVD(String elTitulo, String elDirector, int tiempo)
    {
        super(elTitulo, tiempo);
        director = elDirector;
    }

    public String getDirector()
    {
        return director;
    }
    
    public void print ()
    {
        System.out.println("DVD");
        System.out.println("Titutlo" + getTitulo () );
        System.out.println("Director" + director );
    }
}

