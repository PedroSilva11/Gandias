 	// Realiza la selección de todos los checkbox del listado
 	//
 	// checkAll : Identificador del checkbox que selecciona todos los checkboxs
 	// check    : Identificador único de todos los checkboxs que deseamos que se 
 	//            seleccione cuando seleccionamos el checkbox de todos
 	function selectAll(checkAll, check){
		var newSelectedStatus = document.getElementById(checkAll).checked;
		var allCheckBoxs = document.getElementsByName(check);
		for (i = 0; i < allCheckBoxs.length; i++){
			allCheckBoxs[i].checked = newSelectedStatus;
		}// End for
	}// End if

	// Si se ha seleccionado todos los checkboxs con el checkbox de 'Todos' y 
	// luego se ha deseleccionado uno desde el listado tb se deselecciona el 
	// checkbox de 'Todos'
	//
	// checkAll : Identificador del checkbox que selecciona todos los checkboxs
	function uncheckAll(checkAll){
		document.getElementById(checkAll).checked = false;
	}// End uncheckAll

	// Devuelve un array con el o los objectos cuyo id o name corresponda con el
	// parametro nameObj del formulario formName
	function getObjects(formName, nameObj){
		var form = document.getElementById(formName);
		
		var allObjs = new Array();
		
		for (i=0; i < form.length; i++){
			if (form.elements[i].id == nameObj || form.elements[i].name == nameObj){
				allObjs.push(form.elements[i]);
			}// End if
		}// End for
		return allObjs;
	}// End getObjects
	
	// Obtiene una lista de todos los checkbox seleccionados por el usuario
	//
	// formName : Identificador o nombre único del formulario
	// check : Identificador o nombre único de los checkboxs
	//
	// Devuelve la lista de elementos checkbox seleccionados por el usario
	function getAllCheckBoxsSelected(formName, check){
		var form = document.getElementById(formName);

		var allCheckBoxs = getObjects(formName, check);

		var allCheckBoxsSelected = new Array();

		for (i = 0; i < allCheckBoxs.length; i++){
			if (allCheckBoxs[i].checked){
				allCheckBoxsSelected.push(allCheckBoxs[i]);
			}// End if
		}// End for
		return allCheckBoxsSelected;
	}// End getAllCheckBoxsSelected

	// Devuelve una cadena separada por comas de todos los 'id' asociados a los 
	// checkboxs seleccionados
	//
	// formName : Identificador o nombre único del formulario
	// check : Identificador o nombre único de los checkboxs
	//
	// Devuelve una cadena de caracteres 
	function selectedCodes(formName, check){

		var allCheckBoxsSelected = getAllCheckBoxsSelected(formName, check);
		var arraySelectedCodes = new Array();
		for (i = 0; i < allCheckBoxsSelected.length; i++){
			if (allCheckBoxsSelected[i].checked){
				arraySelectedCodes.push(allCheckBoxsSelected[i].value);
			}// End if
		}// End for
		var codesSelected = arraySelectedCodes.join();

		return codesSelected;
	}// End selectedCodes

    // Va a la operación/página que se establece como parámetro si es posible
    // si el perfil lo permite
    //
    // formName  : Nombre del formulario
    // operation : Nombre de la operación de creación
    // page      : Página de entrada de la operación de creación
	function irA(formName, operation, page){
		
		form = document.getElementById(formName);
	
		var o = form.elements['o'];
		o.value = operation; 
		
		var p = form.elements['p'];
		p.value = page;
		
		form.submit();
	}// End irA
	
    // Ejecuta la operación de creación
    //
    // formName  : Nombre del formulario
    // operation : Nombre de la operación de creación
    // page      : Página de entrada de la operación de creación
	function nuevo(formName, operation, page){
		form = document.getElementById(formName);
		o = form.elements['o'];
		o.value = operation; 
		var p = form.elements['p'];
		p.value = page;
		form.submit();
		
	}// End nuevo
  
  	// Ejecuta la operación de modificación
    //
    // formName  : Nombre del formulario
    // operation : Nombre de la operación de creación
    // page      : Página de entrada de la operación de creación
    // hiddenId  : Identificador del campo hidden dónde se enviará la lista de 
    //             códigos seleccionados
  	// check     : Identificador o nombre único de los checkboxs
	function borrar(formName, operation, page, hiddenId, check){
		
		// Fijamos la operación de eliminación
		form = document.getElementById(formName);
	
		var o = form.elements['o'];
		o.value = operation; 
		
		var p = form.elements['p'];
		p.value = page;
		/////////////////////////////////////
		var codesSelected = form.elements[hiddenId];

		codesSelected.value = selectedCodes(formName, check);
		
		if (codesSelected == null || (codesSelected != null && codesSelected.value == '')){
			alert("No hay seleccionado ningún elemento.");
			return false;
		}// End if
		
		var agree = confirmSubmit("¿Estás seguro que deseas eliminarlos?");
		if (agree)
			form.submit();
	}// End borrar	  	
	
	// Realiza la confirmación de la operación
	//
	// message : Texto de la confirmación
	//
	// Devuelve 'true' si la confirmación es positiva y 'false' en caso contrario
	function confirmSubmit(message){
	
		var agree = confirm(message);
		if (agree)
			return true ;
		else
			return false ;
	}// End confirmSubmit
	
	
	// Modifica un determinado parámetro de la url 
	//
	// url     : Cadena de texto que compone la url
	// param   : Nombre del parámetro a cambiar
	// paramVal: Nuevo valor del parámetro 
	//
	// Devuelve la url modificada con el nuevo valor del parámetro indicado
	function updateURLParameter(url, param, paramVal){
	    var newAdditionalURL = "";
	    var tempArray = url.split("?");
	    var baseURL = tempArray[0];
	    var additionalURL = tempArray[1];
	    var temp = "";
	    if (additionalURL) {
	        tempArray = additionalURL.split("&");
	        for (i=0; i<tempArray.length; i++){
	            if(tempArray[i].split('=')[0] != param){
	                newAdditionalURL += temp + tempArray[i];
	                temp = "&";
	            }
	        }
	    }

	    var rows_txt = temp + "" + param + "=" + paramVal;
	    return baseURL + "?" + newAdditionalURL + rows_txt;
	}
	
	// Realiza la comprobación de si una cadena de caracteres es un número o no
	// 
	// string : cadena de caracteres a comprobar si es un número
	//
	// Devuelve 'true' si la cadena es un número entero positivo y 'false' en 
	// caso contrario
	function isNumeric(string) {
		var Chars = "0123456789";
	
		for (var i = 0; i < string.length; i++) {
			if (Chars.indexOf(string.charAt(i)) == -1) {
				return false;
			}// End if
		}// End for
		
		return true;
	}// End isNumeric	
	
	// Realiza la comprobación de si una cadena de caracteres es un número 'double' 
	// o no.
	//
	// string : cadena de caracteres a comprobar si es un número double
	//
	// Devuelve 'true' si la cadena es un número double positivo y 'false' en 
	// caso contrario
	function isDouble(string){
		var validChars=/^[\d]+\.?[\d]*$/;
		if ( string != null && validChars.test(string)){
			return true;
		}else{
			return false;
		}// End if-else
	
	}// End isDouble
	
	// Realiza la comprobación de si una cadena de caracteres es un número 'double' considerando el punto y la coma como separador 
		// o no.
		//
		// string : cadena de caracteres a comprobar si es un número double
		//
		// Devuelve 'true' si la cadena es un número double positivo y 'false' en 
		// caso contrario
		function isDoubleSeparator(string){
			var validChars=/^[\d]+\.?[\d]*$/;
			var validCharsComa=/^[\d]+\,?[\d]*$/;
			if ( string != null && (validChars.test(string) || validCharsComa.test(string))){
				return true;
			}else{
				return false;
			}// End if-else
		
		}// End isDoubleSeparator
	
	// Realiza la comprobación de si una cadena de caracteres solo contiene 
	// letras.
	//
	// data : cadena de caracteres a comprobar si son sólo letras
	//
	// Devuelve 'true' si la cadena sólo contiene letras y 'false' en caso 
	// contrario.
	function isChar(data){
		varChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		var isChar = true;
		var index = 0;
		while ((index < data.length) && (isChar)){
	    	isChar = (varChars.indexOf(data.charAt(index)) != -1);
			index ++;
		}// End while
		
		if (!isChar){
	    	return false;
	    }else{
	    	return true;
	    }// End if-else
	    
	}// End isChar
	
	function setUpload(idiom){
		
		var TR_Web = document.getElementById('uploadWeb_TR.' + idiom);
		var TR_FTP = document.getElementById('uploadFTP_TR.' + idiom);
		
		var file = document.getElementById('file.' + idiom);
		var nameFile = document.getElementById('nameFile.' + idiom);
		var weightFile = document.getElementById('weightFile.' + idiom);
		
		var selectUpload = document.getElementById('upload.' + idiom);
		
		if (selectUpload != null && 
		    selectUpload.value != null 
		    && selectUpload.value == 'web'){

		    TR_Web.style.display = '';
		    file.disabled = false;
		    
		    TR_FTP.style.display = 'none';
		    nameFile.disabled = true;
		    weightFile.disabled = true;

		}else if (selectUpload != null && 
		    selectUpload.value != null 
		    && selectUpload.value == 'ftp'){

		    TR_Web.style.display = 'none';
		    file.disabled = true;
		    
		    TR_FTP.style.display = '';
		    nameFile.disabled = false;
		    weightFile.disabled = false;
		    
		}else {
		    TR_Web.style.display = 'none';
		    file.disabled = true;
		    
		    TR_FTP.style.display = 'none';
		    nameFile.disabled = true;
		    weightFile.disabled = true;
		}// End if-else if-else
		
	}// End setUpload	
	
	// Cambiar el color de fondo de la fila de una tabla
	// Ejemplo --> changeBGTR(document.getElementById('idTR'), 'silver') o
	//             changeBGTR(this, 'silver') donde this es el elemento tr
	// 
	// tr    : elemento TR de la tabla
	// color : cadena de caracteres con el color a cambiar
	function changeBGTR(tr, color){
		tr.style.backgroundColor = color;
	}// End changeBGTR
	
	function changeStyle(tr, className){
		tr.className = className;
	}// End changeStyle
	
	/*
	 * Pone todos los checkboxes de un formulario en el
	 * estado de selección indicado.
	 * 
	 * Parámetros:
	 *		f		El objeto formulario que contiene los checkboxes
	 *		state	El estado deseado: true para seleccionar y
	 *					false para lo contrario.
	 */
	function setAllCheckboxesState(f, state) {
		if (f && f.elements) {
			for (var i = 0; i < f.elements.length; i++) {
				if (f.elements[i].type == "checkbox") {
					f.elements[i].checked = state;
				}
			}
		}
	}
				
	/*
	 * Genera una contraseña aleatoriamente con el tamaño y el juego
	 * de caracteres indicados.
	 *
	 * @param		size		Tamaño de la clave generada. Por defecto 8.
	 *	 
	 * @param		chars		Juego de caracteres que pueden componenr la
	 *							clave. Si no se indica, se toma por defecto
	 * 							éste: [0-9a-ZA-Z]
	 *
	 * @return		Una cadena de caracteres con la clave generada
	 */
	 function generatePassword(size) {
	 	if (!size || size < 8) {
		 	size = 8;
		}
		
	 	charsDigitos = "0123456789";
	 	charsMinusculas = "abcdefghijklmnopqrstuvwxyz";
	 	charsMayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	 	charsCaracterEspecial = "$_-?.!";

	 	var password = "";

	 	for (var i = 2; i < size; i++) {
			if(i % 2 == 0){
	 			password = password + charsMinusculas.charAt( Math.round(Math.random() * (charsMinusculas.length - 1)));
			} else {
				password = password + charsMayusculas.charAt( Math.round(Math.random() * (charsMayusculas.length - 1)));
			}	
	 		
	 	}
	 	
 		password = password + charsCaracterEspecial.charAt( Math.round(Math.random() * (charsCaracterEspecial.length - 1)));
 		password = password + charsDigitos.charAt( Math.round(Math.random() * (charsDigitos.length - 1)));
	 	
	 	return password;
	 }	

	 
