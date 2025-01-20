function imgPopup(url,title,notfound){
	var ancho = 500;
	var alto = 500;
	
	var ventana;
	xpos=(screen.width/2)-(ancho/2);
	ypos=(screen.height/2)-(alto/2);
	ventana = window.open('','','toolbar=false,resizable=1,width='+ancho+',height='+alto+',left='+xpos+',top='+ypos+'');
	ventana.document.write('<html><head><title>' + title + '</title></head>');
	ventana.document.write('<body scroll="no"><div align="center"><img src="' + url + '" style="border:none" onerror="this.onerror=null;this.src="' + notfound + '";"></a></div></body></html>');
	ventana.document.close();
	return(true);
}

function popUpImg(url,title, ancho, alto){
	//var ancho = 500;
	//var alto = 500;
	
	var ventana;
	xpos=(screen.width/2)-(ancho/2);
	ypos=(screen.height/2)-(alto/2);
	ventana = window.open('','','toolbar=false,resizable=1,width='+ancho+',height='+alto+',left='+xpos+',top='+ypos+'');
	ventana.document.write('<html><head><title>' + title + '</title></head>');
	ventana.document.write('<body scroll="no"><div align="center"><img src="' + url + '" style="border:none"></a></div></body></html>');
	ventana.document.close();
	return(true);
}

function htmlPopup(url,title){
	var ancho = 550;
	var alto = 500;		
	xpos=(screen.width/2)-(ancho/2);
	ypos=(screen.height/2)-(alto/2);
	window.open(url,title,'toolbar=false,scrollbars=1 resizable=1,width='+ancho+',height='+alto+',left='+xpos+',top='+ypos);
	return(true);
}

function htmlPopupAnchAlt(url,titulo,ancho,alto){			
	xpos=(screen.width/2)-(ancho/2);
	ypos=(screen.height/2)-(alto/2);
	window.open(url,'','toolbar=false,scrollbars=1 resizable=1,width='+ancho+',height='+alto+',left='+xpos+',top='+ypos);
	return(true);
}


function msjShow(msjId,event){
	
		var msj = document.getElementById(msjId);		
		
		/* Posiciï¿œn del ratï¿œn mas el scroll q pueda tener la pï¿œgina. */
    x = event.clientX + document.body.scrollLeft;
        
    if((x + 175) > document.body.scrollWidth){     	
    	x = x - 150;
    }
    
    y = event.clientY + document.body.scrollTop + 35; //Un margen para el ratï¿œn.
    //Si la ventana sale por debajo, la subimos hasta el puntero, y luego la desplazamos 25px mas.
    if((y + 150) > document.body.scrollHeight){
    	//alert(msj.scrollHeight+'-'+document.body.scrollHeight);
    	y = y - msj.scrollHeight -35 -25 ;
    }
    
    /*Mostramos el mensaje. */
    msj.style.display="block";
    /* Lo ubicamos. */
    msj.style.left = x + 'px';    
    msj.style.top = y + 'px';
		
}

function msjShowWithCheck(msjId,event){
	
	var msj = document.getElementById(msjId);		
	
	if (msj.style.display != "none") {
			/* Posiciï¿œn del ratï¿œn mas el scroll q pueda tener la pï¿œgina. */
	    x = event.clientX + document.body.scrollLeft;
	        
	    if((x + 175) > document.body.scrollWidth){     	
	    	x = x - 150;
	    }
	    
	    y = event.clientY + document.body.scrollTop + 35; //Un margen para el ratï¿œn.
	    //Si la ventana sale por debajo, la subimos hasta el puntero, y luego la desplazamos 25px mas.
	    if((y + 150) > document.body.scrollHeight){
	    	//alert(msj.scrollHeight+'-'+document.body.scrollHeight);
	    	y = y - msj.scrollHeight -35 -25 ;
	    }
	    
	    /*Mostramos el mensaje. */
	    msj.style.display="block";
	    /* Lo ubicamos. */
	    msj.style.left = x + 'px';    
	    msj.style.top = y + 'px';
	}
}

