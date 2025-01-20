// Este validate es un superconjunto del otro (js/validate.js), y estï¿œ adaptado para el B2C

/* Esta funciï¿œn compara dos fechas en el formato dd/mm/yyyy. Devuelve true si la fecha inicial es menor que la final. */
function checkDate(initDate, endDate){
	var salida=true;
	var initDateInDays=0;
	var endDateInDays=0;
	var tempInitDate=initDate;
	var tempEndDate=endDate;
	var valuesInitDate=tempInitDate.split("/");
	var valuesEndDate=tempEndDate.split("/");
	var tmp=0;

	// Calculamos el nï¿œmero de dias de la fecha inicial
 	// Se calcula el nï¿œmero total de dias de la fecha actual, para ello se multiplican los meses por 31 y los aï¿œos por 365 dias
	for (n=0;n<valuesInitDate.length;n++){
		tmp = parseInt(valuesInitDate[n],10);
		if (n == 1){
			tmp = tmp * 31;
		}
		if (n == 2){
			tmp = tmp * 365;
		}
		initDateInDays = initDateInDays + tmp;
	}

	// Calculamos el nï¿œmero de dï¿œas de la fecha final
    tmp=0;
	for (n=0;n<valuesEndDate.length;n++){
		tmp = parseInt(valuesEndDate[n],10);
		if (n == 1){
			tmp = tmp * 31;
		}
		if (n == 2){
			tmp = tmp * 365;
		}
		endDateInDays = endDateInDays + tmp;
	}

	if (initDateInDays>endDateInDays){
    	salida=false;
	}

	return salida;
}

/* Comprueba el formato de la fecha. */
function validaFecha(fecha){
	if (fecha.length != 0) {
		var reg = new RegExp("^[0-9][0-9]?/[0-1]?[0-9]/[1-9][0-9]{3}$", "i");
		if(fecha.search(reg)==0){
			var indice=fecha.indexOf('/');
			var dia=fecha.substring(0,indice);
			var indice2=fecha.indexOf('/',indice+1);
			var mes=fecha.substring(indice+1,indice2);
			var anyo=fecha.substring(indice2+1);
			var dia_mes_mal=false;
			if(dia=="" || mes=="" || anyo==""){
				//alert("Fecha incompleta");
				return false;
			}	
			else{
				if(!isNaN(dia) && !isNaN(mes) && !isNaN(anyo) && dia>=1 && mes>=1 && anyo>=1900){
					if(mes>12)
						dia_mes_mal=true;
					if((mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12) && dia>31)
						dia_mes_mal=true;
					if((mes==4 || mes==6 || mes==9 || mes==11) && dia>30)
						dia_mes_mal=true;
					if(mes==2 && (dia>29 || (dia==29 && (anyo%400!=0) && ((anyo%4!=0) || (anyo%100==0)))))
						dia_mes_mal=true;
					if(dia_mes_mal){
						//alert("Fecha errï¿œnea. "+dia+"/"+mes+"/"+anyo);
						return false;
					}
					else{
						return true;
					}
				}
				else{
					//alert("Fecha errï¿œnea. "+dia+"/"+mes+"/"+anyo);
					return false;
				}	
			}
		}else{
			//alert("Formato de Fecha Incorrecto. (dd/mm/aaaa)");
			return false;
		}
	}
	return true;
}

// Compara dos fechas en formato dd/mm/aaaa
function dateIsBefore(date1, date2) {
	
		var dtCh= "/";
				
		// Las fechas no son obligatorias
		if ((date1 == "") || (date2 == "" )) {
    	return false;
    }
      		
		var pos1 = date1.indexOf(dtCh);
		var pos2 = date2.indexOf(dtCh,pos1+1);
		var strDay1 = date1.substring(0,pos1);
		var strMonth1 = date1.substring(pos1+1,pos2);
		var strYear1 = date1.substring(pos2+1);
		var strDay2 = date2.substring(0,pos1);
		var strMonth2 = date2.substring(pos1+1,pos2);
		var strYear2 = date2.substring(pos2+1);
		
		// Reordenamos la fecha en formato mm/dd/aaaa
		ndate1 = strMonth1 + "/" + strDay1 + "/" + strYear1;
		ndate2 = strMonth2 + "/" + strDay2 + "/" + strYear2;
		
		var d1 = new Date(ndate1);
		var d2 = new Date(ndate2);
		if (d1 <= d2) {
			//alert(d1 + " es menor que " + d2 + " (true)");
			return false;
		} else {
			//alert(d1 + " es mayor que " + d2 + " (false)");
			return true;
		} 
	}

