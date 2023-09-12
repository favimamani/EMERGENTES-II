package com.emergentes.modelo;
public class Tarea {
      private int id;
    private String tarea;
    private boolean check;

    public Tarea() {
        this.id = 0;
        this.tarea = "";
        this.check = false;

    }
    public Tarea(int id, String tarea, boolean check) {
        this.id = id;
        this.tarea = tarea;
        this.check = check;
    }
     public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }  
}

    