function msjShowTimeout(msjId,event,timeout){
	
		var msj = document.getElementById(msjId);		
		
		
				/* Posiciï¿œn del ratï¿œn mas el scroll q pueda tener la pï¿œgina. */
			x = event.clientX + document.body.scrollLeft;
			    
			if((x + 175) > document.body.scrollWidth){     	
				x = x - 150;
			}
			
			y = event.clientY + document.body.scrollTop + 35; //Un margen para el ratï¿œn.
			//Si la ventana sale por debajo, la subimos hasta el puntero, y luego la desplazamos 25px mas.
			if((y + 150) > document.body.scrollHeight){
				//alert(msj.scrollHeight+'-'+document.body.scrollHeight);
				y = y - msj.scrollHeight -35 -25 ;
			}
			
			/*Mostramos el mensaje. */
			msj.style.display="block";
			/* Lo ubicamos. */
			msj.style.left = x + 'px';    
			msj.style.top = y + 'px';
			 
			//setTimeout(function(){alert(msj);},timeout);
			setTimeout(function(){msj.style.display="none";},timeout);
				
}


function msjHide(msjId){
	var msj = document.getElementById(msjId);
	msj.style.display="none";
}


function mostrarDiv(divId){
	var d = document.getElementById(divId);	
	d.className='visible';
}
function ocultarDiv(divId){
	var d = document.getElementById(divId);
	d.className='oculto';	
}

/*Panel izqdo. categorias y taxonomia*/
/*Cats*/
function collapseCats() {
	$("#ulrc li.cab-open").click(function(){
		$(this).next().children('ul').slideToggle();
		$(this).toggleClass('collapse');
		$(this).toggleClass('cab-open cab-close');
	});
}

function verMasSubCat(etMas, etMenos) {
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
};

function verMasCat(etMas, etMenos) {
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
};

function retardoColapsarCatsVerMasCat(etMas, etMenos) {		
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
			verMasCat(etMas, etMenos);
		}, 4000);				
};

function sinRetardoColapsarCatsVerMasCat(etMas, etMenos) {		
	$('#ulrc').each(function(){
		var numHijos = $(this).parent().find('#ulrc>li').length;
		if(numHijos > 20){			
			$(this).append('<li class="ver-mas-cat-trigger">'+etMenos+'</li>');
		}
	});	
	
			verMasCat(etMas, etMenos);
			
};

/*Tipos*/
function collapseTipos() {
	$("#ulrt li.cab-open").click(function(){
		$(this).next().children('ul').slideToggle();
		$(this).toggleClass('collapse');
		$(this).toggleClass('cab-open cab-close');
	});
}

function verMasSubTipo(etMas, etMenos) {
	$('#ulrt>li>ul').each(function(){
		var numHijos = $(this).find('li').length;
		if(numHijos > 10){
			$(this).find('li:gt(9)').wrapAll('<div class="ver-mas-subcat-wrap" style="display:none"></div>');
			$(this).append('<li class="ver-mas-subcat-trigger">'+etMas+'</li>');
		}
	});
	
	$('.ver-mas-subtipo-trigger').each(function(){
		$(this).toggle(function(){
			$(this).parent().find('.ver-mas-subtipo-wrap').slideDown();
			$(this).text(etMenos);
		},function(){
			$(this).parent().find('.ver-mas-subtipo-wrap').slideUp();
			$(this).text(etMas);
		});
	});	
};

function verMasTipo(etMas, etMenos) {
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
};

//FUNCIONES PARA PAISES Y PROVINCIAS (accPedido1, myData1, gestUser2, gestAddress1, gestOrderB2B3)

//Omite acentos
function correctAccentedVocalsToUpper(stringToCorrect) {
    var correctedString = stringToCorrect.toUpperCase();
    correctedString = correctedString.replace(/[ÁÀÄÂ]/, 'A');
    correctedString = correctedString.replace(/[ÉÈËÊ]/, 'E');
    correctedString = correctedString.replace(/[ÍÌÏÎ]/, 'I');
    correctedString = correctedString.replace(/[ÓÒÖÔ]/, 'O');
    correctedString = correctedString.replace(/[ÚÙÜÛ]/, 'U');
    return correctedString;
}

