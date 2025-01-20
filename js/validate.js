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

/* Comprueba el formato de la fecha.
 * Es el mismo que se tiene en el /b2c/validate.js
 */
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

/* Comprueba que los 2 primeros dï¿œgitos sean los de la provincia seleccionada (solo para Espaï¿œa). */
function codePostalES(campo, prepostal) {

	if (prepostal != '0')
		return cpPre(campo, prepostal);

	return true;
}
//
/* Comprueba que los tres primeros dï¿œgitos sean los de la provincia seleccionada (solo para Andorra). */
function codePostalAD(campo, prepostal) {

	alert("DENTRO CODEPOSTAL");
	alert(campo + " - " + prepostal);
	if (prepostal != '0') {
		var zipval = campo.value;

		if (zipval.length != 5) {
			alert(__cpLongitud);
			return false;
		} else if (!comparePrepostalVar(zipval, prepostal)) {
			alert(__cpInvalido + prepostal);
			return false;
		}
	}

	return true;
}
/* Comprueba que los primeros dï¿œgitos sean los de la provincia seleccionada (solo para Portugal). */
function codePostalPT(campo, prepostal) {

	if (prepostal != '0') {
		var zipval = campo.value;

		if (zipval.length != 8) {
			alert(__cpLongitud);
			return false;
		} else if (!comparePrepostalVar(zipval, prepostal)) {
			alert(__cpInvalido + prepostal);
			return false;
		}
	}

	return true;
}

/* Comprueba que los primeros dï¿œgitos sean los de la provincia seleccionada (solo para Francia). */
function codePostalFR(campo, prepostal) {

	if (prepostal != '0') {
		var zipval = campo.value;

		if (zipval.length != 5) {
			alert(__cpLongitud);
			return false;
		} else if (!comparePrepostalVar(zipval, prepostal)) {
			alert(__cpInvalido + prepostal);
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
				alert(__cpLongitud);
				return false; 
			} else if (!comparePrepostalVar(zipval, prepostal)) {
				alert(__cpInvalido + prepostal);
				return false;
			}
		}	

	return true;
}

function cpPre(campo, prepostal) {

	var zipval = campo.value;

	if (zipval.length != 5) {
		alert(__cpLong5);
		return false;
	} else if (!comparePrepostal(zipval, prepostal)) {
		alert(__cpInvalido + prepostal);
		return false;
	}

	return true;
}
//
// Comprueba que los dos dï¿œgitos iniciales del cï¿œdigo postal son correctos
function comparePrepostal(str1, str2) {

	var isPrepostal = false;
	if (str1.length == 4 && str1.charAt(0) == str2) {
		isPrepostal = true;
	} else if (str1.length == 5) {
		var prep = str1.charAt(0) + str1.charAt(1);
		if (prep == str2 || prep == "0" + str2) {
			isPrepostal = true;
		}
	}
	
	return isPrepostal;
}
//
// Comprueba que los dï¿œgitos iniciales del cï¿œdigo postal son correctos
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
		var prep = zip.charAt(0) + zip.charAt(1) + zip.charAt(2) + zip.charAt(3) + + zip.charAt(4);
		if (prep == prepostal)
			isPrepostal = true;
	}
	
	return isPrepostal;
}

//
function validaTextAreaVacio(valueTextArea){
		if(valueTextArea != undefined){
			if(valueTextArea.trim().length == 0){
				return false;
			}else {
				return true;
			}
		}

}
//Mï¿œtodo que valida los codigos postales en los textArea numÃ©ricos separados por , Formato cod1, cod2,...
function validaTextAreaCodigos(cadenaValidar) {  
	var regex = /^\s?-?[a-zA-Z0-9]+(\s*,\s*-?[a-zA-Z0-9]+)*?$/;
    return regex.test(cadenaValidar);
}