package OtrasFunciones;

public class Validaciones {
    public boolean validarCantidad(int cantidad){
        try{
            if (cantidad>0 && cantidad<=1000){
                return true;
            }else{
                return false;
            }
        }catch(NumberFormatException e){
            return false;
        }
    }
}