//Devuelve true si la provincia dada pertenece a Espaï¿œa (comparaciï¿œn sin acentos)
function perteneceProvEspania(prov) {
	var enc = false;
	for (i = 0; !enc && prov != null && i < provEspaniaGlobal.length; i++ ) {
		enc = correctAccentedVocalsToUpper(provEspaniaGlobal[i]) == correctAccentedVocalsToUpper(prov);
	}
	return enc;
}

//Devuelve true si la provincia dada pertenece a Portugal (comparaciï¿œn sin acentos)
function perteneceProvPortugal(prov) {
	var enc = false;
	for (i = 0; !enc && prov != null && i < provPortugalGlobal.length; i++ ) {
		enc = correctAccentedVocalsToUpper(provPortugalGlobal[i]) == correctAccentedVocalsToUpper(prov);
	}
	return enc;
}

//Devuelve true si la provincia dada pertenece a Andorra (comparaci?in acentos)
function perteneceProvAndorra(prov) {
	var enc = false;
	for (i = 0; !enc && prov != null && i < provAndorraGlobal.length; i++ ) {
		enc = correctAccentedVocalsToUpper(provAndorraGlobal[i]) == correctAccentedVocalsToUpper(prov);
	}
	return enc;
}

//Devuelve true si la provincia dada pertenece a Francia (comparaciï¿œn sin acentos)
function perteneceProvFrancia(prov) {
	var enc = false;
	for (i = 0; !enc && prov != null && i < provFranciaGlobal.length; i++ ) {
		enc = correctAccentedVocalsToUpper(provFranciaGlobal[i]) == correctAccentedVocalsToUpper(prov);
	}
	return enc;
}

//Devuelve true si la provincia dada pertenece a Espaï¿œa (comparaciï¿œn sin acentos)
function pertenecePais(pais) {
	var enc = false;
	for (i = 0; !enc && pais != null && i < paisesGlobal.length; i++ ) {
		enc = correctAccentedVocalsToUpper(paisesGlobal[i]) == correctAccentedVocalsToUpper(pais);
	}
	return enc;
}

//Carga el combo de selecciï¿œn de Paï¿œses con los paï¿œses que haya en la tabla PAIS
function loadSelectPaises(select, newOptions, newOptionsVal, selectedValue, selectTextInfo) {
	select = $('#'+select.attr('id'));
	if(select.prop) {
	  var options = select.prop('options');
	}
	else {
	  var options = select.attr('options');
	}
	
	if (options != null){
	
		$('option', select).remove();
	
		$.each(newOptions, function(index, value) {
				if (value == '') {
					options[options.length] = new Option(selectTextInfo, '');
				} else {
					options[options.length] = new Option(value, newOptionsVal[index]);	
				}	
			});	
		var enc = false;
		var i = 0;
		var correctSelected;
		for (; !enc & i < options.length; i++) {				
			enc = correctAccentedVocalsToUpper(options[i].value) == correctAccentedVocalsToUpper(selectedValue);
			correctSelected = options[i].value;
		}
		if (enc) {
			select.val(correctSelected);
		}
	}
}

//Carga el combo de selecciï¿œn de Provincias con las provincias que haya en la tabla PROVINCIA
function loadSelectProvincias(select, newOptions, selectedValue, selectTextInfo) {
	select = $('#'+select.attr('id'));
	if(select.prop) {
	  var options = select.prop('options');
	}
	else {
	  var options = select.attr('options');
	}
	
	if (options != null){
	
		$('option', select).remove();
	
		$.each(newOptions, function(index, value) {
				if (value == '') {
					options[options.length] = new Option(selectTextInfo, '');
				} else {
					options[options.length] = new Option(value, value);	
				}						
			});	
		var enc = false;
		var i = 0;
		var correctSelected;
		for (; !enc & i < options.length; i++) {				
			enc = correctAccentedVocalsToUpper(options[i].value) == correctAccentedVocalsToUpper(selectedValue);
			correctSelected = options[i].value;
		}
		if (enc) {
			select.val(correctSelected);
		}
	}
}

