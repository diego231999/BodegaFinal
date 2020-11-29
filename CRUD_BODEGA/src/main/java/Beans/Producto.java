package Beans;

import java.io.InputStream;

public class Producto {
    private String id;
    private String nombre;
    private String descripcion;
    private int cantidad;
    private double precio;
    private InputStream fotoProducto;

    public InputStream getFotoProducto() {
        return fotoProducto;
    }

    public void setFotoProducto(InputStream fotoProducto) {
        this.fotoProducto = fotoProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