/* VALIDAR EL FORMATO DE UN Nï¿œMERO */
/* Indica si el elemento contiene algï¿œn punto */
function tienePunto(item) {
	var indice = item.value.indexOf(".");
	if (indice > 0)
		return true;
	else 
		return false;
}

/* Comprueba que valor sï¿œlo contenga dï¿œgito */
function checknumber (valor){
	// Cambiar las comas decimales por puntos
	var x = valor;//.replace(",",".");
		
	// No se admiten numeros negativos
	var bSigned = false;

	// Expresion regular
	var anum = new RegExp("^\\d+\\,?\\d*$");

	if (anum.test(x)) 
		resultado = (parseFloat(valor) >= 0);
	else
		resultado = false;
		
	return (resultado);
}

/* 
	Comprueba que el campo sea un nï¿œmero cuya parte entera sea menor o igual que nEnteros y su parte 
	decimal menor o igual de nDecimales	
 */
function compruebaNumero(campo, mensaje, nEnteros, nDecimales){
	if (tienePunto(campo)) {
		BootstrapDialog.alert(mensaje, function(){});		
 		//campo.value = "";
 		return false;
 	}
	campo.value = campo.value.replace(".",",");
	if (campo.value == "0") {
		BootstrapDialog.alert(mensaje, function(){});
		//campo.value = "";
		eval("campo.focus()");
		return false;
	}

	if (campo.value.length <= 0) {
		return true;
	}
		
	i = campo.value.indexOf(",");
	
	if(i != -1) {
		entero = campo.value.substring(0,i);
		decimal = campo.value.substring(i+1,campo.value.length);		
		if (decimal.length > nDecimales || entero.length > nEnteros) {
			BootstrapDialog.alert(mensaje, function(){});
	 		//campo.value = "";
	 		return false;
	 	}
	} else {
		entero = campo.value;			
		if (entero.length > nEnteros) {
			BootstrapDialog.alert(mensaje, function(){});
	 		//campo.value = "";
	 		return false;
	 	}
	}

	if (!checknumber(campo.value)){
		BootstrapDialog.alert(mensaje, function(){});
		//campo.value = "";
		eval("campo.focus()");
		return false;
	} else {
		return true;
	}
}

/* 
Comprueba que el campo sea un nï¿œmero cuya parte entera sea menor o igual que nEnteros y su parte 
decimal menor o igual de nDecimales, (deja pasar el 0)
*/
function compruebaNumero2(campo, mensaje, nEnteros, nDecimales){
	if (tienePunto(campo)) {
		BootstrapDialog.alert(mensaje, function(){});		
			//campo.value = "";
			return false;
		}
	campo.value = campo.value.replace(".",",");
	
	if (campo.value.length <= 0) {
		return true;
	}
		
	i = campo.value.indexOf(",");
	
	if(i != -1) {
		entero = campo.value.substring(0,i);
		decimal = campo.value.substring(i+1,campo.value.length);		
		if (decimal.length > nDecimales || entero.length > nEnteros) {
			BootstrapDialog.alert(mensaje, function(){});
	 		//campo.value = "";
	 		return false;
	 	}
	} else {
		entero = campo.value;			
		if (entero.length > nEnteros) {
			BootstrapDialog.alert(mensaje, function(){});
	 		//campo.value = "";
	 		return false;
	 	}
	}
	
	if (!checknumber(campo.value)){
		BootstrapDialog.alert(mensaje, function(){});
		//campo.value = "";
		eval("campo.focus()");
		return false;
	} else {
		return true;
	}
}

