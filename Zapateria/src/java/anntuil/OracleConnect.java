/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anntuil;

/**
 *
 * @author Luis Esquivel
 */

import java.sql.*;
import javax.servlet.ServletContext;


public class OracleConnect

{


OracleConnect(){}


public static Connection getConnection(ServletContext context)
{

Connection con = null;


try 

{

Class.forName("oracle.jdbc.driver.OracleDriver");

con = DriverManager.getConnection
      (
        context.getInitParameter("url"),
 	context.getInitParameter("usuario"),
	context.getInitParameter("contrasenia")

      );


}

catch(Exception e){}

return con;

}


}
