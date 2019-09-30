/* 
 * 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    (function() {
        
        
        var GetDate = function(){
        
        
        var fecha = new Date(); 
            horas = fecha.getHours(),
            ampm,
            minutos = fecha.getMinutes(),
            segundos = fecha.getSeconds(),
            diaSemana = fecha.getDay(),
            dia = fecha.getDay(),
            mes = fecha.getMonth(),
            year = fecha.getFullYear();
       
        
        var pFechaHora = document.getElementById("fechaHora");
           
       
       
       var semana = ["Domingo", 
                     "Lunes", 
                     "Martes", 
                     "Miércoles", 
                     "Jueves", 
                     "Viernes", 
                     "Sábado"];
                 
       var meses = ["Enero", 
                     "Febrero", 
                     "Marzo", "Abril", 
                     "Mayo", "Junio", 
                     "Julio", "Agosto", 
                     "Septiembre",
                     "Octubre", 
                     "Noviembre", 
                     "Diciembre"];
                
       
       
       if(horas >= 12)
       {
           horas = horas - 12;
           ampm = 'PM';
       }else
       {
          ampm = 'AM'; 
       }
       
       if(horas == 0)
       {
           horas = 12;
       }
       
       if (minutos < 10) {minutos = "0" + minutos;}
       if (segundos < 10) {segundos = "0" + segundos;}
       
       

      pFechaHora.textContent = semana[diaSemana]+ " " + dia + " de " + meses[mes] + " del " + year + " "+ horas+ ":" + minutos + ":"+ segundos + " " +ampm;
       
        //var fechaxa = semana[diaSemana]+ " " + dia + " de " + meses[mes] + " del " + year + " "+ horas+ ":" + minutos + ":"+ segundos + " " +ampm;
       
       // document.write(fechaxa);
       
       GetDate();
       var intervalo =  setInterval(GetDate(), 1000);
       
        };
    
    }())