/* Comprueba si una cadena es alfanumérica */
function esAlfanumerica(cadena)
{
	var Template = /^[a-z0-9_ ]+$/i; //Formato de alfanumerico
	//Compara "cadena" con el formato "Template" y si coincide devuelve verdadero si no devuelve falso
	return (Template.test(cadena)) ? true : false; 
}

/* Comprueba si una cadena es alfanumérica con tildes */
function esAlfanumericaTildes(cadena)
{
	var Template = /^[a-z0-9_áéíóúñ ]+$/i; //Formato de alfanumerico
	//Compara "cadena" con el formato "Template" y si coincide devuelve verdadero si no devuelve falso
	return (Template.test(cadena)) ? true : false; 
}

/* Comprueba si una cadena es un teléfono válido */
function phoneCheck(cadena)
{
	// Formato: International & domestic phone numbers with extension
	var Template = /^([\+][0-9]{1,3}([ \.\-])?)?([\(]{1}[0-9]{3}[\)])?([0-9 \.\-]{1,20})((x|ext|extension)?[0-9]{1,4}?)$/i;

	return (Template.test(cadena)) ? true : false; 
}

/* Comprueba si un código postal es válido para ES, FR y PT */
function zipcodeCheck(cadena)
{
	// Formato ES y FR: 5 dígitos siempre; Formato PT: 4415-030  no debe comenzar con 0
	var Template = /(^\d{5}$|^[1-9][0-9]{3}-[0-9]{3}$)/i;

	return (Template.test(cadena)) ? true : false;
}

/* Comprueba si el formato del código postal es válido por país */
function zipcodeCheckByCountry(cadena, pais)
{
	var Template = / /i;
	
	if(pais == 'portugal'){
		cadena = cadena.replace(/\s+/g, "");
		Template = /^[1-9][0-9]{3}-[0-9]{3}$/i;	// Formato PT, no debe comenzar con 0, por ej.: 4415-030
	}else if(pais == 'andorra'){
		Template = /AD[1-7][0-9]{2}$/i;	// Formato Andorra, debe comenzar con AD+número, por ej.: AD5002, Andorra la Vella
	}else if(pais == 'gibraltar'){
		Template = /GX11[ _-]*1AA$/i;	// Formato Gibraltar, zip code único, por ej.: GX11 1AA
	}else if(pais == 'belgique'){
		Template = /^\d{4}$/i;	// Formato Bélgica, 4 dígitos siempre
	}else{	
		Template = /^\d{5}$/i;	// Formato ES y (FR, Monaco), 5 dígitos siempre
	}

	return (Template.test(cadena)) ? true : false;
}