/* 
Comprueba que el campo sea un nï¿œmero cuya parte entera sea menor o igual que nEnteros, su parte 
decimal menor o igual de nDecimales, y su valor entero sea mayor o igual que el entero Mï¿œnimo.
*/
function compruebaNumero3(campo, mensaje, nEnteros, nDecimales, enteroMinimo){
	if (tienePunto(campo)) {
		BootstrapDialog.alert(mensaje, function(){});		
			//campo.value = "";
			return false;
		}
	campo.value = campo.value.replace(".",",");
	
	if (campo.value.length <= 0) {
		return true;
	}
		
	i = campo.value.indexOf(",");
	
	if(i != -1) {
		entero = campo.value.substring(0,i);
		decimal = campo.value.substring(i+1,campo.value.length);		
		if ((decimal.length > nDecimales) || (entero.length > nEnteros)) {
			BootstrapDialog.alert(mensaje, function(){});
	 		//campo.value = "";
	 		return false;
	 	}
		
	} else {
		entero = campo.value;
		if (entero.length > nEnteros) {
			BootstrapDialog.alert(mensaje, function(){});
	 		//campo.value = "";
	 		return false;
	 	}
	}
	
	if (!checknumber(campo.value)){
		BootstrapDialog.alert(mensaje, function(){});
		//campo.value = "";
		eval("campo.focus()");
		return false;
	} else {
		if(campo.value < enteroMinimo) {
			BootstrapDialog.alert(mensaje, function(){});
			return false;
		}
		else {
			return true;
		}
	}
}


/* 
Comprueba que los dos campos tengan valores numï¿œricos enteros, y que el valor del primer campo no sea mayor que el del segundo.
*/
function compruebaEnteroMayorOIgualQue(campo1, campo2, mensaje){
	var numero1 = Number(campo1.value);
	var numero2 = Number(campo2.value);
	
	if(Number.isInteger(numero1) && Number.isInteger(numero2)) {
		if(numero1 > numero2) {
			BootstrapDialog.alert(mensaje, function(){});
			return false;
		}
		else {
			return true;
		}
	}
	else {
		BootstrapDialog.alert(mensaje, function(){});
		return false;
	}
}

/* 
	Compruena que el campo sea un nï¿œmero cuya parte entera sea menor o igual que nEnteros y su parte 
	decimal menor o igual de nDecimales	
 */
function validaNumero(campo, mensaje, nEnteros, nDecimales,showMessage){
	if (showMessage) {
		return compruebaNumero(campo, mensaje, nEnteros, nDecimales);
	} else {
		if (tienePunto(campo)) {
	 		return false;
	 	}
		campo.value = campo.value.replace(".",",");
		if (campo.value == "0") {
			eval("campo.focus()");
			return false;
		}
	
		if (campo.value.length <= 0) {
			return true;
		}
			
		i = campo.value.indexOf(",");
		
		if(i != -1) {
			entero = campo.value.substring(0,i);
			decimal = campo.value.substring(i+1,campo.value.length);		
			if (decimal.length > nDecimales || entero.length > nEnteros) {
				return false;
		 	}
		} else {
			entero = campo.value;			
			if (entero.length > nEnteros) {
				return false;
		 	}
		}
	
		if (!checknumber(campo.value)){
			eval("campo.focus()");
			return false;
		} else {
			return true;
		}
	}
}

/* Valida el formato de una URL */
function validaURLs(url) { 
	var re=/^(http):\/\/\w+(\.\w+)*\.\w{2,3}$/;
	
	return re.test(url); 
} 

/* Comprueba si el campo es vacï¿œo */
function vacio(campo) {
	return (campo.value.length == 0);
}