//Inicializa el combo de provincias poniendo un ï¿œnico valor: --Seleccione Provincia--
//La funciï¿œn contarProvincias comprueba que el combo de provincias estï¿œ cargado y si no al clicar nos lanzarï¿œ un mensaje para que seleccionemos paï¿œs
function inicializaSelectProvincias(id,name,strSeleccProv,tipo) {
	var className = '';
	if (name == '') {
		name=id;
	}
	if($('#'+id).attr('class') != null){
		//si tiene clase se la asignamos
		className = $('#'+id).attr('class');
	}
	var parent = $('#'+id).parent();
	if (parent != null) {	
		$('#'+id).remove();
		
		if (tipo == "") {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvincias();"><option value="">'+strSeleccProv+'</option></select>');
		} else {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvincias('+"'"+tipo+"'"+');"><option value="">'+strSeleccProv+'</option></select>');
		}
	}
}

function inicializaSelectProvinciasAlterno(id,name,strSeleccProv,tipo) {
	var className = '';
	if (name == '') {
		name=id;
	}
	if($('#'+id).attr('class') != null){
		//si tiene clase se la asignamos
		className = $('#'+id).attr('class');
	}
	var parent = $('#'+id).parent();
	if (parent != null) {	
		$('#'+id).remove();
		
		if (tipo == "") {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvinciasFac();"><option value="">'+strSeleccProv+'</option></select>');
		} else {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvinciasFac('+"'"+tipo+"'"+');"><option value="">'+strSeleccProv+'</option></select>');
		}
	}
}

//Carga el combo de selecciï¿œn de Paï¿œses con los paï¿œses que haya en la tabla PAIS
function asignarPaisesLimpios(elementoPais, strSeleccPais){
	loadSelectPaises(elementoPais, paisesGlobal, paisesValGlobal, '', strSeleccPais);
}

//Carga el combo de selecciï¿œn de Provincias con las provincias que haya en la tabla PROVINCIA
function asignarProvinciasLimpias(elementoPais, elementoProvincia, strSeleccProv, tipo){
	var pais = elementoPais.val().toLowerCase();
	var prov = elementoProvincia.val();

	if (pais == "españa") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvincia(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}	
		loadSelectProvincias(elementoProvincia, provEspaniaGlobal, '', 	strSeleccProv);
	} else if(pais == "portugal") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvincia(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provPortugalGlobal, '', strSeleccProv);
	} else if(pais == "andorra") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvincia(elementoProvincia.attr('id'), elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provAndorraGlobal, '', strSeleccProv);
	} else if(pais == "gibraltar") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvincia(elementoProvincia.attr('id'), elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provGibraltarGlobal, '', strSeleccProv);
	} else if(pais == "france") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvincia(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provFranciaGlobal, '', strSeleccProv);
	} else if(pais == "belgique") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvincia(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provBelgicaGlobal, '', strSeleccProv);	
	} else if(pais == "monaco") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvincia(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provMonacoGlobal, '', strSeleccProv);		
    } else {
		inicializaSelectProvincias(elementoProvincia.attr('id'),elementoProvincia.attr('name'),strSeleccProv, tipo);
	}
}

function asignarProvinciasLimpiasAlterno(elementoPais, elementoProvincia, strSeleccProv, tipo){
	var pais = elementoPais.val().toLowerCase();
	var prov = elementoProvincia.val();

	if (pais == "españa") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvinciaAlterno(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}	
		loadSelectProvincias(elementoProvincia, provEspaniaGlobal, '', 	strSeleccProv);
	} else if(pais == "portugal") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvinciaAlterno(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provPortugalGlobal, '', strSeleccProv);
	} else if(pais == "andorra") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvinciaAlterno(elementoProvincia.attr('id'), elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provAndorraGlobal, '', strSeleccProv);
	} else if(pais == "gibraltar") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvinciaAlterno(elementoProvincia.attr('id'), elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provGibraltarGlobal, '', strSeleccProv);
	} else if(pais == "france") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvinciaAlterno(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provFranciaGlobal, '', strSeleccProv);
	} else if(pais == "belgique") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvinciaAlterno(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provBelgicaGlobal, '', strSeleccProv);
	} else if(pais == "monaco") {
		if (elementoProvincia.is('input')){
			changeInputBySelectProvinciaAlterno(elementoProvincia.attr('id'),elementoProvincia.attr('name'), tipo, strSeleccProv);
		}
		loadSelectProvincias(elementoProvincia, provMonacoGlobal, '', strSeleccProv);		
    } else {
    	inicializaSelectProvinciasAlterno(elementoProvincia.attr('id'),elementoProvincia.attr('name'),strSeleccProv, tipo);
	}
}

