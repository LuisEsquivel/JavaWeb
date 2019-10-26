<%-- 
    Document   : login
    Created on : 3/10/2019, 07:43:15 PM
    Author     : Luis Esquivel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="css/ann-tuil.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Sesión</title>
    </head>
    
   
    
  
    <body  class= "bodyLogin">
<div class= "divTbl">
<div class= "divCell">
<form name="frmLogin" action="frmLogin_.jsp" method="POST">
<table border="0" class="tblLogin">
    
<tr>
<td>Usuario: </td>
<td> <input type="text" name="usuario" value="" size="15px" class="tbLogin"/> </td>
</tr>

<tr>
<td>Contraseña: </td>
<td> 
<input type="password" name="contrasenia" value="" size="15px" class="tbLogin"/>
 </td>
</tr>




<tr>
<td colspan="2" style ="text-align: center">

    <%
        
               HttpSession sesion=request.getSession();
                
               Object validarUsuario =  sesion.getAttribute("validarUsuario"); 
                     
                     
                 if(validarUsuario != null)
                 {
                    if(validarUsuario.toString() == "0")
                 {
                     
                     
                 
                
    %>
    
    <label class="msgAlert" >  Usuario o contrase&ntilde; a inv&aacute;lidos </label>
    
    <%
             } 
                   
                    
                 }       
     %>            

</td>
</tr>



<tr>
<td  colspan="2"  style="text-align: center">     
<input type="submit"  value="Ahorita vemos que pedo"  name="btnIniciar" size="15px" class="btLogin"/>
 </td>
</tr>


</table>

</form>

</div>

</div>

</body>

    
    
</html>
