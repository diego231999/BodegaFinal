package Beans;

public class Bodega {
    private String nombre;
    private String correo;
    private String ruc;
    private int valoracion;
    private String direccion;
    private  String  distrito;

    public Bodega() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public int getValoracion() {
        return valoracion;
    }

    public void setValoracion(int valoracion) {
        this.valoracion = valoracion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public Bodega(String nombre, String correo, String ruc, int valoracion, String direccion, String distrito) {
        this.nombre = nombre;
        this.correo = correo;
        this.ruc = ruc;
        this.valoracion = valoracion;
        this.direccion = direccion;
        this.distrito = distrito;
    }
}