//Transforma campo select a input
function changeSelectByInput(id,name) {
	var className = '';
	if (name == '') {
		name=id;
	}
	if($('#'+id).attr('class')!=null){
		className = $('#'+id).attr('class');
	}
	var parent = $('#'+id).parent();
	if (parent != null) {		
		$('#'+id).remove();
		parent.prepend('<input type="text" id="'+id +'" name="'+name+'" class="'+className+'" size="30" maxlength="40"/>');
	}
}

//Transforma campo select a input con clase
function changeSelectByInputWithClass(id,name,className) {	
	if (name == '') {name=id;}
	if (className == null) {className='';}
	var parent = $('#'+id).parent();
	if (parent != null) {
		$('#'+id).remove();
		parent.append('<input type="text" id="'+id +'" name="'+name+'" class="'+className+'" size="30" maxlength="40"/>');
	}
}

//Transforma campo select a input (se usa con el paï¿œs de facturaciï¿œn)
//Cuando hagamos click sobre el campo paï¿œs (input) inmediatamente se transformarï¿œ en select
function changeSelectByInputFAC(id,name) {	
	var trastienda=true;
	if (name == '') {
		trastienda=false;
		name=id;
	}
	var parent = $('#'+id).parent();
	var elemento = $('#'+id);
	if (parent != null) {		
		$('#'+id).remove();
		if (!trastienda) 
			parent.append('<input type="text" id="'+id +'" name="'+name+'" size="30" maxlength="40"/ onClick="changeInputBySelectPais(id, name, strSeleccPais, strSeleccProv);asignarPaisesLimpios($('+"'#"+id+"'"+'),strSeleccPais);changeInputBySelectProvincia('+"'provincia_fac','','FAC',"+'strSeleccProv);">');
		else
			parent.append('<input type="text" id="'+id +'" name="'+name+'" size="30" maxlength="40"/ onClick="changeInputBySelectPais(id, name, strSeleccPais, strSeleccProv);asignarPaisesLimpios($('+"'#"+id+"'"+'),strSeleccPais);changeInputBySelectProvincia('+"'provincia_fac','provincia.fac','FAC',"+'strSeleccProv);">');
	}
}

//Transforma campo input a select (sï¿œlo se usa con el campo pais)
function changeInputBySelectPais(id,name,strSeleccPais,strSeleccProv) {
	if (name == '') {
		name=id;
	}
	// Si tiene clase se la asignamos
	var className = '';
	if ($('#'+id).attr('class') != null) {
		className = $('#'+id).attr('class');
	}
	var parent = $('#'+id).parent();
	if (parent != null) {		
		$('#'+id).remove();
		parent.append('<select name="'+name+'" id="'+id+'" class="'+className+'"><option value="">'+strSeleccPais+'</option></select>');
	}
	
	$(document).ready(function() {
		$("#pais").change(function(){
			asignarProvinciasLimpias($("#pais"),$("#provincia"),strSeleccProv,"");
	    });
		$("#pais_fac").change(function(){
			asignarProvinciasLimpias($("#pais_fac"),$("#provincia_fac"),strSeleccProv,"FAC");
	    });
		$("#pais_env").change(function(){
			asignarProvinciasLimpias($("#pais_env"),$("#provincia_env"),strSeleccProv,"ENV");
	    });
	});
}