/* Comprueba que el campo sea un entero de 5 dï¿œgitos (cï¿œdigo postal) y que los 2 primeros dï¿œgitos sean los de la provincia seleccionada (sï¿œlo para espaï¿œa) */
function cp(campo, prepostal) {
	if (prepostal != '0')
		return cpPre(campo, prepostal);
		
	return true;
}

/* Indica si dos campos son iguales */
function iguales(campo1, campo2) {
	return (campo1.value == campo2.value);
}

/* Comprueba si el campo es un entero */
function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (i == 0 && c != "-"  && ((c < "0") || (c > "9")))  return false;
        if (i != 0 && ((c < "0") || (c > "9"))) return false;
    }
    return true;
}

/* Valida el formato de un dni */
function nif(dni) {
	var vDni = dni;	
	if (vDni.charAt(0).toUpperCase() == "X") {
		vDni = vDni.substr(1,vDni.length);
	}
		
  numero = vDni.substr(0,vDni.length-1);  
  if (!isInteger(numero)) return false;
  letr = vDni.substr(vDni.length-1,1);
  numero = numero % 23;
  letra='TRWAGMYFPDXBNJZSQVHLCKET';
  letra=letra.substring(numero,numero+1);
  if (letra!=letr) return false;
  
  return true;
}

/* Comprueba si el campo obligatorio estï¿œ relleno si no muestra un mensaje */
function obligatorioExiste(campo,msg) {
	if (vacio(campo)) {
		fixElement(campo,msg);
		return false;	
	}
	return true;
}

function existe(campo) {
	if (vacio(campo)) {
		return false;	
	}
	return true;
}

/* Comprueba si el campo obligatorio estï¿œ marcado si no muestra un mensaje */
function obligatorioCheck(campo,msg) {
	var i = 0;
	for (i=0;i<campo.length;i++) { 
  	if (campo[i].checked) 
    	break; 
  } 
	
	if (i >= campo.length) {
		fixElement(campo,msg);
		return false;	
	}
	return true;
}

/* Devuelve el nï¿œmero de elementos marcados en el formulario */
function contarCBMarcados(form){
		contElem = 0;
		numElem = form.elements.length;
		
  		// Buscar almenos algï¿œn elemento
  		for (i=0; i < numElem; i++) {
	     	if ((form.elements[i].type == 'checkbox') && (form.elements[i].checked == 1)) {
				contElem++;
	     	}
  		}
  		return(contElem);
}

/* Devuelve el nï¿œmero de elementos selecionados en un DataTables */
function contarDTMarcados(dt){
	contElem = dt.DataTable().rows({selected:true}).count();
	return(contElem);
}

/*Comprueba que todos los campos son numï¿œricos usando la funciï¿œn checknumber(form) */
function allInputAreNumber(form){

		numElem = form.elements.length;		
  		// Buscar almenos algï¿œn elemento
  		for (i=0; i < numElem; i++) {
	     	if ((form.elements[i].type == 'text')){
	     		if(!checknumber(form.elements[i].value)) {	     		
	     			form.elements[i].focus();
		     		return false;
	     		}
	     	}
  		}
  		return true;
}


/*Comprueba que todos los campos son numï¿œricos usando la funciï¿œn checknumber(form) */
function allInputAreInteger(form){

		numElem = form.elements.length;		
  		// Buscar almenos algï¿œn elemento
  		for (i=0; i < numElem; i++) {
	     	if ((form.elements[i].type == 'text')){
	     		if(!isInteger(form.elements[i].value) || vacio(form.elements[i])) {	     		
	     			form.elements[i].focus();
		     		return false;
	     		}
	     	}
  		}
  		return true;
}

/* INICIO: Validar el formato de una direcciï¿œn de correo */

