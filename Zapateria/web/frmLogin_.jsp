<%-- 
    Document   : frmLogin_
    Created on : 4/10/2019, 07:06:17 PM
    Author     : Luis Esquivel
--%>

<%@ page import="java.util.*" %>
 <%@page import="anntuil.OracleConnect"%>
<%@page import="javax.servlet.ServletContext"%>
<%@page import="java.sql.*"%>
<%@page import="oracle.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    
    String strUsuario = request.getParameter("usuario");
    String strContrasenia= request.getParameter("contrasenia");
    
    ServletContext context = getServletContext();  
    Connection orclConn = OracleConnect.getConnection(context);
   
    String command = "{call P_VALIDATEUSER(?,?,?)}";
    CallableStatement cstmt = orclConn.prepareCall(command); 
    cstmt.setString(1, strUsuario);
    cstmt.setString(2, strContrasenia);
    cstmt.registerOutParameter(3, OracleTypes.INTEGER);   
    cstmt.execute();  
    Integer res = cstmt.getInt(3) ;
    HttpSession sesion=request.getSession();
    HttpSession sesionUsuario=request.getSession();
    
    // si la contraseña o el usuario no son correctos redirigeme al Login si no al Index
    if (res == 0)
    {         
         sesion.setAttribute("validarUsuario", String.valueOf(res));   
         response.sendRedirect("login.jsp");
         
    }else
    {
        
    String comandin = "{call P_GETMENUS(?,?)}";
    CallableStatement cstmt2 = orclConn.prepareCall(comandin);  
    cstmt2.setString(1, strUsuario);  
    cstmt2.registerOutParameter(2, OracleTypes.CURSOR);    
    cstmt2.execute();
    ResultSet menu = ((OracleCallableStatement)cstmt ).getCursor(2) ;
    sesion.setAttribute("menu", menu); 
    sesionUsuario.setAttribute("Usuario", strUsuario);  
    response.sendRedirect("index.jsp"); 
    }
    

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <ul>
            
            <%
    
          /*while(rset.next())
          
          {
              int intOrden = rset.getInt(1);
              String strMenu = rset.getString(2);
              
          
             
            %>
            
            <!--
            <li> <--%=intOrden %> </li>
            <li> <--%=strMenu %> </li>
            
            -->
            
            
           
            <%
            
            /*
     menuList.add(strMenu);
    
          }
          
          request.setAttribute("menu", menuList);
          RequestDispatcher rd =  request.getRequestDispatcher("stdlist.jsp");
                  
             */ 
             
    
        //  request.setAttribute("validarUsuario", res);    
          
            %>
            
          <!--  <li> <--%=res%> </li> -->
            
        </ul>
        
    </body>
</html>