//Transforma campo input a select (sï¿œlo se usa con el campo provincia)
//La funciï¿œn contarProvincias comprueba que el combo de provincias estï¿œ cargado y si no al clicar nos lanzarï¿œ un mensaje para que seleccionemos paï¿œs
function changeInputBySelectProvincia(id,name,tipo,strSeleccProv) {	
	var className = '';
	if (name == '') {
		name=id;
	}
	if($('#'+id).attr('class')!=null){
		//si tiene clase se la asignamos
		className = $('#'+id).attr('class');
	}
	var parent = $('#'+id).parent();
	if (parent != null) {		
		$('#'+id).remove();
		
		if (tipo == "") {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvincias();"><option value="">'+strSeleccProv+'</option></select>');
		} else {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvincias('+"'"+tipo+"'"+');"><option value="">'+strSeleccProv+'</option></select>');
		}
	}
}

function changeInputBySelectProvinciaAlterno(id,name,tipo,strSeleccProv) {	
	var className = '';
	if (name == '') {
		name=id;
	}
	if($('#'+id).attr('class')!=null){
		//si tiene clase se la asignamos
		className = $('#'+id).attr('class');
	}
	var parent = $('#'+id).parent();
	if (parent != null) {		
		$('#'+id).remove();
		
		if (tipo == "") {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvinciasFac();"><option value="">'+strSeleccProv+'</option></select>');
		} else {
			parent.prepend('<select name="'+name+'" id="'+id+'" class="'+className+'" onClick="contarProvinciasFac('+"'"+tipo+"'"+');"><option value="">'+strSeleccProv+'</option></select>');
		}
	}
}

//FunciÃ³n que calcula los precios de escalado
function getScalesProductContent(cod, css, responsive){	
	
	var escaleId = "#scalesContentFill"+cod;
	if (responsive == 'true') {
		escaleId = "#scalesContentRespFill"+cod;
	}
	
	
	// Si no llame antes...
	if ($(escaleId).html() == '') {
		$.get(css+"&o=getProdEscalas_b2c&p=1&producto="+cod+"&t=a", function(data) {
				if(data != "" && $.trim(data.toLowerCase()).match("\.euro\.") != null){
					//Liberamos
					//$.get(css+"&o=getProdEscalas_b2c&p=1&t=r").complete(function() { 
						$(escaleId).html(data);
					//});
				
				}else{
					//Liberamos
					$.get(css+"&o=getProdEscalas_b2c&p=1&t=r").complete(function() { 
						$(escaleId).html("<fmt:message key='msgSesionExpirado'/>  ");
					});
				}
				;
			})
			.error(function(error){
				//Liberamos
				$.get(css+"&o=getProdEscalas_b2c&t=r").complete(function() { 
					$(escaleId).html(data);
				});	
			});
	}; // Si no llame antes...
}

function getUveScalesProductContent(cod, css, responsive){	

	var escaleId = "#uve_scalesContentFill"+cod;
	if (responsive == 'true') {
		escaleId = "#uve_scalesContentRespFill"+cod;
	}

		$.get(css+"&o=getProdEscalas_b2c&p=1&producto="+cod+"&t=a", function(data) {
				if(data != "" && $.trim(data.toLowerCase()).match("\.euro\.") != null){
					//Liberamos
					$.get(css+"&o=getProdEscalas_b2c&p=1&t=r").complete(function() { 
						$(escaleId).html(data);
					});
				
				}else{
					//Liberamos
					$.get(css+"&o=getProdEscalas_b2c&p=1&t=r").complete(function() { 
						$(escaleId).html("<fmt:message key='msgSesionExpirado'/>  ");
					});
				}
				;
			})
			.error(function(error){
				//Liberamos
				$.get(css+"&o=getProdEscalas_b2c&t=r").complete(function() { 
					$(escaleId).html(data);
				});	
			});
}

function closeCSFinder() {

	$("#csfinder").css('display','none');
	$("body").removeClass("modal-open");	 

	$(document).unbind("keyup.csfinder");
	$(document).unbind("click.csfinder");
	//IE
	if (__isIE) {		
		var newdiv = document.createElement("div");
		newdiv.id='csfinder';
		newdiv.innerHTML = '';					
		$('#csfinder').replaceWith(newdiv);
	} 

	
	
}


