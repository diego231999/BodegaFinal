package Beans;
public class Pedido {
    private String codigoPedido;
    private String fechaEntrega;
    private String estado;
    private double monto;
    private String clienteDNI;
    private String horaRecojo;
    private String nombreProducto;
    private String dni_cliente;
    private int cantidadProducto;
    private String nombreDistrito;
    private double montoTotal;

    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public String getNombreDistrito() {
        return nombreDistrito;
    }

    public void setNombreDistrito(String nombreDistrito) {
        this.nombreDistrito = nombreDistrito;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDni_cliente() {
        return dni_cliente;
    }

    public void setDni_cliente(String dni_cliente) {
        this.dni_cliente = dni_cliente;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

    public Pedido(){

    }

    public Pedido(String codigoPedido, String fechaEntrega, String estado, double monto, String horaRecojo, String clienteDNI) {
        this.codigoPedido = codigoPedido;
        this.fechaEntrega = fechaEntrega;
        this.estado = estado;
        this.monto = monto;
        this.clienteDNI = clienteDNI;
        this.horaRecojo = horaRecojo;
    }

    public String getCodigoPedido() {
        return codigoPedido;
    }

    public void setCodigoPedido(String codigoPedido) {
        this.codigoPedido = codigoPedido;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getClienteDNI() {
        return clienteDNI;
    }

    public void setClienteDNI(String clienteDNI) {
        this.clienteDNI = clienteDNI;
    }

    public String getHoraRecojo() {
        return horaRecojo;
    }

    public void setHoraRecojo(String horaRecojo) {
        this.horaRecojo = horaRecojo;
    }

    public String getColorEstado() {
        String colorestado="";
        if (estado.equals("ENTREGADO")) {
            colorestado= "#24c600";
        } else if (estado.equals("PENDIENTE")) {
            colorestado= "#003aff";
        } else if (estado.equals("CANCELADO")) {
            colorestado= "#ff3333";
        }
        return colorestado;
    }
}
