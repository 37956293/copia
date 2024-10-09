/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Jever_Gómez
 */
public class Empleado extends Persona{
    private String codigo;
    private int id,id_puesto;
    Conexion cn;

    public Empleado(){}
    public Empleado(String codigo, int id, int id_puesto, String nombres, String apellidos, String direccion, String telefono, String fecha_naciemiento) {
        super(nombres, apellidos, direccion, telefono, fecha_naciemiento);
        this.codigo = codigo;
        this.id = id;
        this.id_puesto = id_puesto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }
    @Override
  public int crear(){
      int retorno = 0;
      
      try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "INSERT INTO empleados (codigo,nombres,apellidos,direccion,telefono,fecha_nacimiento,id_puesto) VALUES(?,?,?,?,?,?,?);";
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getCodigo());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, this.getFecha_nacimiento());
            parametro.setInt(7, this.getId_puesto());
            int executar = parametro.executeUpdate();
            retorno  = executar;
            System.out.println("Ingreso Exitoso.." + Integer.toString(executar));
            cn.cerrar_conexion();
            
    }catch(SQLException ex){
        retorno = 0;
        System.out.println("Error en crear:" + ex.getMessage());
        }
      
      return retorno;
      
  } 

    private String getFecha_nacimiento() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