/* INICIO: Validar el formato de una dirección de correo */
//Repetida en b2c/validate.js
function emailCheck(emailStr) {
	
	/* El siguiente patrón se usa para comprobar que el formato del email 
		 completo sigue el formato user@domain*/
	var emailPat=/^(.+)@(.+)$/;
	/* La siguiente cadena es un patron para evitar el uso de caracteres 
	   especiales en la dirección de correo. Estos caracteres incluyen 
	   ( ) < > @ , ; : \ " . [ ]    */
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
	/* El siguiente patrón representa los caracteres no permitidos en 
		 el username o en el domainname. */
	var validChars="\[^\\s" + specialChars + "\]";
	/* El siguiente patrón aplicado al username permite direcciones del 
	   estilo "jiminy cricket"@disney.com */
	var quotedUser="(\"[^\"]*\")";
	/* El siguiente patrón aplicado al fomainname permite dominios que son
		 direcciones IP joe@[123.124.233.4] */
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
	/* Representa una serie de caracteres no especiales */
	var atom=validChars + '+';
	/* El siguiente patrón representa una palabra en el username */
	var word="(" + atom + "|" + quotedUser + ")";
	// El siguiente patrón describe la estructura del username
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
	/* El siguiente patrón describe la estructura del domainname */
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");
	
	/* Ahora, se pasa a validar el formato */
	
	/* Se comienza dividiendo la dirección de correo en las distintas partes
	   que lo componen username @ domainname. */
	var matchArray=emailStr.match(emailPat);
	if (matchArray==null) {
	  /* No cumple el formato user@domain */
		return false;
	}
	var user=matchArray[1];
	var domain=matchArray[2];
	
	// Vemos si el usuario es válido 
	if (user.match(userPat)==null) {
	    // Usuario no válido
	    return false;
	}
	
	/* Si el dominio es una dirección IP habrá que asegurarse de que la 
	   IP es válida. */
	var IPArray=domain.match(ipDomainPat);
	if (IPArray!=null) {
	    // Si es una dirección IP
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
	
	/* Nombre de dominio parece válido, pero ahora asegurarse de que termina en una 
		 palabra de tres letras (como com, edu, gov) o una palabra de dos letras, 
		 que representa a los países (uk, nl), y que hay un nombre de host anterior. */
		 
	/* Ahora hay que dividir el dominio para ver si se compone de las partes necesarias. */
	var atomPat=new RegExp(atom,"g");
	var domArr=domain.match(atomPat);
	var len=domArr.length;
	if (domArr[domArr.length-1].length<2) {
	   // La dirección de email debe acabar en una palabra de 2 o más letras.
   	   //Dominios de primer nivel: http://www.iana.org/domains/root/db/
	   return false;
	}
	
	// Nos aseguramos que hay un nombre de host precediendo al dominio
	if (len<2) {
	   return false;
	}
	
	return true;
}

function multipleEmailCheck(emailStr, separator) {
    var emailTks = emailStr.split(separator);
    var size = emailTks.length;
    if (size > 3)  {
    	alert("3 emails max!");
        return false;
    }
    for (var i = 0; i < size; i++) {
        if (emailTks[i] != "") {
            if (!emailCheck(emailTks[i])) {
                return false;
            }
        }
    }
    return true;
}
/* FIN: Validar el formato de una dirección de correo */

function inc(elem,umv){
	var valor = parseInt(elem.value);

	elem.value = (isNaN(valor)) ? 0 : valor + parseInt(umv);
	
	if (elem.value>=100000) {
		elem.value = valor;
	}
}

function dec(elem,umv){
	var valor = parseInt(elem.value);	
		//NaN no es mayor que 0 ;)
		elem.value = valor > 0 ? valor - parseInt(umv) : 0;
		
		if (elem.value < 0) {
			elem.value = 0;
		}
}

$.fn.scrollToTop = function() {
	$(this).hide().removeAttr("href");
	if ($(window).scrollTop() != "0") {
	$(this).fadeIn("slow")
	}
	var scrollDiv = $(this);
	$(window).scroll(function() {
	if ($(window).scrollTop() == "0") {
	$(scrollDiv).fadeOut("slow")
	} else {
	$(scrollDiv).fadeIn("slow")
	}
	});
	$(this).click(function() {
	$("html, body").animate({
	scrollTop: 0
	}, "slow")
	})
}

function changeStyleAndNext(tr, className){		
	tr.className = className;
	$(tr).next()[0].className = className;
}// End changeStyle

function changeStyleAndPrev(tr, className){		
	tr.className = className;
	$(tr).prev()[0].className = className;
}// End changeStyle


function changeStyleAnd2Next(tr, className){		
	tr.className = className;
	$(tr).next()[0].className = className;
	$(tr).next().next()[0].className = className;
}

function changeStyleAnd2Prev(tr, className){		
	tr.className = className;
	$(tr).prev()[0].className = className;
	$(tr).prev().prev()[0].className = className;
}// End changeStyle

//
function showImageChange(f){
	var lista = document.getElementById('fListProd');
	if(f.ckShowImage.checked){
		f.showImage.value = "ON";			
	}else{
		f.showImage.value = "OFF";		
	}
	f.submit();
	return(true);
}

function changePage(v,form){
	var f = document.getElementById(form);
	f.pagActual.value = v;
	f.submit();
	return(true);
}
function changeOrder(field,mode,form){
	//<c:if test="${empty OperBean.flagCode && empty OperBean.flagExactReference}">
	var f = document.getElementById(form);
	f.orderBy.value = field;
	f.orderMode.value = mode;
	f.pagActual.value = "1";
	f.cmdAux.value = 'B';
	f.submit();
	return(true);
	//</c:if>
}

function restoResultados(form){	
	var f = document.getElementById(form);
	f.flagCode.value = '';
	f.flagExactReference.value = '';
	f.submit();
	return(true);	
}


function subResultados(form, codCategoria){
		var f = document.getElementById(form);	
		f.codCategory.value = codCategoria;
		f.submit();
		return(true);
}

//JS Taxonomia
var esSafari = navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1;

function versubtipo(codTipo, op) {
	
	if (op == 'mas') {		
		//$('#ul_'+codTipo+' li.classLimas').slideDown('slow');
		$('#div_subtipos_'+codTipo).slideDown('slow'
			, function() {
				if (esSafari) {
					$(this).css('width','143px !important');	
				} else {
					$(this).css('display','inline');				
				}
		}
		);
		$('#span_ver_mas'+codTipo).css('display','none');
		$('#span_ver_menos'+codTipo).css('display','block');					
	} 
	
	if (op == 'menos') {		
		//$('#ul_'+codTipo+' li.classLimas').slideUp('slow');
		if (esSafari) {
			$('#div_subtipos_'+codTipo).css('width','200px !important');
		}
		$('#div_subtipos_'+codTipo).css('display','block');
		$('#div_subtipos_'+codTipo).slideUp('slow');
		$('#span_ver_menos'+codTipo).css('display','none');
		$('#span_ver_mas'+codTipo).css('display','block');
	}
	
}

function versubcat(codCat, op) {
	
	if (op == 'mas') {		
		//$('#ul_'+codTipo+' li.classLimas').slideDown('slow');
		$('#div_subcats_'+codCat).slideDown('slow'
			, function() {
				if (esSafari) {
					$(this).css('width','143px !important');	
				} else {
					$(this).css('display','inline');				
				}
		}
		);
		$('#span_ver_mas_subcat'+codCat).css('display','none');
		$('#span_ver_menos_subcat'+codCat).css('display','block');					
	} 
	
	if (op == 'menos') {		
		//$('#ul_'+codTipo+' li.classLimas').slideUp('slow');
		if (esSafari) {
			$('#div_subcats_'+codCat).css('width','200px !important');
		}
		$('#div_subcats_'+codCat).css('display','block');
		$('#div_subcats_'+codCat).slideUp('slow');
		$('#span_ver_menos_subcat'+codCat).css('display','none');
		$('#span_ver_mas_subcat'+codCat).css('display','block');
	}
	
}

function vertipo(op) {
	
	if (op == 'mas') {		
		//$('#ul_'+codTipo+' li.classLimas').slideDown('slow');
		
		$('#div_tipos').slideDown('400'
				, function() {					
					if (esSafari) {
						$(this).css('width','150px !important');	
					} else {
						$(this).css('display','inline');				
					} 
		}
		);
		$('#span_ver_mas_tipo').css('display','none');
		$('#span_ver_menos_tipo').css('display','block');					
	} 
	
	if (op == 'menos') {		
		//$('#ul_'+codTipo+' li.classLimas').slideUp('slow');
		if (esSafari) {
			$('#div_tipos').css('width','200px !important');
		}
		$('#div_tipos').css('display','block');
		$('#div_tipos').slideUp('400');
		$('#span_ver_menos_tipo').css('display','none');
		$('#span_ver_mas_tipo').css('display','block');
				
	}
	
}

function vercat(op) {
	
	if (op == 'mas') {		
		//$('#ul_'+codTipo+' li.classLimas').slideDown('slow');
		
		$('#div_cats').slideDown('400', function() {			
			if (esSafari) {
				$(this).css('width','150px !important');	
			} else {
				$(this).css('display','inline');				
			}			
		});
		$('#span_ver_mas_cat').css('display','none');
		$('#span_ver_menos_cat').css('display','block');					
	} 
	
	if (op == 'menos') {		
		//$('#ul_'+codTipo+' li.classLimas').slideUp('slow');
		if (esSafari) {
			$('#div_cats').css('width','200px !important');
		}
		$('#div_cats').css('display','block');
		$('#div_cats').slideUp('400');
		$('#span_ver_menos_cat').css('display','none');
		$('#span_ver_mas_cat').css('display','block');
				
	}
	
}

function deshacerBusquedaCat(form,codCategory,codCatAux) {
	if (codCatAux.length > 0 && codCatAux != codCategory) {
		subResultados(form, codCatAux,codCategory);
	} else {		
		document.getElementById(form).cmdAux.value = 'B';
		document.getElementById(form).priceFilter.value = '';
		document.getElementById(form).fromPrice.value = '';
		document.getElementById(form).toPrice.value = '';
		document.getElementById(form).fromPriceInit.value = '';
		document.getElementById(form).toPriceInit.value = '';		
		subResultados(form, '');		
	}		
}

function cerrarFiltrosAplicados() {
	var display =$('#ulft').css('display');
	$('#ulft').slideToggle('slow');	
	if (display == 'none') {
		$('#divEspcioFinalFiltrosCerrados').css('display','none');
	} else {
		$('#divEspcioFinalFiltrosCerrados').css('display','block');
	}
}

function cerrarBuscarPor() {
	var display =$('#ulrt').css('display');
	$('#ulrt').slideToggle('slow');	
	if (display == 'none') {
		$('#divEspcioFinalBuscarPorCerrado').css('display','none');
	} else {
		$('#divEspcioFinalBuscarPorCerrado').css('display','block');
	}
}
function cerrarBuscarPorCat() {
	var display =$('#ulrc').css('display');
	$('#ulrc').slideToggle('slow');	
	if (display == 'none') {
		$('#divEspcioFinalBuscarPorCatCerrado').css('display','none');
	} else {
		$('#divEspcioFinalBuscarPorCatCerrado').css('display','block');
	}
}

function cerrarPriceSlider() {
	var display =$('#ulps').css('display');
	$('#ulps').slideToggle('slow');	
	if (display == 'none') {
		$('#divEspcioFinalPriceSliderCerrado').css('display','none');
	} else {
		$('#divEspcioFinalPriceSliderCerrado').css('display','block');
	}
}

function desplegarCat(codCat) {
	$('#ul_cat_'+codCat).slideDown('slow');
	$('#triang_abajo_cat'+codCat).attr('onclick','plegarCat('+codCat+')');
	$('#triang_abajo_cat'+codCat).attr('title','Plegar Categoría');
	$('#triang_abajo_cat'+codCat).attr('alt','Plegar Categoría');
	$('#triang_abajo_cat'+codCat).attr('src','images/b2b/triang_abajo.png');
	$('#triang_abajo_cat'+codCat).attr('id','triang_arriba_cat'+codCat);
}

function plegarCat(codCat) {
	$('#ul_cat_'+codCat).slideUp('slow');
	$('#triang_arriba_cat'+codCat).attr('onclick','desplegarCat('+codCat+')');
	$('#triang_arriba_cat'+codCat).attr('title','Desplegar Categoría');
	$('#triang_arriba_cat'+codCat).attr('alt','Desplegar Categoría');
	$('#triang_arriba_cat'+codCat).attr('src','images/b2b/triang_der.png');
	$('#triang_arriba_cat'+codCat).attr('id','triang_abajo_cat'+codCat);	
}

function desplegarTipo(codTipo) {
	$('#ul_tipo_'+codTipo).slideDown('slow');
	$('#triang_abajo_tipo'+codTipo).attr('onclick','plegarTipo('+codTipo+')');
	$('#triang_abajo_tipo'+codTipo).attr('title','Plegar Filtro');
	$('#triang_abajo_tipo'+codTipo).attr('alt','Plegar Filtro');
	$('#triang_abajo_tipo'+codTipo).attr('src','images/b2b/triang_abajo.png');
	$('#triang_abajo_tipo'+codTipo).attr('id','triang_arriba_tipo'+codTipo);
}

function plegarTipo(codTipo) {
	$('#ul_tipo_'+codTipo).slideUp('slow');
	$('#triang_arriba_tipo'+codTipo).attr('onclick','desplegarTipo('+codTipo+')');
	$('#triang_arriba_tipo'+codTipo).attr('title','Desplegar Filtro');
	$('#triang_arriba_tipo'+codTipo).attr('alt','Desplegar Filtro');
	$('#triang_arriba_tipo'+codTipo).attr('src','images/b2b/triang_der.png');
	$('#triang_arriba_tipo'+codTipo).attr('id','triang_abajo_tipo'+codTipo);	
}

//cod:${vo.codigo}, valo:${vo.valoracion}, path:<%=CS%>
function favo(cod,valo,path,thiso) {
	if (valo > 0) {
		$(thiso).toggleClass("favo-select favo-no-select");		
	}	
	$(thiso).click(function() {
		if ( $(this).hasClass("favo-no-select") ) {
			$(thiso).removeClass("favo-no-select").addClass("favo-select");
			$('#favo'+cod).removeClass("favo-no-select").addClass("favo-select");
			$.get(path, {o: 'favorites', p: '1', producto: cod, t:'a', valoracion: 1});
		} else if ($(this).hasClass("favo-select") && !$(this).hasClass("lsts")) {
			$(thiso).removeClass("favo-select").addClass("favo-no-select");
			$('#favo'+cod).removeClass("favo-select").addClass("favo-no-select");
			$.get(path, {o: 'favorites', p: '1', producto: cod, t:'a', valoracion: 0});
		}
		$('#favo'+cod).siblings("div").fadeOut(300);
		$('.f-panel-quick.hover').removeClass('hover');
	});	
}
//cod:${vo.codigo}, path:<%=CS%>
function suscr(cod,suscr,path,thiso) {
	if (suscr == true) {
		$(thiso).toggleClass("suscr-select suscr-no-select");		
	}	
	$(thiso).hover(
		function(e)
		{	
			if ( $(this).hasClass("suscr-no-select") ) {
				$(thiso).addClass("hover");		
				$(thiso).find("div.altSuscripcion").fadeIn(200);
			} else if ( $(this).hasClass("suscr-select") ) {
				$(thiso).addClass("hover");		
				$(thiso).find("div.altSuscripcionRealizada").fadeIn(200);
			}
		},
		function(e)
		{
			if ( $(this).hasClass("suscr-no-select") ) {
				$(thiso).removeClass("hover");		
				$(thiso).find("div.altSuscripcion").fadeOut(200);
			} else if ( $(this).hasClass("suscr-select") ) {	
				$(thiso).removeClass("hover");		
				$(thiso).find("div.altSuscripcionRealizada").fadeOut(200);
			}
		}
	);
	$(thiso).click(function() {
		if ( $(this).hasClass("suscr-no-select") ) {
			$(thiso).removeClass("suscr-no-select").addClass("suscr-select");
			$(thiso).find("div.altSuscripcion").hide();
			$(thiso).removeClass("hover");	
			$(thiso).addClass("click");		
			$(thiso).find("div.altSuscripcionOk").fadeIn(200);							
			$(thiso).mouseleave(function() {
		        if ($(thiso).hasClass("click")) {
		        	$(thiso).removeClass("click");
		            $(thiso).find("div.altSuscripcionOk").fadeOut(200);
		        }
		    });
			$.get(path, {o: 'subscriptions', p: '1', producto: cod, t:'a', suscripcion: 1});
		} else if ($(this).hasClass("suscr-select")) {
			$(thiso).removeClass("suscr-select").addClass("suscr-no-select");
			$(thiso).find("div.altSuscripcionRealizada").hide();
			$(thiso).removeClass("hover");	
			$(thiso).removeClass("click");		
			$(thiso).find("div.altSuscripcionOk").fadeOut(200);	
			$.get(path, {o: 'subscriptions', p: '1', producto: cod, t:'a', suscripcion: 0});
		}			
	});	
}

//cod:${vo.codigo}, num:num.${vo.codigo}, path:<%=CS%>
function cart(cod,num,cart,path,thiso) {
	if (cart == true) {
		$(thiso).toggleClass("cart-select cart-no-select");		
	}
	
	$(thiso).hover(
		function(e)
		{	
			if ( $(this).hasClass("cart-select") ) {
				$(thiso).addClass("hover");	
				hover_intent = setTimeout( 
					function(){ $(thiso).find("div.altNumProducts").fadeIn(200); } 
					, 700 
				);
			}
		},
		function(e)
		{
			if ( $(this).hasClass("cart-select") ) {	
				$(thiso).removeClass("hover");
				try{clearTimeout(hover_intent);}catch(e){}; 
				$(thiso).find("div.altNumProducts").fadeOut(200);
			}
		}
	);
	
	$(thiso).click(function() {
		if ( $(this).hasClass("cart-no-select") && num.value > 0) {
			if ( !$(this).hasClass("noconfirm") ) {
				$(thiso).fadeOut(300, function() {
					$(thiso).toggleClass("cart-no-select cart-select").fadeIn(300);
				});
				
			}
			
		} else if ($(this).hasClass("cart-select") && num.value > 0) {
			if ( !$(this).hasClass("noconfirm")) {
				$(thiso).fadeOut(300).fadeIn(300);
			}	
		}
		$(thiso).removeClass("siconfirm");
		$(thiso).removeClass("noconfirm");
		$(thiso).removeClass("hover");	
			
	});
}

function cartb2c(cod,num,cart,path,thiso) {
	if (cart == true) {
		$(thiso).addClass("cart-select");
		if (__plantillaDistri == 1)
			$(thiso).find(".imagen-carro").attr("src","store/styles/"+__plantillaColor+"/image/ico_carro.png");
	}
	
	$(thiso).hover(
			function(e) {
				if ( $(this).hasClass("cart-select") ) {
					var tooltip = $(thiso).find(".cart-tooltip-panel-inner").html();
						
					// Mostrar el mensaje al usaurio
					var snackbar = $("#snackbar");					
					if(snackbar.length > 0) {
						  var text = tooltip;
						  showSnackbar(text);
					}
				}
			},
			function(e) {}
	);
	
	$(thiso).click(function() {
		if ( $(this).hasClass("cart-no-select") && num.value > 0) {
			if ( !$(this).hasClass("noconfirm") ) {
				$(thiso).fadeOut(300, function() {
					$(thiso).toggleClass("cart-no-select cart-select").fadeIn(300);
				});
				
			}
			
		} else if ($(this).hasClass("cart-select") && num.value > 0) {
			if ( !$(this).hasClass("noconfirm")) {
				$(thiso).fadeOut(300).fadeIn(300);
			}	
		}
		$(thiso).removeClass("siconfirm");
		$(thiso).removeClass("noconfirm");
		$(thiso).removeClass("hover");	
			
	});
}


function cartCheck(num,thiso) {
	if ( $(thiso).hasClass("cart-no-select") && num.value > 0) {
		if ( !$(thiso).hasClass("noconfirm") ) {
			$(thiso).fadeOut(300, function() {
				$(thiso).toggleClass("cart-no-select cart-select").fadeIn(300);
			});
			
		}
		
	} else if ($(thiso).hasClass("cart-select") && num.value > 0) {
		if ( !$(thiso).hasClass("noconfirm")) {
			$(thiso).fadeOut(300).fadeIn(300);
		}	
	}
	$(thiso).removeClass("siconfirm");
	$(thiso).removeClass("noconfirm");
	$(thiso).removeClass("hover");
}

function ahorro(prod,canal,csp,gc,umvcsp) {
	var can = 1;
	var inputcan = document.getElementById('num.'+prod+'_'+canal);
	if (inputcan != null) {
		can = inputcan.value;
		if (isNaN(can)) {
			can = 1;
		}
	}
	var sal = '';
	if (!isNaN(csp) && !isNaN(gc) && !isNaN(can) && !isNaN(umvcsp)) {
		sal =Math.round((csp-gc)*umvcsp*can*100)/100;
		var strsal = new String(sal);
		if (strsal.indexOf('.',0) > -1 && strsal.split(".")[1].length == 1) {
			strsal = strsal + '0';
		}	
		strsal=strsal.replace('.',',');
	} 
	if (!isNaN(sal) && sal > 0) {
		$('#ahorro'+prod).replaceWith('<span id="ahorro'+prod+'">'+strsal+'<span style="font-size: 10px;">&euro;</span></span>');
	}
}
function sendtoogleGCOnlySession(CS, url) {
	window.location.href = CS + '?o=clientPrefb2b&p=3&onlySession=S&url=' + encodeURIComponent(url);
}
function sendtoogleGC(CS) {
	window.location.href = CS + '?o=clientPrefb2b&p=3&url=' + encodeURIComponent(window.location.pathname + window.location.search);
}
function sendtoogleLlegadaGC(CS) {
	window.location.href = CS +'?o=clientPrefb2b&p=4&url=' + encodeURIComponent(window.location.pathname + window.location.search);
}

function sendTogglePcS(CS) {
	window.location.href = CS + '?o=clientPrefb2b&p=3b&url=' + encodeURIComponent(window.location.pathname + window.location.search);
}

function sendToggleEmail(CS) {
	window.location.href = CS + '?o=clientPrefb2b&p=3e&url=' + encodeURIComponent(window.location.pathname + window.location.search);
}

function sendToggleVerPVO(CS) {
	window.location.href = CS + '?o=clientPrefb2b&p=3p&url=' + encodeURIComponent(window.location.pathname + window.location.search);
}

function sndchngxct(CS,chk) {
	if (chk != null ) {
		var strchk = chk.checked ? 'ON':''					
		  $.ajax({
		         url: CS,
		         data: {o: 'clientPrefb2b', p: '5', busqexact: strchk},		         
		         async:   false
		    });
	}
}
function fileTokenDownload(token) {
	var res = false;
	
	$.ajaxSetup({
		async: false
	});
	
	$.ajax({
		type : "GET",
		url : "jsp/util/ajxFileTokenDownload.jsp",
		success : function(data) {
			if (data != null && data.length > 0){
				//	parseamos array
				var dataToken = $.parseJSON(data);
				if (dataToken.token != null && dataToken.token == token) {
					res = true;
				}
			}	
		}
	});
	
	$.ajaxSetup({
		async: true
	});
	return res;
	
}


	
//END JS Taxonomia
function realz(o,search) {
	if (search.length> 0) {
		var index;
		var a_search = search.split(' ');
		var off = 0;			
		$('.realz-off').each(function () {		
			for (index = 0; index < a_search.length; index++) {
				if (a_search[index].length>0){
					off = 1;
					var txt = $(this).html();					
					$(this).removeClass('realz-off').addClass('realz-on').html(txt.replace(a_search[index].toUpperCase(),'<span style="background:yellow">'+a_search[index].toUpperCase()+'</span>'));
				}
			}
		});
		if (off == 0) {
				$('.realz-on').each(function () {
					for (index = 0; index < a_search.length; index++) {
						if (a_search[index].length>0){
							var txt = $(this).html();
							$(this).removeClass('realz-on').addClass('realz-off').html(txt.replace('<span style="background:yellow">'+a_search[index].toUpperCase()+'</span>',a_search[index].toUpperCase()));
						}
					}
				});		
		}
		if (off == 1) {
			$(o).css('background','yellow');
			$.cookie("realz", 1, { expires : 10 });
		} else {
			$(o).css('background','');
			$.cookie("realz", 0, { expires : 10 });
		}
	}
}

function realzcookie(search) {
	var realzck = $.cookie("realz");
	if (realzck != null && realzck == 1) {
		realz(document.getElementById('realzid'),search);
	}
}

//Cookies B2B
function isAcceptCookies() {
	var acceptck = $.cookie("acceptck");
	if (acceptck != null) {
		return acceptck;
	}
	return -1;
}

function showAcceptCookies() {
	var acceptck = $.cookie("acceptck");
	if (isAcceptCookies() < 0) {
		$("#divcookie").removeClass("hide");
	}
}

function acceptAllCookies() {
	$("#divcookie").fadeOut();
	$.cookie("acceptck", 1, { expires : 90 });
}

function toggleSelectedCookies() {
	$("#spanCookiesEstadisticas").click(function() {
		if ($("#cookiesEstadisticas").is(":checked")) {
			$("#cookiesEstadisticas").prop('checked', false);
		} else if ($("#cookiesEstadisticas").not(":checked")){
			$("#cookiesEstadisticas").prop('checked', true);
		};
	});
    
    $("#spanCookiesMarketing").click(function() {
		if ($("#cookiesMarketing").is(":checked")) {
			$("#cookiesMarketing").prop('checked', false);
		} else if ($("cookiesMarketing").not(":checked")){
			$("#cookiesMarketing").prop('checked', true);
		};
	});
} 

function acceptSelectedCookies() {
	//Tipos de cookies
	//0: Sólo acepta las necesarias (siempre deben estar) y rechaza estadística y marketing
	//1: Acepta todas (necesarias, estadística y marketing)
	//2: Acepta las necesarias y las de estadística
	//3: Acepta las necesarias y las de marketing
	
	if ($("#cookiesEstadisticas").is(":checked") && $("#cookiesMarketing").is(":checked")) {
		tipo = 1;
	} else if ($("#cookiesEstadisticas").is(":checked")) {
		tipo = 2;
	} else if ($("#cookiesMarketing").is(":checked")) {
		tipo = 3;
	} else {
		tipo = 0;
	}
        
	$("#divcookie").fadeOut();
	$.cookie("acceptck", tipo, { expires : 30 });
	
	//Carga valores gtag
	loadB2BGtag(tipo);
	
	//Acepta cookies YouTube
	loadB2BYouTube(tipo);
	
}

//Cookies B2C
function isAcceptCookiesB2C(tienda) {
	var acceptck = $.cookie("acceptck."+tienda);
	if (acceptck != null) {
		return acceptck;
	}
	return -1;
}

function showCookiesB2C(){
	$('#seleccionCookies').hide();
	$('#btnConfiguracion').show();
	$('#btnRechazar').show();
	$("#divcookie").fadeIn();
	$("#divcookie").removeClass("hide");
}

function showAcceptCookiesB2C(tienda) {
	var acceptck = $.cookie("acceptck."+tienda);
	if (isAcceptCookiesB2C(tienda) < 0) {
		$("#divcookie").removeClass("hide");
	}
}

function acceptAllCookiesB2C(tienda) {
	$("#divcookie").fadeOut();
	//$.cookie("acceptck."+tienda, 1, { expires : 30 });
	document.cookie = 'acceptck.'+tienda+'=1; max-age=2592000; SameSite=None; Secure';
}

function toggleSelectedCookiesB2C() {
	$("#spanCookiesEstadisticas").click(function() {
		if ($("#cookiesEstadisticas").is(":checked")) {
			$("#cookiesEstadisticas").prop('checked', false);
		} else if ($("#cookiesEstadisticas").not(":checked")){
			$("#cookiesEstadisticas").prop('checked', true);
		};
	});
    
    $("#spanCookiesMarketing").click(function() {
		if ($("#cookiesMarketing").is(":checked")) {
			$("#cookiesMarketing").prop('checked', false);
		} else if ($("cookiesMarketing").not(":checked")){
			$("#cookiesMarketing").prop('checked', true);
		};
	});
} 

function acceptSelectedCookiesB2C(tienda) {
	//Tipos de cookies
	//0: Sólo acepta las necesarias (siempre deben estar) y rechaza estadística y marketing
	//1: Acepta todas (necesarias, estadística y marketing)
	//2: Acepta las necesarias y las de estadística
	//3: Acepta las necesarias y las de marketing
	
	if ($("#cookiesEstadisticas").is(":checked") && $("#cookiesMarketing").is(":checked")) {
		tipo = 1;
	} else if ($("#cookiesEstadisticas").is(":checked")) {
		tipo = 2;
	} else if ($("#cookiesMarketing").is(":checked")) {
		tipo = 3;
	} else {
		tipo = 0;
	}
        
	$("#divcookie").fadeOut();
	//$.cookie("acceptck."+tienda, tipo, { expires : 30 });
	document.cookie = 'acceptck.'+tienda+'='+tipo+'; max-age=2592000; SameSite=None; Secure';
	
	$(document).ready(function(){
	
	//Carga valores gtag
	loadB2CGtag(tipo);
	  
	//Carga valores Google Tag Manager
	loadB2CGoogleTagManager(tipo);
	  
	//Carga valores Pixel Facebook
	loadB2CPixelFacebook(tipo);
	
	//Acepta cookies YouTube
	loadB2CYouTube(tipo);
	
	});
}

//Captura de la pulsación de la tecla enter y envio.
//Uso: <input type="text" name="clave" onkeypress="submitEnter(event,document.idForm)"> 
function submitEnter(evento,idFormulario){
   var key;

   if (evento.keyCode){
       key = evento.keyCode;
   }else if (evento.which){
       key = evento.which;
   }else {
       return false;
	 }
   if (key == 13) {idFormulario.submit();}
   return true;
}

//Comprovación de la tecla pulsada.
function isEnter(evento){
   var key;

   if (evento.keyCode){
       key = evento.keyCode;
   }else if (evento.which){
       key = evento.which;
   }else{
       return false;
	 }
	 	 
   if (key == 13) {
   	return true;
   }else {
  	return false;
   }
}

//Funcion que actualiza el contenido de la lista de productos favoritos.
//Se podria mover util.js
function updateFavoriteProductsContent(){	
	$.get("jsp/b2b/ajxFavoritesDataContent.jsp")
		.success(function (data){			
			$('#misProductosFavoritosFlotanteContenido').html(data);
		});
}

//Se podria mover util.js, si se reemplaza el CS por ControlServlet
function eliminarDelCarro(cod) {
	  $('#carroFlotante').html('<div style="text-align: center; padding:15px;"><img src="images/procesing.gif"/></div>');
	  $.get("ControlServlet?o=updtcart&p=1&t=a&cod."+cod+"=U&num."+cod+"=0")
		  .success(function() { 
			  updateCartContent();
			  // Consultamos los datos actualizados del carro
			  //$.get("ControlServlet?o=viewcartJSON&p=1&t=a","json")
			  $.getJSON("jsp/b2b/cartDataJSON.jsp", function(data) { 
					// Actualizamos también el importe del carro flotante y el número de productos que contiene ahora
					var pc = document.getElementById("numProductosCarro");
					pc.innerHTML = data.numTotalProductsCart;
					// Si estamos en la página del carro advertimos que los datos mostrados no están actualizados
					// TODO
					
					if (window.location.href.indexOf("viewcart") != -1 ||  null != document.getElementById("viewcart_exists")){
						  //Si se esta en viewcart se fuerza recarga del Carro, en ultimo termino se basa en la comprobacion del id
						  //viewcart_exists en viewcart.jsp
						  window.location.reload(true);
					  }
			  });
		  });	  
	  
}		

/*Incorpora las posibles lineas UVE para eliminar
si estas lineas UVE no existen, no afecta ya que
en la eliminacion desde carro flotante se actua
sobre las dos líneas*/
//Se podria mover util.js, si se reemplaza el CS por ControlServlet
function eliminarDelCarroCSP(cod) {
	  $('#carroFlotante').html('<div style="text-align: center; padding:15px;"><img src="images/procesing.gif"/></div>');
	  $.get("ControlServlet?o=updtcart&p=1&t=a&cod."+cod+"=U&num."+cod+"=0&cod."+cod+"UVE=U&num."+cod+"UVE=0")
		  .success(function() { 
			  updateCartContent();
			  // Consultamos los datos actualizados del carro
			  //$.get("ControlServlet?o=viewcartJSON&p=1&t=a","json")
			  $.getJSON("jsp/b2b/cartDataJSON.jsp", function(data) { 
					// Actualizamos también el importe del carro flotante y el número de productos que contiene ahora
					var pc = document.getElementById("numProductosCarro");
					pc.innerHTML = data.numTotalProductsCart;
					// Si estamos en la página del carro advertimos que los datos mostrados no están actualizados
					// TODO
					
					if (window.location.href.indexOf("viewcart") != -1 ||  null != document.getElementById("viewcart_exists")){
						  //Si se esta en viewcart se fuerza recarga del Carro, en ultimo termino se basa en la comprobacion del id
						  //viewcart_exists en viewcart.jsp
						  window.location.reload(true);
					}
			  });
		  });	  
	  
}

//Se podria mover util.js, si se reemplaza el CS por ControlServlet
function eliminarDelCarroDePendientes(ped,lin) {
	  $('#carroFlotante').html('<div style="text-align: center; padding:15px;"><img src="images/procesing.gif"/></div>');	  	  
	  $.ajax({
	         url: 'ControlServlet',
	         data: {o: 'mngDespatch', p: '6s', pedido: ped, linea: lin, oper: 'rmv'},
	         success: function(data) {	        	
			        	 $.getJSON("jsp/b2b/cartDataJSON.jsp", function(data) { 
								// Actualizamos también el importe del carro flotante y el número de productos que contiene ahora
								var pc = document.getElementById("numProductosCarro");
								pc.innerHTML = data.numTotalProductsCart;
								// Si estamos en la página del carro advertimos que los datos mostrados no están actualizados
								// TODO
								
								if (window.location.href.indexOf("viewcart") != -1 ||  null != document.getElementById("viewcart_exists")){
									  //Si se esta en viewcart se fuerza recarga del Carro, en ultimo termino se basa en la comprobacion del id
									  //viewcart_exists en viewcart.jsp
									  window.location.reload(true);
								  }
						  });	        	 
	         	},
	         async:   false
	    });
}

//Funcion que actualiza el contenido del carro.
//Se podria mover util.js, si se reemplaza el CS por ControlServlet
function updateCartContent(){	
	$.get("jsp/b2b/ajxCartDataContent.jsp")
		.success(function (data){			
			$('#carroFlotante').html(data);
			$(".nano3").nanoScroller();
			$("body").addClass("modal-open");
			$('#carroFlotante .f-panel-quick:has(div)').hover(
					function(e)
					{			
						$(this).addClass('hover');
						
						hover_intent = setTimeout( 
							function(){ $('.f-panel-quick.hover').find('div').first().show(10);} 
							, 150 
						);
					},
					function(e)
					{
						try{clearTimeout(hover_intent);}catch(e){}; 
						$('.f-panel-quick.hover').find('div').first().hide(10);							
						$(this).removeClass('hover');
					}
				);
		});
}

function collapseTiposB2B() {
	$("#ulrt li.cab-open").click(function(){
		$(this).next().children('ul').slideToggle();
		$(this).toggleClass('collapse');
		$(this).toggleClass('cab-open cab-close');
	});
}

function verMasSubTipoB2B(etMas, etMenos) {
    $('#ulrt>li>ul').each(function(){
        var numHijos = $(this).find('span.checkbox-taxo-container').length;
        var numHijosMarcados = $(this).find('span.checkbox-taxo-container').find('input:checked').length;
        
        if(numHijos > 10 && numHijosMarcados == 0){
            $(this).find('span.checkbox-taxo-container:gt(9)').wrapAll('<div class="ver-mas-subtipo-wrap" style="display:none"></div>');
            $(this).append('<br><span class="ver-mas-subtipo-trigger">' + etMas + '</span>');
        }
    });

    $(document).on('click', '.ver-mas-subtipo-trigger', function(){
        var $wrap = $(this).siblings('.ver-mas-subtipo-wrap');
        if ($wrap.is(':visible')) {
            $wrap.slideUp();
            $(this).text(etMas);
        } else {
            $wrap.slideDown();
            $(this).text(etMenos);
        }
    });
}

function verMasTipoB2B(etMas, etMenos) {
	$('#ulrt').parent().each(function(){
		var numHijos = $(this).find('#ulrt>li').length;
		if(numHijos > 20){
			$(this).find('#ulrt>li').slice(20,numHijos).wrapAll('<div class="ver-mas-tipo-wrap" style="display:none"></div>');
			$(this).find('.ver-mas-tipo-trigger').text(etMas);
			$(this).find('#ulrt').append('<li class="ver-mas-tipo-trigger">'+etMas+'</li>');
		}
	});
	
	$('.ver-mas-tipo-trigger').each(function(){
		$(this).toggle(function(){
			$(this).parent().find('.ver-mas-tipo-wrap').slideDown();
			$(this).text(etMenos);
		},function(){
			$(this).parent().find('.ver-mas-tipo-wrap').slideUp();
			$(this).text(etMas);
		});
	});
}

function collapseCatsB2B() {
	$("#ulrc li.cab-open").click(function(){
		$(this).next().children('ul').slideToggle();
		$(this).toggleClass('collapse');
		$(this).toggleClass('cab-open cab-close');
	});
}

function verMasSubCatB2B(etMas, etMenos) {
	$('#ulrc>li>ul').each(function(){
		var numHijos = $(this).find('li').length;
		if(numHijos > 10){
			$(this).find('li:gt(9)').wrapAll('<div class="ver-mas-subcat-wrap" style="display:none"></div>');
			$(this).append('<li class="ver-mas-subcat-trigger">'+etMas+'</li>');
		}
	});
	
	$('.ver-mas-subcat-trigger').each(function(){
		$(this).toggle(function(){
			$(this).parent().find('.ver-mas-subcat-wrap').slideDown();
			$(this).text(etMenos);
		},function(){
			$(this).parent().find('.ver-mas-subcat-wrap').slideUp();
			$(this).text(etMas);
		});
	});	
}

function retardoColapsarCatsVerMasCatB2B(etMas, etMenos) {		
	$('#ulrc').each(function(){
		var numHijos = $(this).parent().find('#ulrc>li').length;
		if(numHijos > 20){			
			$(this).append('<li class="ver-mas-cat-trigger">'+etMenos+'</li>');
		}
	});	
	setTimeout(function() {		
			$('#ulrc li.cab-open').each(function() {
				$(this).next().children('ul').slideToggle();
				$(this).toggleClass('collapse');
				$(this).toggleClass('cab-open cab-close');
			});		
		}, 2000);
	setTimeout(function() {
			verMasCatB2B(etMas, etMenos);
		}, 4000);				
}

function sinRetardoColapsarCatsVerMasCatB2B(etMas, etMenos) {
	$('#ulrc').each(function(){
		var numHijos = $(this).parent().find('#ulrc>li').length;
		if(numHijos > 20){			
			$(this).append('<li class="ver-mas-cat-trigger">'+etMenos+'</li>');
		}
	});
	$('#ulrc li.cab-open').each(function() {
		$(this).next().children('ul').slideToggle();
		$(this).toggleClass('collapse');
		$(this).toggleClass('cab-open cab-close');
	});
	verMasCatB2B(etMas, etMenos);
}

function verMasCatB2B(etMas, etMenos) {
	$('#ulrc').parent().each(function(){
		var numHijos = $(this).find('#ulrc>li').length;
		if(numHijos > 20){
			$(this).find('#ulrc>li').slice(20,numHijos-1).wrapAll('<div class="ver-mas-cat-wrap"></div>');
			$(this).find('#ulrc .ver-mas-cat-wrap').toggle(700);
			$(this).find('.ver-mas-cat-trigger').text(etMas);
		}
	});
	
	$('.ver-mas-cat-trigger').each(function(){
		$(this).toggle(function(){
			$(this).parent().find('.ver-mas-cat-wrap').slideDown();
			$(this).text(etMenos);
		},function(){
			$(this).parent().find('.ver-mas-cat-wrap').slideUp();
			$(this).text(etMas);
		});
	});
}

function getFiltrosPVPB2B(url) {
	var fromPrice=$("#slider").slider("values",0);
	var toPrice=$("#slider").slider("values",1);
	document.location.href= url + "&fromPrice=" + fromPrice + "&toPrice=" + toPrice;
}

function getFiltrosPVPB2BFloat(searchInput, fromPriceFloat, toPriceFloat, fromPriceInitFloat, toPriceInitFloat) {
	document.location.href= "ControlServlet?o=searchprdb2b&p=4&&searchString=" + searchInput + "&fromPrice=" + fromPriceFloat + "&toPrice=" + toPriceFloat + "&fromPriceInit=" + fromPriceInitFloat + "&toPriceInit=" + toPriceInitFloat + "&priceFilter=S";
}

function updtQtyLstFavs(lst) {	
	
	var f = document.getElementById('fListProd');	
	var oPrevious = f.o.value;
	var pPrevious = f.p.value;
	f.t.disabled=true;
	
	f.o.value ='lstfavsb';
	f.p.value ='10';
	f.t.value = '';
	f.lstfav.value= lst;
	
	f.submit();
	
	f.o.value =oPrevious;
	f.p.value =pPrevious;
	f.t.disabled=false;
	
}

function altermainfocus(sel) {
	$.cookie("altermainfocus",sel, {expires : 1});
}

function mainfocus() {
	var sele = $.cookie("altermainfocus");
	if (sele != null && sele.length > 0) {
		if ($(sele).length > 0) {
			$(sele).focus();
		} else {
		    if(document.getElementById('cod')) {
			document.getElementById('cod').focus();
		    }
		}
	} else {
	    if(document.getElementById('cod')) {
		document.getElementById('cod').focus();
	    }
	}
}

/**
 * Convierte los codigos de productos en las JSP concatenados
 * con el codigo del proveedor (ej. "12345_9876") en unicamente
 * el codigo del producto para su tratado a nivel js como en el 
 * server. Si no recibe la concatenacion, devuelve el codigo que
 * recibe.
 * 
 * @param code		codigo en la jsp
 * @returns			codigo producto
 */
function formatCodeForUpdate(code){
	if(code.indexOf("_") > 0)
		code = code.substring(0,code.indexOf("_"));
	return code;
}

/**
 * Detecta google chrome
 * @returns	true or false if chrome
 */
function isChromeBrowser() {
	var isChromium = window.chrome, winNav = window.navigator, vendorName = winNav.vendor, isOpera = winNav.userAgent
			.indexOf("OPR") > -1, isIEedge = winNav.userAgent.indexOf("Edge") > -1, isIOSChrome = winNav.userAgent
			.match("CriOS");

	if (isIOSChrome)
		return true;// is Google Chrome on IOS
	else if (isChromium !== null && isChromium !== undefined
			&& vendorName === "Google Inc." && isOpera == false
			&& isIEedge == false)
		return true;// is Google Chrome
	else
		return false;// not Google Chrome
}

/**
 * Pasa toda la cadena a minúsculas y luego a mayúsculas el primer carácter de cada palabra.
 * 
 * @param str		cadena a capitalizar
 * @returns			cadena capitalizada
 */
function capitalizeStr(str) {
	return str.toLowerCase().split(' ')
	    .map(function(word) {
	    	if (word[0] !== null && typeof word[0] != 'undefined')
	    		return word[0].toUpperCase() + word.substr(1);
	    	else
	    		return word.substr(1);
	    })
	    .join(' ');
}

/**
 *  Limpiar cadenas con origen en AS400 de ANTARA.
 */
function cleanCadena(dirtyStr){

	// Quitar las comillas dobles, y los signos de interrogación
	var cleanStr = dirtyStr.replace(/"/g, '').replace(/\?/g, '');

	// Corrección separador en ciertos casos .replaceAll('CL\\\. ', 'C/ ')
	cleanStr = cleanStr.replace(/C.\//gi, 'C/').replace(/C \//gi, 'C/').replace(/C\//gi, 'C/ ').replace(/CL. /gi, 'C/ ');

	// Quitar los espacios adicionales
	cleanStr = cleanStr.replace(/\s\s+/g, ' ');

	// Sustituir separadores inusuales
	cleanStr = cleanStr.replace(/\s*,/g, ',').replace(/,\s*/g, ', ').trim();

	// Capitalize
	return capitalizeStr(cleanStr);
}

// Elimina caracteres innecesarios en los campos de comentarios
function clearComment(maliceStr){
	return maliceStr.replace(/[^a-zÀ-ÿñ0-9' \/+&*@ºª% \.,;:_!¡¿?#()-]/gim, " ").replace(/\s\s+/g, " ");
}
// Elimina caracteres innecesarios en los campos de direcciones o similar
function clearAddress(maliceStr){
	return maliceStr.replace(/[^a-zÀ-ÿñ0-9' \/&*ºª \.,;:()-]/gim, " ").replace(/\s\s+/g, " ");
}
// Elimina caracteres innecesarios en los campos de nombres
function clearName(maliceStr){
	return maliceStr.replace(/[^a-zÀ-ÿñ0-9'. &ºª ,()-]/gi, " ").replace(/\s\s+/g, " ");
}
// Elimina caracteres innecesarios en los campos de email
function clearEmail(maliceStr) {
    return maliceStr.replace(/[^a-zÀ-ÿñ0-9'. &ºª ,()-@]/gi, " ").replace(/\s\s+/g, " ");
}
// Elimina caracteres innecesarios en los campos numéricos
function clearNumber(maliceStr){
	return maliceStr.replace(/[^0-9 \.,-]/g, "").replace(/\s\s+/g, "");
}

// Propaga el pre-postal por país, para que otras funciones comprueben que lo introducido en el código postal corresponde con la provincia
function comprobarPrepostal(provincia, pais) {

	var prepostal='0';

	$.ajax ({
        url: 'jsp/b2c/ajxPrePostal.jsp',
        data: {provincia: provincia, pais: pais},
        success: function(data) {
        	if(data != null && data.length > 0) {
        		var dataProv = $.parseJSON(data);
				if (dataProv.prepostal != 0) {
					prepostal = dataProv.prepostal;
				}
        	}
	   	},
		async: false
	});

	return prepostal;
}

// Cambiar el color de los elementos pasados
function change2Color(elementos, color) {
    for(var i=0, len=elementos.length; i<len; i++) {
    	elementos[i].style.color = color;
    }
}

// Transforma los SVG insertados como imagen a SVG inline.
function transformarSvg(selector) {
    $(selector + ' img[src$=".svg"].trsvg').each(function() {
        var $img = jQuery(this);
        var imgURL = $img.attr('src');
        var attributes = $img.prop("attributes");

        $.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');

            // Remove any invalid XML tags
            $svg = $svg.removeAttr('xmlns:a');

            // Loop through IMG attributes and apply on SVG
            $.each(attributes, function() {
                $svg.attr(this.name, this.value);
            });

            $svg.css('visibility', 'visible');
            
            // Replace IMG with SVG
            $img.replaceWith($svg);
        }, 'xml');
    });
}

//Busca la equivalencia de un código en la tabla INTXML_REFERENCIAS para un determinado cliente
function buscarCodigoEquivalente(codCliente, codProduct) {
	var finished, dataReplaced, codEquivalente;
		
	$.ajaxSetup({async: false});
	finished = $.get("jsp/b2c/publi/ajxProductRef.jsp?codProduct=" + codProduct, function(data){
		dataReplaced = $.parseJSON(data);
		if (dataReplaced.codProductoCSP > 0) {
			codEquivalente = dataReplaced.codProductoCSP;
		} else {
			codEquivalente = codProduct;
		}	
	});
	$.ajaxSetup({async: true});		
	return codEquivalente;
		
}

//Busca la equivalencia de un código en la tabla INTXML_REFERENCIAS para un determinado cliente
function buscarCodigoEquivalenteB2B(codCliente, codProduct) {
	var finished, dataReplaced, codEquivalente;
		
	$.ajaxSetup({async: false});
	finished = $.get("jsp/b2b/ajxProductRef.jsp?codProduct=" + codProduct + "&codCliente=" + codCliente, function(data){
		dataReplaced = $.parseJSON(data);
		if (dataReplaced.codProductoCSP > 0) {
			codEquivalente = dataReplaced.codProductoCSP;
		} else {
			codEquivalente = codProduct;
		}	
	});
	$.ajaxSetup({async: true});		
	return codEquivalente;
		
}

function buscarListaCodigosEquivalentes(codCliente, lstCodigos) {	
	var equivalentes = "";	

	if (lstCodigos.length > 0) {
		$.ajaxSetup({async: false});
	    $.ajax({
	      url: "jsp/b2b/ajxLstProductRef.jsp",
	      method: "post",
	      data: JSON.stringify(lstCodigos),
		  datatype:"json",
	      success: function(result,status,xhr) {
	          var obj = JSON.parse(result);
	          var array = [];
	          for (var i = 0; i< obj.length; i++) {
	        	  var codigo = obj[i];
        		  array.push(codigo);
	          }
	          equivalentes = array.join(", ");    
	      },
	      error: function(xhr,status,error) {
	          console.log(error);
	      }    	
	    });
		$.ajaxSetup({async: true});		
	}
	
	return equivalentes;
}

function getImgSrcFromContentCss(id){
	var imagen = document.getElementById(id);
 
    // Obtener propiedades de estilo de la imagen
    var estiloImagen = window.getComputedStyle(imagen);
 
    // Acceder a propiedades específicas
    var imageUrl = estiloImagen.getPropertyValue('content');
 
	var urlSinParentesis = imageUrl.replace(/url\(["']?([^"']*)["']?\)/, '$1');
	 
	var urlParts = urlSinParentesis.split('/');
	 
	// Tomar el último elemento del array (que debería ser el nombre del archivo)
	var nombreArchivo = urlParts[urlParts.length - 1];
	
	return nombreArchivo;
}

//Desplegar textos de ayuda trastienda
function toggleText(element) {
    element.classList.toggle('expanded');
}

/* Función que muestra la ventana de información de agencias de transporte.
El parámetro css define si se invoca con url B2B o B2C */
function infoAgencias(cs) {
	
	___cs = cs === undefined ? __cs : cs;
	
	var win = new PopupWindow();
	var w = 960;
	var h = 640;
	// Set the size of the popup window (only applies to WINDOW popups)
	win.setSize(w,h);
	win.setWindowProperties('toolbar=no,location=no,status=no,menubar=no,scrollbars=yes');
	// Set the URL of the window, rather than populating its contents manually
	
	
	win.setUrl(___cs+'?o=iniciob2b&p=3');
	win.showPopup('refpopup');
	
}