function emailCheck2 (emailStr) {

	/* El siguiente patrï¿œn se usa para comprobar que el formato del email 
		 completo sigue el formato user@domain*/
	var emailPat=/^(.+)@(.+)$/;
	/* La siguiente cadena es un patron para evitar el uso de caracteres 
	   especiales en la direcciï¿œn de correo. Estos caracteres incluyen 
	   ( ) < > @ , ; : \ " . [ ]    */
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
	/* El siguiente patrï¿œn representa los caracteres no permitidos en 
		 el username o en el domainname. */
	var validChars="\[^\\s" + specialChars + "\]";
	/* El siguiente patrï¿œn aplicado al username permite direcciones del 
	   estilo "jiminy cricket"@disney.com */
	var quotedUser="(\"[^\"]*\")";
	/* El siguiente patrï¿œn aplicado al fomainname permite dominios que son
		 direcciones IP joe@[123.124.233.4] */
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
	/* Representa una serie de caracteres no especiales */
	var atom=validChars + '+';
	/* El siguiente patrï¿œn representa una palabra en el username */
	var word="(" + atom + "|" + quotedUser + ")";
	// El siguiente patrï¿œn describe la estructura del username
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
	/* El siguiente patrï¿œn describe la estructura del domainname */
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");
	
	/* Ahora, se pasa a validar el formato */
	
	/* Se comienza dividiendo la direcciï¿œn de correo en las distintas partes
	   que lo componen username @ domainname. */
	var matchArray=emailStr.match(emailPat);
	if (matchArray==null) {
	  /* No cumple el formato user@domain */
		return false;
	}
	var user=matchArray[1];
	var domain=matchArray[2];
	
	// Vemos si el usuario es vï¿œlido 
	if (user.match(userPat)==null) {
	    // Usuario no vï¿œlido
	    return false;
	}
	
	/* Si el dominio es una direcciï¿œn IP habrï¿œ que asegurarse de que la 
	   IP es vï¿œlida. */
	var IPArray=domain.match(ipDomainPat);
	if (IPArray!=null) {
	    // Si es una direcciï¿œn IP
		  for (var i=1;i<=4;i++) {
		    if (IPArray[i]>255) {
		        //alert("Direccion IP no valida!")
						return false;
		    }
	    }
	    return true;
	}
	
	// Si el dominio es un nombre
	var domainArray=domain.match(domainPat);
	if (domainArray==null) {
		//alert("El nombre de dominio parace no ser correcto.")
	  return false;
	}
	
	/* Nombre de dominio parece vï¿œlido, pero ahora asegurarse de que termina en una 
		 palabra de tres letras (como com, edu, gov) o una palabra de dos letras, 
		 que representa a los paï¿œses (uk, nl), y que hay un nombre de host anterior. */
		 
	/* Ahora hay que dividir el dominio para ver si se compone de las partes necesarias. */
	var atomPat=new RegExp(atom,"g");
	var domArr=domain.match(atomPat);
	var len=domArr.length;
	if (domArr[domArr.length-1].length<2) {
	   // La direcciï¿œn de email debe acabar en una palabra de 2 o mï¿œs letras. 
	   //Dominios de primer nivel: http://www.iana.org/domains/root/db/
	   return false;
	}
	
	// Nos aseguramos que hay un nombre de host precediendo al dominio
	if (len<2) {
	   return false;
	}
	
	return true;
}
/* FIN: Validar el formato de una direcciï¿œn de correo */

/* Muestra un mensaje de errro y le da el foco al campo en cuestion */
function fixElement(element, message) {
	BootstrapDialog.alert(message, function(){});
	element.focus();
}

/* Comprueba si una cadena es alfanumï¿œrica */
function esAlfanumerica(cadena)
{
	var Template = /^[a-z0-9 ]+$/i; //Formato de alfanumerico
	//Compara "cadena" con el formato "Template" y si coincide devuelve verdadero si no devuelve falso
	return (Template.test(cadena)) ? true : false; 
}