// Convierte un color hexadecimal en un tono mï¿œs claro o mï¿œs oscuro dependiendo de si percent es positivo o negativo
function shadeColor1(color, percent) {  // deprecated. See below.
    var num = parseInt(color.slice(1),16), amt = Math.round(2.55 * percent), R = (num >> 16) + amt, G = (num >> 8 & 0x00FF) + amt, B = (num & 0x0000FF) + amt;
    return "#" + (0x1000000 + (R<255?R<1?0:R:255)*0x10000 + (G<255?G<1?0:G:255)*0x100 + (B<255?B<1?0:B:255)).toString(16).slice(1);
}

/**
 * detect IE
 * returns version of IE or false, if browser is not Internet Explorer
 */
function detectIE() {
	
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE');
    var trident = ua.indexOf('Trident/');
    var edge = ua.indexOf('Edge/');
    
    return (msie > 0 || trident > 0 || edge > 0 );
}

/**
 * Funcion que comprueba las dimensiones de los banners
 * de la tienda y los muestra unicamente cuando cumple
 * con el width y el height permitido.
 * Ojo, los elementos img deben estar ocultos desde inicio. 
 * @returns
 */
function checkBannersHeight() {
	var maxWidth = 200;
	var maxHeight = 520;
	$("img[id^=banner-]").each(function(index){
		//console.log( index + ": " + $( this ).height() );
		if($(this).height() <= maxHeight && $(this).width() <= maxWidth){
			maxHeight = (maxHeight - $(this).height());
			//console.log("maxHeight is :" + maxHeight);
			$(this).toggle();
		}
	});
}

/**
 * Funcion que redimensiona las imagenes manteniendo la relacion de aspecto 1.325
 * cuando se cambia las dimensiones de la ventana del navegador
 */
function resizeImages() {

	// Make all images same size
	var images = $('.image_size');
	var maxHeight = 0;

	// Loop all elements and check height, if bigger than max then save it
	for (var i = 0; i < images.length; i++) {
		// 1.3125 is the predefined aspect ratio of an image
		if (maxHeight < ($(images[i]).outerWidth() / 1.3125)) {
			maxHeight = ($(images[i]).outerWidth() / 1.3125);
		}
	}

	// Set ALL card images to this height
	for (var i = 0; i < images.length; i++) {
		$(images[i]).outerHeight(maxHeight);
		
	}

	var photos = $('.card-photo');
	// Set ALL card photos to this height
	for (var i = 0; i < photos.length; i++) {
	// + 20 para respetar el margen inferior
		$(photos[i]).outerHeight(maxHeight + 20);
		$(photos[i]).css({"max-height": maxHeight + 20});
		
	}

	var photosTop = $('.card-photo-top');
	var maxHeightPhotoTop = 0;

	// Loop all elements and check height, if bigger than max then save it
	for (var i = 0; i < photosTop.length; i++) {
		if (maxHeightPhotoTop < ($(photosTop[i]).outerWidth() / 1.3125)) {
			maxHeightPhotoTop = ($(photosTop[i]).outerWidth() / 1.3125);
		}
	}

	// Set ALL  image_size_bottom to this height
	for (var i = 0; i < photosTop.length; i++) {
		$(photosTop[i]).outerHeight(maxHeightPhotoTop);
	}

	var images_bottom = $('.image_size_bottom');
	var maxHeightBottom = 0;

	// Loop all elements and check height, if bigger than max then save it
	for (var i = 0; i < images_bottom.length; i++) {

		if (maxHeightBottom < ($(images_bottom[i]).outerWidth() / 1.3125)) {
			maxHeightBottom = ($(images_bottom[i]).outerWidth() / 1.3125);
		}
	}

	// Set ALL image_size_bottom to this height
	for (var i = 0; i < images_bottom.length; i++) {
		$(images_bottom[i]).outerHeight(maxHeightBottom);
	}
} 