/* Comprueba si la cadena contiene sï¿œlo letras , incluidos acentos, diï¿œresis , apostrofes y puntos*/
function esAlfabetica(cadena)
{
	var Template = /^[a-zï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œï¿œ'., ]+$/i; //Formato de alfabï¿œtico
	//Compara "cadena" con el formato "Template" y si coincide devuelve verdadero si no devuelve falso
	return (Template.test(cadena)) ? true : false; 
}

function cpPortugal(field) {
	var valid = "0123456789-";
	var hyphencount = 0;
	
	if (field.length!=8) {
		return false;
	}
	for (var i=0; i < field.length; i++) {
		temp = "" + field.substring(i, i+1);
		if (temp == "-") hyphencount++;
		if (valid.indexOf(temp) == "-1") {
			//alert("Codigo Postal no valido.  Por favor, entrelo otra vez.");
			return false;
		}
		if ((hyphencount > 1) || ((field.length==8) && ""+field.charAt(4)!="-")) {
			//alert("The hyphen character should be used with a properly formatted 4 digit+3 digit, like '1234-567'.   Please try again.");
			return false;
	  }
	}
	return true;
}

function cpPre(campo, prepostal) {
	var str1 = campo.value;
//	if (!isInteger(campo.value)) {		
//		alert(__cpNumerico);
//		return false;
	if (prepostal != 0 && prepostal.length == 1 && (campo.value.length < 4 || campo.value.length > 5)) {
		BootstrapDialog.alert(__cpLongitud, function(){});		
		return false;
	} else if (prepostal != 0 && campo.value.length != 5 && (prepostal.length == 2 || (prepostal.length == 1 && campo.value.substring(0,2) == '0'+prepostal))) {
		BootstrapDialog.alert(__cpLong5, function(){});
		return false;	
	} else if ( prepostal != 0 && !comparePrepostal(str1, prepostal) 
//			    (
//			      (prepostal.length == 1 && (campo.value.substring(0,1) != prepostal && campo.value.substring(0,2) != '0'+prepostal)) ||
//			      (prepostal.length == 2 && campo.value.substring(0,2) != prepostal)
//			    )  
			  ) {
		BootstrapDialog.alert(__cpInvalido + prepostal, function(){});		
		return false;
	}
		
	return true;
}

function trim(str) { 
	var st1 = str.replace(/^\s*/, ''); 
	var st2 = st1.replace(/\s*$/, '');

	return st2;
} 

// Valida el formato del CIF para empresas espaï¿œolas
function comprobarcif(cif) {
	var temp = 0;
	var v1 = new Array(0,2,4,6,8,1,3,5,7,9); 
	 if (!/^[A-Za-z0-9]{9}$/.test(cif)){ // Son 9 dï¿œgitos?                                     
			// No es un CIF
			return false
		} else if (!/^[ABCDEFGHKLMNPQS]/.test(cif)){
			// No es un CIF
			return false
		}
		
		for( i = 2; i <= 6; i += 2 ){
			temp = temp + v1[ parseInt(cif.substr(i-1,1))];
			temp = temp + parseInt(cif.substr(i,1));
		};

		temp = temp + v1[ parseInt(cif.substr(7,1))];
		temp = (10 - ( temp % 10));

		if (temp==10) {
			temp = 0;
		}
		if ( temp != cif.charAt(8) ){
			// No es un CIF
			return false
		} 

		return true
}


/* Valida si la cadena de entrada se corresponde con una nif o cif vï¿œlido en el caso de que se trate de un usuario ubicado en Espaï¿œa. */
// 2019-07-08: No se estï¿œ usando.
function validarNIFCIF(cadena, pais) {	
	cadena = cadena.toUpperCase();
	if (pais.toUpperCase() == "ESPAï¿œA") {
		if (!nif(cadena)) {
			if (!comprobarcif(cadena)) {
				return false;
			} else {
				return true;
			}
		} else {
			return true;
		}
	} else {
		return true;
	}
}

/* Comprueba que los 2 primeros dï¿œgitos sean los de la provincia seleccionada (solo para Espaï¿œa) */
function codePostalES(campo, prepostal) {

	if (prepostal != '0')
		return cpPre(campo, prepostal);

	return true;
}

/* Comprueba que los primeros dï¿œgitos sean los de la provincia seleccionada (solo para Portugal) */
function codePostalPT(campo, prepostal) {

	if (prepostal != '0') {
		var zipval = campo.value;

		if (zipval.length != 8) {
			BootstrapDialog.alert(__cpLongitud, function(){});
			return false;
		} else if (!comparePrepostalVar(zipval, prepostal)) {
			BootstrapDialog.alert(__cpInvalido + prepostal, function(){});
			return false;
		}
	}

	return true;
}

/* Comprueba que los primeros dï¿œgitos sean los de la provincia seleccionada (solo para Francia) */
function codePostalFR(campo, prepostal) {

	if (prepostal != '0') {
		var zipval = campo.value;

		if (zipval.length != 5) {
			BootstrapDialog.alert(__cpLongitud, function(){});
			return false;
		} else if (!comparePrepostalVar(zipval, prepostal)) {
			BootstrapDialog.alert(__cpInvalido + prepostal, function(){});
			return false;
		}
	}

	return true;
}

/* Comprueba que el cÃ³digo postal es de BÃ©gica (longitud = 4) */
function codePostalBE(campo, prepostal) {

		var zipval = campo.value;

		if (prepostal != '0') {
			if (zipval.length != 4) {
				BootstrapDialog.alert(__cpLongitud, function(){});
				return false; 
			} else if (!comparePrepostalVar(zipval, prepostal)) {
				BootstrapDialog.alert(__cpInvalido + prepostal, function(){});
				return false;
			}	
		}	

	return true;
}

function cpPortugal(field) {
	var valid = "0123456789-";
	var hyphencount = 0;
	
	if (field.length!=8) {
		return false;
	}
	for (var i=0; i < field.length; i++) {
		temp = "" + field.substring(i, i+1);
		if (temp == "-") hyphencount++;
		if (valid.indexOf(temp) == "-1") {
			//alert("Codigo Postal no valido.  Por favor, entrelo otra vez.");
			return false;
		}
		if ((hyphencount > 1) || ((field.length==8) && ""+field.charAt(4)!="-")) {
			//alert("The hyphen character should be used with a properly formatted 4 digit+3 digit, like '1234-567'.   Please try again.");
			return false;
	  }
	}
	return true;
}

function cpPre(campo, prepostal) {

	var zipval = campo.value;

	if (zipval.length != 5) {
		BootstrapDialog.alert(__cpLong5, function(){});
		return false;
	} else if (!comparePrepostal(zipval, prepostal)) {
		BootstrapDialog.alert(__cpInvalido + prepostal, function(){});
		return false;
	}

	return true;
}

//Comprueba que los dos dï¿œgitos iniciales del cï¿œdigo postal son correctos
function comparePrepostal(str1, str2) {
	var isPrepostal = false;
	if (str1.length == 4 && str1.charAt(0) == str2) {
		isPrepostal = true;

	}else if(str1.length == 5) {
		var prep = str1.charAt(0) + str1.charAt(1);
		if (prep == str2 || prep == "0" + str2) {
			isPrepostal = true;
		}
	}
	
	return isPrepostal;
}

//Comprueba que los dï¿œgitos iniciales del cï¿œdigo postal son correctos
function comparePrepostalVar(zip, prepostal) {

	var isPrepostal = false;

	if (prepostal.length == 1 && zip.charAt(0) == prepostal) {
		isPrepostal = true;
	} else if (prepostal.length == 2) {
		var prep = zip.charAt(0) + zip.charAt(1);
		if (prep == prepostal)
			isPrepostal = true;
	} else if (prepostal.length == 3) {
		var prep = zip.charAt(0) + zip.charAt(1) + zip.charAt(2);
		if (prep == prepostal)
			isPrepostal = true;
	} else if (prepostal.length == 4) {
		var prep = zip.charAt(0) + zip.charAt(1) + zip.charAt(2) + zip.charAt(3);
		if (prep == prepostal)
			isPrepostal = true;
	} else if (prepostal.length == 5) {
		var prep = zip.charAt(0) + zip.charAt(1) + zip.charAt(2) + zip.charAt(3) + zip.charAt(4);
		if (prep == prepostal)
			isPrepostal = true;
	}
	
	return isPrepostal;
}

//Mï¿œtodo que comprueba si se estan pegando codigos de productos en el formato corrento en un textArea. Tambiï¿œn impide que se puedan escribir caracteres extraï¿œos
//Se debe de incluir para utilizarlo un <span> con un mensaje de texto que avise al usuario de que el formato que intenta pegar es incorrecto
//Para usuarlo hay que pasar el id del textArea a la funcion y tambien ocultar el mensaje de texto del error. Ej: Se incluyen estas dos linea en el document.ready
//checkPasteCodigosProdTexArea("productosMinicatalogo");
//$('.errorFormat').hide();
function checkPasteCodigosProdTexArea(idTexArea){
	$("#"+idTexArea).bind('keypress paste', function (event) {
		 var clipboardData, pastedData;
		 clipboardData = event.clipboardData || window.clipboardData || event.originalEvent.clipboardData;
		 
		 var regexPaste = /^\s?-?[a-zA-Z0-9:'\s-]+(\s*,\s*-?[a-zA-Z0-9:'\s-]+)*?$/; 
		 var regexKey = /^[-a-zA-Z0-9,\s]+$/; 
		 var key = "";
			if(event.charCode == undefined){
				key = clipboardData.getData('Text').toUpperCase();
				
				 if (!regexPaste.test(key)) {
					    event.preventDefault();
					    $("#"+event.currentTarget.id).parent().find(".errorFormat").show();
					    return false;
					 }else{
						 $("#"+event.currentTarget.id).parent().find(".errorFormat").hide();
					 }
			}else{
				key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
				
				 if (!regexKey.test(key)) {
					    event.preventDefault();
					    return false;
					 }else{
						 $("#"+event.currentTarget.id).parent().find(".errorFormat").hide(); 
					 }
			}
			
		
		 });
}

//Mï¿œtodo que comprueba si se estan pegando texto con caracteres raros en un input. Tambiï¿œn impide que se puedan escribir caracteres extraï¿œos
//Se debe de incluir para utilizarlo un <span> con un mensaje de texto que avise al usuario de que el formato que intenta pegar es incorrecto
//Para usuarlo hay que pasar el id del input a la funcion y tambien ocultar el mensaje de texto del error. Ej: Se incluyen estas dos linea en el document.ready
//checkPasteCaracteresRaros("destacado1");
function checkPasteCaracteresRaros(idInput){
	$("#"+idInput).bind('keypress paste', function (event) {
		 var clipboardData;
		 clipboardData = event.clipboardData || window.clipboardData || event.originalEvent.clipboardData;

		var regex = /^[a-zA-Z0-9-\u00f1\u00d1\u00E0-\u00FC\s]+$/;
		 var key = "";
		if(event.charCode == undefined){
			key = clipboardData.getData('Text').toUpperCase();
			
			if (!regex.test(key)) {
			    event.preventDefault();
			    $("#"+event.currentTarget.id).parent().find(".errorFormat").show();
			    return false;
			 }else{
				 $("#"+event.currentTarget.id).parent().find(".errorFormat").hide(); 
			 }
		}else{
			key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
			
			if (!regex.test(key)) {
			    event.preventDefault();
			    return false;
			 }else {
				 $("#"+event.currentTarget.id).parent().find(".errorFormat").hide(); 
			 }
		}
		 
		 });
}

function validaTextAreaVacio(valueTextArea){
		if(valueTextArea != undefined){
			if(valueTextArea.trim().length == 0){
				return false;
			}else {
				return true;
			}
		}

}
//Mï¿œtodo que valida los codigos de productos en los textArea de minicatalogo y personalizacion de pagina de inicio. Formato cod1, cod1,...
function validaTextAreaCodProd(cadenaValidar) {  
	var regex = /^\s?-?[a-zA-Z0-9]+(\s*,\s*-?[a-zA-Z0-9]+)*?$/;
    return regex.test(cadenaValidar);
}