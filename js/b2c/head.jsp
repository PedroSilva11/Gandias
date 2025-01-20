

	var rmHaciaArriba = true;

	$(document).ready(function() {

		$("#haciaArriba").scrollToTop();
		$(".form-addProduct input").on("keypress",function(e){if(e.which===13){$('#btnAddCart').click();}});

	});
	
	function vaciarCarro() {
		document.location = 'PStores?s=7788&o=updtCart_b2c&p=3&t=a';
	}

	function inc(id,cantidad){
		
		var inp = document.getElementById(id);
		if( Number(inp.value) >= 0){
	 		inp.value = Number(inp.value) + Number(cantidad);
		}else{
			inp.value = 0;   
		}
	}

	function dec(id,cantidad){
		
		var inp = document.getElementById(id);
	 	if( Number(inp.value) > 0){
	 		inp.value = Number(inp.value) - Number(cantidad);		 		
	 		if (inp.value < 0) {
	 			inp.value = 0;
	 		}
	 	}else{
	 		inp.value = 0;
	 	}
	}

	function addPedCarro(codigo,css){
		if (!isNaN(codigo) && codigo > 0) {				
			//Comprobación de si existe contenido previo en el carro											
			var url = css + '&o=updtCart_b2c&p=4&t=a&cod.'+codigo+'=A';
			
			BootstrapDialog.confirm("Tem a certeza que pretende adicionar a encomenda" + " " + codigo + " " + "ao carrinho?", function(result) {
				if (result){
					window.location = url;			
				} 		
			});			
		}
	}
	
	function checkCarroAjaxCheckMsgExcel(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, urlwhenComplete, __param_o, __param_url){	
		var respuesta = {msj:"", tipo:"0"};
		if (codigo!='' && !isNaN(num) && num>0) {
		
			//	Hacemos una llamada ajax para ver la disponibilidad de el/los producto
			$.ajaxSetup({async: false});
			$.ajax({
				type : "GET",
				//async : false,
				timeout: 20000,
				data: {o : "product_b2c", p : 7, codProduct : codigo, t: "a"},
				url : "PStores?s=7788",
				success : function(data) {
					//	parseamos array
					var dataProd = $.parseJSON(data);
					
					//	si hay un solo producto
					if(dataProd.length==1){	
					
						disponible = dataProd["0"].stock;
									
						var fechaEntrada = "";
						var cantidadRepo = 0;
						var res = false;
						var codProveedor = 0;
						var stock = 0;
									
						if(dataProd[0].fechaEntrada != ""){
							fechaEntrada = dataProd[0].fechaEntrada;
						}
						
						if(dataProd[0].cantidadRepo != ""){
							cantidadRepo = dataProd[0].cantidadRepo; 
						}
						
						if(dataProd[0].codProd != ""){
							codigo = dataProd[0].codProd;
						}
						
						if(dataProd[0].stock != ""){
							res = dataProd[0].stock;
						}
						
						if(dataProd[0].codProveedor != "" && dataProd[0].codProveedor != undefined){
							codProveedor = dataProd[0].codProveedor;
						}
						
						if(dataProd[0].stock != ""){
							stock = dataProd[0].stock;
						}
						
						
						var permitirCompra = true;
						
						if(codProveedor > 0 && fechaEntrada != "" && stock == 0){
							permitirCompra = false;
						}					
						
		 				//Liberamos
						 
						var msj = "";
						if (!isNaN(codigo) && isNumeric(num) && codigo!=0 && num >= 0) {			
							if ( !disponible) {
												
									if (fechaEntrada == '') {
										msj = "Atualmente não temos stock suficiente"+"\nVocê deseja continuar com a compra deste artigo?";
										respuesta = {msj:msj, tipo:"3"};
										
										
									} else {
										if(cantidadRepo != null && isNumeric(cantidadRepo) && cantidadRepo>0 && permitirCompra){
											msj = "Atualmente não temos stock suficiente"+"\nData prevista de entrada:  "+fechaEntrada+",\u00a0"+cantidadRepo+"\u00a0Uds"+"\nVocê deseja continuar com a compra deste artigo?";
											respuesta = {msj:msj, tipo:"3"};
										}else if(cantidadRepo != null && isNumeric(cantidadRepo) && cantidadRepo>0 && !permitirCompra){
											msj = "Atualmente não temos stock suficiente para este artigo."+"\nData prevista de entrada: "+fechaEntrada+",\u00a0"+cantidadRepo+"\u00a0Uds";
											respuesta = {msj:msj, tipo:"2"};	
										}else{
											msj = "Atualmente não temos stock suficiente"+"\nData prevista de entrada: "+fechaEntrada+"\nVocê deseja continuar com a compra deste artigo?";
											respuesta = {msj:msj, tipo:"3"};	
									}	
								}			
												
							}	
						}else {
							msj = "Deve indicar uma quantidade maior que 0 (zero) ";
							respuesta = {msj:msj, tipo:"2"};
						}
						
		 			}else if(dataProd.length > 1){
		 				//	multiples referencias, construimos modal pasandole el array
						constructModal(dataProd, num);
		 			}else{
		 				//	msj sin resultados
		 				msj = "Nenhum produto foi encontrado com esse código o essa referência.";
		 				respuesta = {msj:msj, tipo:"2"};
		 			}
					
				},
				error : function(data) {
					//	error accediendo a los datos
					msj = "Produziu-se um erro no acesso aos dados que solicita";
					respuesta = {msj:msj, tipo:"2"};
				}
			});
		} else {
			msj = "Por favor, insira valores corretos";
			respuesta = {msj:msj, tipo:"2"};
		}

		return respuesta;
	}

	function checkCarroAjaxCompleteFunction(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, urlwhenComplete, __param_o, __param_url, pedidoRapido, permitirCompra){
	
		if (!isNaN(codigo) && isNumeric(num) && codigo!=0 && num >= 0) {
			if (!disponible) {
				
					if (fechaEntrada == '') {
						BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
							if (result){
								$.get(urlwhenComplete).complete(function() { 
									addCarroAjax(codigo,num,true,0,fechaEntrada,cantidadRepo,pedidoRapido);
									if (isNaN(__param_o) && isNaN(__param_url)){
										if (__param_o == 'viewCart_b2c' || __param_o == 'updtCart_b2c') {
 											window.location.href=__param_url;
 										}											
									}
								});											
							} else{
								return;
							}
					
						});			
					} else {
						if(cantidadRepo != null && isNumeric(cantidadRepo) && cantidadRepo>0 && permitirCompra){
							BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nData prevista de entrada:  "+fechaEntrada+",\u00a0"+cantidadRepo+"\u00a0Uds"+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
								if (result){
								  $.get(urlwhenComplete).complete(function() { 		
									addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, pedidoRapido);
									if (isNaN(__param_o) && isNaN(__param_url)){
										if (__param_o == 'viewCart_b2c' || __param_o == 'updtCart_b2c') {
 											window.location.href=__param_url;
 										}											
									}
								  });				
								} 	
							});	
						}else if(cantidadRepo != null && isNumeric(cantidadRepo) && cantidadRepo>0 && !permitirCompra){
							BootstrapDialog.alert("Atualmente não temos stock suficiente para este artigo."+"\nData prevista de entrada: "+fechaEntrada+",\u00a0"+cantidadRepo+"\u00a0Uds", function(){});							
						}else{
							BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nData prevista de entrada: "+fechaEntrada+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
								if (result){
								 $.get(urlwhenComplete).complete(function() { 
									addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, pedidoRapido);
									if (isNaN(__param_o) && isNaN(__param_url)){
										if (__param_o == 'viewCart_b2c' || __param_o == 'updtCart_b2c') {
 											window.location.href=__param_url;
 										}											
									}
								 });					
								} 		
							});		
					}	
				}
				 				
			}else{
				$.get(urlwhenComplete).complete(function() { 	
					addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, pedidoRapido);	
					if (isNaN(__param_o) && isNaN(__param_url)){
										if (__param_o == 'viewCart_b2c' || __param_o == 'updtCart_b2c') {
 											window.location.href=__param_url;
 										}											
									}
				});	
			}	
		}else {
			BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
			var input = document.getElementById("num."+codigo);
			if ( input != null) {
				input.focus();
			}
		}
	}

	function checkCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, stock, thiso){
		if (!isNaN(codigo) && isNumeric(num) && codigo!=0 && num > 0) {
			var stockDisponible = compruebaCantidadCarro(codigo, num, stock);			
			if (!disponible || stockDisponible != 1) {
			
				
							if (fechaEntrada == '') {
								BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
									if (result){
										addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, thiso);			
									} else{
										return;
									}
							
								});			
							} else {
								if(cantidadRepo != null && isNumeric(cantidadRepo) && cantidadRepo>0){
									BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nData prevista de entrada:  "+fechaEntrada+",\u00a0"+cantidadRepo+"\u00a0Uds"+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
										if (result){
											addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, thiso);				
										} 	
									});	
								}else{
									BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nData prevista de entrada: "+fechaEntrada+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
										if (result){
											addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, thiso);				
										} 		
									});		
								}	
							}
									
			}
			else {
				addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, thiso);	
			}	
		} else {
			BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
			var input = document.getElementById("num."+codigo);
			if ( input != null) {
				input.focus();
			}
		}
	}
	
	//Actualiza el número de productos y el importe en la cabecera de las contenedoras
	function actualizaCabeceraCarroAjax(handleData){ 
 		
		var urlAjax = 'PStores?s=7788' + '&o=updtCart_b2c&p=7&t=a';			 
		$.get(urlAjax, function(data){
			$.get('PStores?s=7788'+"&o=updtCart_b2c&p=7&t=r");
			handleData(data);
		});	
	}
	
	function addCarroAjax(codigo, num1, disponible, rnd, fechaEntrada, cantidadRepo, thiso){ 
 		//var num = document.getElementById(num).value;
 		var num = num1;
		if (!isNaN(codigo) && isNumeric(num) && codigo!=0 && num >= 0) {			
			if (num == 0) {
				num = rnd;
				$("#num\\."+codigo).val(rnd);
			}
			
			var urlAjax = 'PStores?s=7788' + '&o=updtCart_b2c&p=6&t=a&cod.'+codigo+'=A&num.'+codigo+'='+num;		
			$.get(urlAjax, function(data){
				$.get('PStores?s=7788'+"&o=updtCart_b2c&p=6&t=r");
				
				try { // instrucciones a probar
					var dataCart = $.parseJSON(data.trim());
					$(".numProductosCarro").html(dataCart[0].numTotalProductsCart);	
					$(".importeCarro").html(dataCart[0].totalCart.toString().replace(".",",") + " &euro;");
					$(".cartCantidadCarro"+codigo).html(dataCart[0].quantity);
					
					
					
					// Mostrar el mensaje al usaurio
					var snackbar = $("#snackbar");					
					if(snackbar.length > 0) {
					   var text = "Número de produtos <br> adicionados ao carrinho:<span id='cantidad'>" + dataCart[0].quantity + "</span>";
					   showSnackbar(text);
					}
					if(!thiso){
						$("#modalCarrito").show();
			    		$("#modalCarrito").modal("show");
					}
								
    				//Evento GA4
					addToCartB2CGtag(codigo, dataCart[0].reference, num, dataCart[0].priceWithoutTax);
					//Evento FBP
					addToCartB2CFbq(codigo, dataCart[0].reference, num, dataCart[0].priceWithoutTax);
					
				}catch (e) {
					 return;
				}
			});
			
		} else {
			BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
			var input = document.getElementById("num."+codigo);
			if ( input != null) {
				input.focus();
			}
		}
	}

	function addCarro(codigo, num, disponible, fechaEntrada, stock, cantidadRepo){     
 		//var num = document.getElementById(num).value;
		if (!isNaN(codigo) && isNumeric(num) && codigo!=0 && num > 0) {
			var stockDisponible = compruebaCantidadCarro(codigo, num, stock);
			var url = 'PStores?s=7788' + '&o=updtCart_b2c&p=1&t=a&cod.'+codigo+'=A&num.'+codigo+'='+num;
			if (!disponible || stockDisponible != 1) {
				
							if (fechaEntrada == '') {
								BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
									if (result){
										doAddToCart(codigo, num);
										//window.location = url;
									} else{
										return;
									}							
								});			
							} else {
								if(cantidadRepo != null && isNumeric(cantidadRepo) && cantidadRepo>0){
									BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nData prevista de entrada:  "+fechaEntrada+",\u00a0"+cantidadRepo+"\u00a0Uds"+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
										if (result){
											doAddToCart(codigo, num);
											//window.location = url;
										} 	
									});	
								}else{
									BootstrapDialog.confirm("Atualmente não temos stock suficiente"+"\nData prevista de entrada: "+fechaEntrada+"\nVocê deseja continuar com a compra deste artigo?", function(result) {
										if (result){
											doAddToCart(codigo, num);
											//window.location = url;
										} 		
									});		
								}	
							}
						
			} else {				
				doAddToCart(codigo, num);
				//window.location = url;
			}			
		} else {
			BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
			var input = document.getElementById("num."+codigo);
			if ( input != null) {
				input.focus();
			}
		}
	}
	
	/*
	 * Añadir un producto al carro via ajax sin recargar la página
	 */
	function doAddToCart(codigo, cantidad) {	   
	   var params = "codigo=" + codigo + "&cantidad=" + cantidad;
            
       $.ajaxSetup({
           async: false
       });
       $.ajax({
           url: "jsp/b2c/ajxAddToCart.jsp?"+params,
           method: "get",
           success: function(result,status,xhr) {   
               if (result != "ERROR") {                   
                    var dataCart = $.parseJSON(result.trim());
                    $(".numProductosCarro").html(dataCart[0].numTotalProductsCart); 
                    $(".importeCarro").html(dataCart[0].importe.toString().replace(".",",") + " &euro;");
               }     
           },
           error: function(xhr,status,error) {
               console.log(error);
           }
       }); 
       $.ajaxSetup({
           async: true
       });
       
       // Cerrar la ventana emergente
        $.colorbox.close();   
	}
		
	/**
	*   
	*	Funcion replica de aniadirACarro, se diferencia en la no validación a nivel de mensajes Bootstrap
	*   
	*/
	function aniadirACarroExcel(codigo, num, update) {
			
		//	si el codigo no esta vacio y el valor de num es numerico mayor que cero
		if (codigo!='' && !isNaN(num) && num>0) {
		
			//	Hacemos una llamada ajax para ver la disponibilidad de el/los producto
			$.ajaxSetup({async: false});
			$.ajax({
				type : "GET",
				//async : false,
				timeout: 20000,
				data: {o : "product_b2c", p : 7, codProduct : codigo, t: "a"},
				url : "PStores?s=7788",
				success : function(data) {
					//	parseamos array
					var dataProd = $.parseJSON(data);
					
					//	si hay un solo producto
					if(dataProd.length==1){	
					
						var fechaEntrada = "";
						var cantidadRepo = 0;
						var res = false;
									
						if(dataProd[0].fechaEntrada != ""){
							fechaEntrada = dataProd[0].fechaEntrada;
						}
						
						if(dataProd[0].cantidadRepo != ""){
							cantidadRepo = dataProd[0].cantidadRepo; 
						}
						
						if(dataProd[0].codProd != ""){
							codigo = dataProd[0].codProd;
						}
						
						if(dataProd[0].stock != ""){
							res = dataProd[0].stock;
						}
						
		 				//Liberamos
						 
						//TODO Llamamos al carro con disponibilidad res
						checkCarroAjaxCompleteFunctionNoValid(codigo,num,update, res,0,fechaEntrada,cantidadRepo, "PStores?s=7788&o=product_b2c&t=r",__param_o , 'PStores?s=7788&o=viewCart_b2c&p=1');
						//Tanto si se cancela como si no, se establece el foco en el código del pedido rápido
						//form.cod.focus();
		 			}else if(dataProd.length > 1){
		 				//	multiples referencias, construimos modal pasandole el array
						constructModal(dataProd, num);
		 			}else{
		 				//	msj sin resultados
		 				//BootstrapDialog.alert("Nenhum produto foi encontrado com esse código o essa referência.", function(){});
		 			}
					
				},
				error : function(data) {
					//	error accediendo a los datos
					//BootstrapDialog.alert("Produziu-se um erro no acesso aos dados que solicita", function(){});
				}
			});
		} else {
			//BootstrapDialog.alert("Por favor, insira valores corretos", function(){});
		}
		
		
		return true;
	}
	
	/**
	*	Funcion que chequea la disponibilidad de los productos
	*	buscando por cod o referencia. La llamada ajax recibe un
	*	array json y en caso de haber encontrado varios productos
	*	se mostrara un modal en el que el usuario debera elegir
	*	cual añadira al carrito	
	*/
	function aniadirACarro(f) {
		var form = document.getElementById(f);
		var codigo = form.cod.value.trim();
		var num = form.num.value;
		
		//	si el codigo no esta vacio y el valor de num es numerico mayor que cero
		if (codigo!='' && !isNaN(num) && num>0) {
		
			// Si es un cliente hyperburo se busca la equivalencia del código
				
		
			//	Hacemos una llamada ajax para ver la disponibilidad de el/los producto
			$.ajaxSetup({async: false});
			$.ajax({
				type : "GET",
				//async : false,
				timeout: 20000,
				data: {o : "product_b2c", p : 7, codProduct : codigo, t: "a"},
				url : "PStores?s=7788",
				success : function(data) {
					//	parseamos array
					var dataProd = $.parseJSON(data);
					
					//	si hay un solo producto
					if(dataProd.length==1){	
					

					
						var fechaEntrada = "";
						var cantidadRepo = 0;
						var res = false;
						var codProveedor = 0;
						var stock = 0;
									
						if(dataProd[0].fechaEntrada != ""){
							fechaEntrada = dataProd[0].fechaEntrada;
						}
						
						if(dataProd[0].cantidadRepo != ""){
							cantidadRepo = dataProd[0].cantidadRepo; 
						}
						
						if(dataProd[0].codProd != ""){
							codigo = dataProd[0].codProd;
						}
						
						if(dataProd[0].stock != ""){
							res = dataProd[0].stock;
						}
						
						if(dataProd[0].codProveedor != "" && dataProd[0].codProveedor != undefined){
							codProveedor = dataProd[0].codProveedor;
						}
						
						if(dataProd[0].stock != ""){
							stock = dataProd[0].stock;
						}
						
						
						var permitirCompra = true;
						
						if(codProveedor > 0 && fechaEntrada != "" && stock == 0){
							permitirCompra = false;
						}
						
		 				//Liberamos
						 
						//TODO Llamamos al carro con disponibilidad res
						checkCarroAjaxCompleteFunction(codigo,num,res,0,fechaEntrada,cantidadRepo, "PStores?s=7788&o=product_b2c&t=r",__param_o , 'PStores?s=7788&o=viewCart_b2c&p=1',true,permitirCompra);
						//Tanto si se cancela como si no, se establece el foco en el código del pedido rápido
						//form.cod.focus();
						form.cod.value = "";
						form.num.value = "";
		 			}else if(dataProd.length > 1){
		 				//	multiples referencias, construimos modal pasandole el array
						constructModal(dataProd, num);
						form.cod.value = "";
						form.num.value = "";
		 			}else{
		 				//	msj sin resultados
		 				BootstrapDialog.alert("Nenhum produto foi encontrado com esse código o essa referência.", function(){});
		 			}
					
				},
				error : function(data) {
					//	error accediendo a los datos
					BootstrapDialog.alert("Produziu-se um erro no acesso aos dados que solicita", function(){});
				}
			});
		} else {
			BootstrapDialog.alert("Por favor, insira valores corretos", function(){});
		}
		//Tanto si se cancela como si no, se establece el foco en el código del pedido rápido
		form.cod.focus();
	}
	
	/**
	*	Funcion que construye el modal de seleccion de
	*	producto del pedido rapido. Los botones del modal
	*	contendran los datos necesarios para añadir al carrito
	*	de manera que al hacer click sobre alguno se pueda
	*	añadir facilmente.
	*/
	function constructModal(dataProd, num){
		
		var table = $("<table></table>");
		for (var i in dataProd) {
			table.append(
						"<tr><td><div class='container'>" +
							"<div class='left'>"+
								"<img style='width:80px;height:80px;' src='"+dataProd[i].imagen+"' alt='"+dataProd[i].codProd+"' />"+
							"</div>"+
							"<div class='center'><b>"+dataProd[i].descripcion+"</b><br/>"+
								"<span style='float: left;'>Cód:&nbsp;</span><b style='float: left;'><span>"+dataProd[i].codProd+"</span></b>"+
								"<span style='float: left;padding-left: 5px;'>Ref:&nbsp;</span><b style='float: left;'><span>"+dataProd[i].referencia+"</span></b>"+
							"</div>"+
							"<div class='right'>"+
								"<span style='color:#7F1E57;font-size:17px;'>"+dataProd[i].precio+"&nbsp;&euro;</span><br/>"+
								"<input name='button' type='button' class='buttom' data-code='"+dataProd[i].codProd+"' data-num='"+num+"' data-fechaentrada='"+dataProd[i].fechaEntrada+"' data-cantidadrepo='"+dataProd[i].cantidadRepo+"' data-stock='"+dataProd[i].stock+"' onclick='modalTriggered($(this))' value='Adicionar'>"+
							"</div>"+
						"</div></td></tr>"
			  );
		}
		$('#pr-modal').find('.modal-body').html(table);
		$('#pr-modal').modal('toggle');
	}
	
	/**
	*	Funcion que escucha a los botones del modal de
	*	pedido rapido, obtiene los datos necesarios para
	*	procesar el updtcart y llama a la funcion que lo hace
	*/
	function modalTriggered(button){
		$('#pr-modal').modal('toggle');
			var code = $(button).data("code");
			var num = $(button).data("num");
			var res = $(button).data("stock");
			var fechaEntrada = $(button).data("fechaentrada");
			var cantidadRepo = $(button).data("cantidadrepo");
			checkCarroAjaxCompleteFunction(code,num,res,0,fechaEntrada,cantidadRepo, "PStores?s=7788&o=product_b2c&t=r",__param_o , 'PStores?s=7788&o=viewCart_b2c&p=1', false, true);
	}
	
	function setFocus(){
		var inputUsuario = document.getElementById('searchString');
		if(inputUsuario){
			inputUsuario.focus();
			return;
		}
		var inputSearch = document.getElementById('searchString');
		if(inputSearch){
			inputSearch.focus();
		}			
	}
	
	//Funcion para afinar la busqueda en la cateogrias indicada
	function  subResultados(form, codigoCategoria){			
		var formulario = document.getElementById(form);			
		formulario.codCategory.value=codigoCategoria;
		formulario.submit();
	}
	
	//Actualiza el codigo de la categoria con el valor seleccionado en el select.
	function updateCodCategory(form, select){
		var formulario = document.getElementById(form);
		formulario.codCategory.value = select[select.selectedIndex].value;
	}
	

	/***
	 * Función que comprueba el stock y cantidad seleccionada a comprar
	 */
	 function validar(f,favoritos, isResp) {
		var avisoSinStock = "";
		for (i=0;i < f.elements.length;i++) {
			if (f.elements[i].type=='text') {
				if (f.elements[i].value.length == 0 || !isNumeric(f.elements[i].value) || f.elements[i].value<0 ) {
					f.elements[i].focus();
					BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
					return;				
				}
				else {
					if (favoritos != undefined && isResp != true) {
						var cod = f.elements[i].name;
						cod = cod.substring(cod.indexOf("_")+1);
						
						//Creamos input de num para favoritos con . (en favoritos viene con _ para que no se dupliquen)
					    var input = document.createElement("input");
					    input.setAttribute("type", "hidden");
					    input.setAttribute("name", "num."+cod);
					    input.setAttribute("id", "num."+cod);
					    input.setAttribute("value", "0");
					    f.appendChild(input);
					}    
				}
				
				if (isResp == true && f.elements[i].name != null 
						&& !isNumeric(f.elements[i].name.substring(f.elements[i].name.indexOf(".")+1))) {
					var codigo = f.elements[i].id;
					codigo = codigo.substring(codigo.indexOf(".")+1);
					var stock = document.getElementById('stock.'+codigo);
					if (stock == undefined) {
						codigo = codigo.substring(codigo.indexOf("_")+1);
						stock = document.getElementById('stock.'+codigo);
					}
					if(stock.value < 1 && codigo.indexOf("_-") > -1){
						avisoSinStock += codigo + ", ";
					} 
				} else if (isResp != true){				
					if(isNumeric(f.elements[i].value) && f.elements[i].value > 0 ){ //Es numerico y mayor que 0 asi que se añadirá al carro.
						var codigo = f.elements[i].name;
						
						if (isNumeric(codigo.substring(codigo.indexOf(".")+1)) || isNumeric(codigo.substring(codigo.indexOf("_")+1)) || codigo.indexOf("_-")!=-1) {
							if (favoritos == undefined) {
								codigo = codigo.substring(codigo.indexOf(".")+1);
							} else {
								codigo = codigo.substring(codigo.indexOf("_")+1);
								input.setAttribute("value", document.getElementById('num_'+codigo).value);
								f.appendChild(input);
							}	
							
							var stock = document.getElementById('stock.'+codigo);
							if(stock.value < 1 && codigo.indexOf("_-") > -1){
								avisoSinStock += codigo + ", ";
							} 	
						}					
					}
				}
			}
		}

		
		if(avisoSinStock != ""){
			avisoSinStock = avisoSinStock.substring(0, avisoSinStock.length - 2);
			
			
				BootstrapDialog.confirm("Para artigos "+ avisoSinStock +" não temos stock"+", adicione o carro que você procura?", function(result) {
					if (result){
						f.submit();	
					} else{
						return;
					}	
				});			
				
		}else{			
			f.submit();
		}
		
		
	}
	
	 function validarAjax(f,favoritos) {
			var productosAgregados = new Array();
			var productosAgregadosSinStock = new Array();
			var cont = 0;
			var contSinStock = 0;
			var avisoSinStock = "";
			
			for (i=0;i < f.elements.length;i++) {
				if (f.elements[i].type=='text') {
					if (f.elements[i].value.length == 0 || !isNumeric(f.elements[i].value) || f.elements[i].value < 0 ) {
						f.elements[i].focus();
						BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
						return;				
					}
					else {
						if (favoritos != undefined) {
							var cod = f.elements[i].name;
							cod = cod.substring(cod.indexOf("_")+1);
							
							//Creamos input de num para favoritos con . (en favoritos viene con _ para que no se dupliquen)
						    var input = document.createElement("input");
						    input.setAttribute("type", "hidden");
						    input.setAttribute("name", "num."+cod);
						    input.setAttribute("id", "num."+cod);
						    input.setAttribute("value", "0");
						    f.appendChild(input);
						}    
					}
					
					if(isNumeric(f.elements[i].value) && f.elements[i].value > 0 ){ //Es numerico y mayor que 0 asi que se añadirá al carro.
						var codigo = f.elements[i].name;

						if (favoritos == undefined) {
							codigo = codigo.substring(codigo.indexOf(".")+1);
						} else {
							codigo = codigo.substring(codigo.indexOf("_")+1);
							input.setAttribute("value", document.getElementById('num_'+codigo).value);
							f.appendChild(input);
						}	
						
						var stock = document.getElementById('stock.'+codigo);
						if(stock.value < 1){
							avisoSinStock += codigo + ", ";
							productosAgregadosSinStock[contSinStock] = new productVo(codigo,f.elements[i],true);
							contSinStock++;
						} else {
							productosAgregados[cont] = new productVo(codigo,f.elements[i],true);
							cont++;
						}
						
						
					}
				}
			}	
			if(avisoSinStock != ""){
				avisoSinStock = avisoSinStock.substring(0, avisoSinStock.length - 2);				
				
				
					BootstrapDialog.confirm("Para artigos "+ avisoSinStock +" não temos stock"+", adicione o carro que você procura?", function(result) {
						if (result){
							productosAgregados.push.apply(productosAgregados, productosAgregadosSinStock);
							aniadirMultiplesAjax(productosAgregados);
						} else {
							return;
						}	
						
					});					
					
			}	else {				
			aniadirMultiplesAjax(productosAgregados);
			}
	}
	
	function validarSincrono(f,favoritos) {
		var productosAgregados = new Array();
		var productosAgregadosSinStock = new Array();
		var cont = 0;
		var contSinStock = 0;
		var avisoSinStock = "";
		
		for (i=0;i < f.elements.length;i++) {
			if (f.elements[i].type=='text') {
				if (f.elements[i].value.length == 0 || !isNumeric(f.elements[i].value) || f.elements[i].value<0 ) {
					f.elements[i].focus();
					BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
					return;				
				}
				else {
					if (favoritos != undefined && favoritos != true) {
						var cod = f.elements[i].name;
						cod = cod.substring(cod.indexOf("_")+1);
						
						//Creamos input de num para favoritos con . (en favoritos viene con _ para que no se dupliquen)
					    var input = document.createElement("input");
					    input.setAttribute("type", "hidden");
					    input.setAttribute("name", "num."+cod);
					    input.setAttribute("id", "num."+cod);
					    input.setAttribute("value", "0");
					    f.appendChild(input);
					}    
				}
				
				if (favoritos == true && f.elements[i].name != null 
						&& !isNumeric(f.elements[i].name.substring(f.elements[i].name.indexOf(".")+1))) {
					var codigo = f.elements[i].id;
					codigo = codigo.substring(codigo.indexOf(".")+1);
					var stock = document.getElementById('stock.'+codigo);
					if(stock.value < 1){
						avisoSinStock += codigo + ", ";
						productosAgregadosSinStock[contSinStock] = new productVo(codigo,f.elements[i],true);
						contSinStock++;
					} else {
						productosAgregados[cont] = new productVo(codigo,f.elements[i],true);
						cont++;
					}
				} else if (favoritos != true){				
					if(isNumeric(f.elements[i].value) && f.elements[i].value > 0 ){ //Es numerico y mayor que 0 asi que se añadirá al carro.
						var codigo = f.elements[i].name;
						if (isNumeric(codigo.substring(codigo.indexOf(".")+1)) || isNumeric(codigo.substring(codigo.indexOf("_")+1))) {
							if (favoritos == undefined) {
								codigo = codigo.substring(codigo.indexOf(".")+1);
							} else {
								codigo = codigo.substring(codigo.indexOf("_")+1);
								input.setAttribute("value", document.getElementById('num_'+codigo).value);
								f.appendChild(input);
							}	
							
							var stock = document.getElementById('stock.'+codigo);
							if(stock.value < 1){
								avisoSinStock += codigo + ", ";
								productosAgregadosSinStock[contSinStock] = new productVo(codigo,f.elements[i],true);
								contSinStock++;
							} else {
								productosAgregados[cont] = new productVo(codigo,f.elements[i],true);
								cont++;
							}	
						}					
					}
				}
			}
		}	
		if(avisoSinStock != ""){
			avisoSinStock = avisoSinStock.substring(0, avisoSinStock.length - 2);				
			
				BootstrapDialog.confirm("Para artigos "+ avisoSinStock +" não temos stock"+", adicione o carro que você procura?", function(result) {
					if (result){
						productosAgregados.push.apply(productosAgregados, productosAgregadosSinStock);
						aniadirMultiplesAjaxAsincrono(productosAgregados);	
					} else{
						return;
					}					
				});
				
		}					
		aniadirMultiplesAjaxAsincrono(productosAgregados);
											
		
		document.location = 'PStores?s=7788&o=viewCart_b2c&p=1';
						
		
	} 
	
	 function productVo(codigo,numero,disponible) {
		    this.codigo = codigo;
		    this.numero = numero;
		    this.disponible = disponible;
	 }
	 
	 function aniadirMultiplesAjaxAsincrono(productosAgregados) {
			//alert("codigo:"+codigo+", num:"+num.value+",disponible:"+disponible);
			//TODO Hacemos una llamada ajax para ver la disponibilidad del producto
			var i = 0;
			var paramProductos = "";
			var N = productosAgregados.length;
			if (N > 0) {
				while(i < N) {
					codigo = productosAgregados[i].codigo;
					num = productosAgregados[i].numero;
					paramProductos = paramProductos + "&cod."+codigo+"=A&num."+codigo+"="+num.value; 
					i++;
					cartCheck(num,'#listadoProductos #cart'+codigo);
				}	
				$.ajax({async:false, type:"GET",url:'PStores?s=7788&o=updtCart_b2c&p=6'+ paramProductos +'&t=a',success: function(data) {		
					var res = true;
					var dataCart = $.parseJSON(data);
					//if(dataCart.ok != "" && $.trim(dataCart.ok.toLowerCase()) == "false"){
					if(dataCart.length > 0){
						res = false;
						N = dataCart.length;
					}
					
					i = 0;
					while (i < N) {
						/*alert("quantities: (cod:"+dataCart.quantities[0].cod+", quantity:"+dataCart.quantities[0].quantity+")");*/
						$(".numProductosCarro").html(dataCart[i].numTotalProductsCart);	
						$(".importeCarro").html(dataCart[i].totalCart.toString().replace(".",",") + " &euro;");
						$(".cartCantidadCarro"+dataCart[i].cod).html(dataCart[i].quantity);
						
							$("#cart"+dataCart[i].cod).addClass("cart-select");
										
						i++;
					}
					
					$("#importeCarro").html(dataCart[0].totalCart.toString().replace(".",",") + " &euro;");
					$("#numProductosCarro").html(dataCart.numTotalProductsCart);
					$.get(__cs+"?o=updtcart&p=1&t=r", function() {});	
				}});
				if (N >= 1) $(".cartMultiples-tooltip-panel-inner").fadeIn(800).fadeOut(2000);
				
				// window.location = 'PStores?s=2&o=viewCart_b2c&p=1';
			}
				
	 } 
	 
	 function aniadirMultiplesAjax(productosAgregados) {
			//alert("codigo:"+codigo+", num:"+num.value+",disponible:"+disponible);
			//TODO Hacemos una llamada ajax para ver la disponibilidad del producto
			var i = 0;
			var paramProductos = "";
			var N = productosAgregados.length;
			while(i < N) {
				codigo = productosAgregados[i].codigo;
				num = productosAgregados[i].numero;
				paramProductos = paramProductos + "&cod."+codigo+"=A&num."+codigo+"="+num.value; 
				i++;
				cartCheck(num,'#listadoProductos #cart'+codigo);
			}	
			
			$.get('PStores?s=7788' + "&o=updtCart_b2c&p=6"+paramProductos+"&t=a", function(data) {
				$.get(__cs+"?o=updtcart&p=6&t=r");
				var res = true;
				var dataCart = $.parseJSON(data);
				//if(dataCart.ok != "" && $.trim(dataCart.ok.toLowerCase()) == "false"){
				if(dataCart.length > 0){
					res = false;
				}
				
				i = 0;
				while (i < N) {
					/*alert("quantities: (cod:"+dataCart.quantities[0].cod+", quantity:"+dataCart.quantities[0].quantity+")");*/
					$(".numProductosCarro").html(dataCart[i].numTotalProductsCart);	
					$(".importeCarro").html(dataCart[i].totalCart.toString().replace(".",",") + " &euro;");
					$(".cartCantidadCarro"+dataCart[i].cod).html(dataCart[i].quantity);
					
						$("#cart"+dataCart[i].cod).addClass("cart-select");
					
					
					//Evento GA4
					addToCartB2CGtag(dataCart[i].cod, dataCart[i].reference, dataCart[i].quantity, dataCart[i].priceWithoutTax);
					//Evento FBP
					addToCartB2CFbq(codigo, dataCart[0].reference, num, dataCart[0].priceWithoutTax);
						
					i++;
				}
			});
			if (N >= 1) $(".cartMultiples-tooltip-panel-inner").fadeIn(800).fadeOut(2000);
				
	}
	 
	//PEDIDO RÁPIDO
	//Comprobación de la tecla pulsada.
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
	
	function submitEnterCarro(evento,f){
	   var key;
	   if (evento.keyCode){
	       key = evento.keyCode;
	   }else if (evento.which){
	       key = evento.which;
	   }else {
	       return false;
		 }
	   if (key == 13) {aniadirACarro(f);}
	   return true;
	}
	
	function introducirCodigoProducto(event,field) {
		if (isEnter(event)) {
			field.focus();
		}
	}

	//EFECTOS PARA MOSTRAR EL CARRO
	
	function confirmarBorrado(i, ref, cant, precioSinTax) {
	
		BootstrapDialog.confirm("Está certo de que pretende eliminar este produto do carrinho?", function(result) {
			if (result){
				document.location='PStores?s=7788&o=updtCart_b2c&p=1&t=a&cod.'+i+'=U&num.'+i+'=0';	
				//Evento GA4
				removeFromCartB2CGtag(i, ref, cant, precioSinTax);	
			} 
			
		});		
	}
	
	//Funcion que actualiza el contenido del carro.
	function updateCartContent(){	
		$.get("jsp/b2c/registered/ajxCartB2CDataContent.jsp")
			.success(function (data){			
				$('#carroFlotante').html(data);
			});
	}
	
	//Funcion que actualiza el contenido del carro.
	function updateCartModalContent(){	
		$.get("jsp/b2c/registered/ajxCartB2CModalDataContent.jsp")
			.success(function (data){			
				$("#modalCarrito .modal-body").html(data);
			});
	}
	
	$(document).ready(function() {
		//Hover sobre el botón para desplegar el carro.
		 $('.botonDesplegable').hover(
			function(e){
				//Se borra el time que cierra el carro.
				try{clearTimeout(out_intent_carro);}catch(e){};
				
				if ($("#carroFlotante").is(":hidden")){ //Si está oculto hace por recargar los datos y mostrarlo.
					hover_intent_carro = setTimeout( 
						function(){ 
							$('#carroFlotante').html('<div style="text-align: center; padding:15px;"><img src="images/procesing.gif"/></div>');
							$('#carroFlotante').slideDown('fast', 
								function() {
// 									alert('Desplegando');
									updateCartContent();
								}
							); 
						} , 300 );
				}
			},
			function(e){
				//Se borra el contador que mostraría el carro.
				try{clearTimeout(hover_intent_carro);}catch(e){}; 
				//$('#carroFlotante').slideUp('fast');			
				
				//Se inicia el cerrado del carro.
				out_intent_carro = setTimeout( 
						function(){ 						
							$('#carroFlotante').slideUp('fast'); 
				} ,600 );			
			}
		);
		//Hover sobre el botón para desplegar el carro.
		 $('#carroFlotante').hover(
			function(e){
				//Se borra el time que cierra el carro.
				try{clearTimeout(out_intent_carro);}catch(e){};
			},
			function(e){			
				//$('#carroFlotante').slideUp('fast');	
				//Se inicia el cerrado del carro.
				out_intent_carro = setTimeout( 
						function(){ 						
							$('#carroFlotante').slideUp('fast'); 
				} ,100 );
			}
		);
				
	});	
	//FIN EFECTOS PARA MOSTRAR EL CARRO
	
// 	$(document).ready(parpadear);
// 		function parpadear(){ $('#ProdHabituales').fadeIn(250).delay(250).fadeOut(250, parpadear); }

function checkPoliticaPrivacidad(){
	if($("#politicaPrivacidad").is(':checked')) {
		return true;
	}else{
		BootstrapDialog.alert("Deve aceitar a política de privacidade assinalando o campo previamente.", function(){});		
		return false;
	}
}

function validarContactoPie() {

	grecaptcha.ready(function() {
	        grecaptcha.execute('6LepBMUhAAAAAO284LzPi4oPyvJ1BhsNtbSW8a6G', {
	            action: 'submit'
	        }).then(function(token){
	            // Limpiar la entrada del usuario de caracteres innecesarios
				var f = document.getElementById('formContacta');
				f.name.value = clearName(f.name.value).trim();
				f.body.value = clearComment(f.body.value).trim();
				f.fromEmail.value = f.fromEmail.value.trim();
				f.token.value = token;
				var validarCampos = true;
			
				// Ningún campo debe ser vacío
				if (!obligatorioExiste(document.forms['formContacta'].name, "O campo nome é obrigatório.") ||
						!obligatorioExiste(document.forms['formContacta'].fromEmail, "O campo email é obrigatório.") ||
						!obligatorioExiste(document.forms['formContacta'].body, "O campo corpo é obrigatório.")) {
					validarCampos = false;
				}
			
				// Se valida el formato de la dirección de correo
				if (!emailCheck(document.forms['formContacta'].fromEmail.value)) {
					BootstrapDialog.alert("O correio electrónico não é correcto, volte a introduzi-lo.", function(){});
					validarCampos = false;
				}
				
				if(checkPoliticaPrivacidad() && validarCampos){
					f.submit();
				}
	            
	        });
	    });

}

	function checkCarroAjaxCompleteFunctionNoValid(codigo, num, update, disponible, rnd, fechaEntrada, cantidadRepo, urlwhenComplete, __param_o, __param_url){
	
		if (!isNaN(codigo) && isNumeric(num) && codigo!=0 && num >= 0) {			
			if ( !disponible) {
				
					if (fechaEntrada == '') {						
								$.get(urlwhenComplete).complete(function() { 								
									addCarroAjax(codigo,num,true,0,fechaEntrada,cantidadRepo, false);									
								});																
					} else {
						if(cantidadRepo != null && isNumeric(cantidadRepo) && cantidadRepo>0){
							
								  $.get(urlwhenComplete).complete(function() { 		
									addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, false);									
								  });												
						}else{
							
								 $.get(urlwhenComplete).complete(function() { 		
									addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, false);									
							});		
					}	
				}
				 	
										
			}else{
				$.get(urlwhenComplete).complete(function() { 		
					addCarroAjax(codigo, num, disponible, rnd, fechaEntrada, cantidadRepo, false);					
				});	
			}	
		}
		if (update){			
			window.location.href="PStores?s=7788&o=viewCart_b2c&p=1";														
		}
	}
	
	/**
	* Muestra una alerta indicando a los clientes que se deben conectar
	*/
	function consultarPrix() {
			BootstrapDialog.show({
            size: BootstrapDialog.INFORMATION,
            message: 'Conectese para consultar el precio',
            buttons: [{
                label: 'Aceitar',
                cssClass: 'btn-primary',
                action: function(){
                    window.location.href="PStores?s=7788&o=login_b2c&p=1";
                }
            }, {
                label: 'Cancelar',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }]
        });
	}
	
	/**
	*	Valida los productos de la lista y actualiza
	*	el carro de compra. Si consigue productos sin
	*	stock, confirma si quiere que se añadan o 
	*	continuar sin estos.
	*
	*	Ojo!!  incidencias con productos propios y config. de mostrar stock en listas escolares.
	*/
	function validarSincronoAlternate(f,favoritos) {	// Ojo!!  incidencias con productos propios y config. de mostrar stock en listas escolares
		var productosAgregados = new Array();
		var productosAgregadosSinStock = new Array();
		var cont = 0;
		var contSinStock = 0;
		var avisoSinStock = "";
		
		for (i=0;i < f.elements.length;i++) {
			if (f.elements[i].type=='text') {
				if (f.elements[i].value.length == 0 || !isNumeric(f.elements[i].value) || f.elements[i].value<0 ) {
					f.elements[i].focus();
					BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
					return;				
				}
				else {
					if (favoritos != undefined && favoritos != true) {
						var cod = f.elements[i].name;
						cod = cod.substring(cod.indexOf("_")+1);
						
						//Creamos input de num para favoritos con . (en favoritos viene con _ para que no se dupliquen)
					    var input = document.createElement("input");
					    input.setAttribute("type", "hidden");
					    input.setAttribute("name", "num."+cod);
					    input.setAttribute("id", "num."+cod);
					    input.setAttribute("value", "0");
					    f.appendChild(input);
					}    
				}
				
				if (favoritos == true && f.elements[i].name != null 
						&& !isNumeric(f.elements[i].name.substring(f.elements[i].name.indexOf(".")+1))) {
					var codigo = f.elements[i].id;
					codigo = codigo.substring(codigo.indexOf(".")+1);
					var stock = document.getElementById('stock.'+codigo);
					if(stock.value < 1){
						avisoSinStock += codigo + ", ";
						productosAgregadosSinStock[contSinStock] = new productVo(codigo,f.elements[i],true);
						contSinStock++;
					} else {
						productosAgregados[cont] = new productVo(codigo,f.elements[i],true);
						cont++;
					}
				} else if (favoritos != true){				
					if(isNumeric(f.elements[i].value) && f.elements[i].value > 0 && f.elements[i].disabled==false ){ //Es numerico y mayor que 0 asi que se añadirá al carro.
						var codigo = f.elements[i].name;
						if (isNumeric(codigo.substring(codigo.indexOf(".")+1)) || isNumeric(codigo.substring(codigo.indexOf("_")+1))) {
							if (favoritos == undefined) {
								codigo = codigo.substring(codigo.indexOf(".")+1);
							} else {
								codigo = codigo.substring(codigo.indexOf("_")+1);
								input.setAttribute("value", document.getElementById('num_'+codigo).value);
								f.appendChild(input);
							}	
							
							var stock = document.getElementById('stock.'+codigo);
							if(stock.value < 1){
								avisoSinStock += codigo + ", ";
								productosAgregadosSinStock[contSinStock] = new productVo(codigo,f.elements[i],true);
								contSinStock++;
							} else {
								productosAgregados[cont] = new productVo(codigo,f.elements[i],true);
								cont++;
							}	
						}					
					}
				}
			}
		}	
		if(avisoSinStock != ""){
			avisoSinStock = avisoSinStock.substring(0, avisoSinStock.length - 2);				
			
				
				BootstrapDialog.confirm({
					message: "Para artigos "+ avisoSinStock +" não temos stock"+", adicione o carro que você procura?",
					closable: false,
					btnCancelLabel: "Continuar apenas com os disponíveis",
					btnOKLabel: "Adicionar ao carro",
					callback: function(result) {
								if (result)
									productosAgregados.push.apply(productosAgregados, productosAgregadosSinStock);
								aniadirMultiplesAjaxAsincrono(productosAgregados);
								document.location = 'PStores?s=7788&o=viewCart_b2c&p=1';
								}
				});
				
		}else{
			aniadirMultiplesAjaxAsincrono(productosAgregados);
			document.location = 'PStores?s=7788&o=viewCart_b2c&p=1&sc=true';
		}
	} 
	
	/*
	*	SAF - Comprueba si un determinado comprador dispone de crédito suficiente para realizar la compra
	*/
	function compruebaCreditoComprador(){
		var res = true;
		$.ajaxSetup({async: false});
		$.get("jsp/b2c/registered/ajxCompruebaCreditoComprador.jsp?&t=a", function(data) {
				var data = $.parseJSON(data);
				if (data.ok != "" && $.trim(data.ok.toLowerCase()) == "false") {
					res = false;
				}
			})
		$.ajaxSetup({async: true});
		return res;	
	}
	
	/*
	*   Función que devuelve la cantidad de productos que ya hay añadida en el carro
	*/
	function compruebaCantidadCarro(codigo, num, stock){
		var res = true;
		$.ajaxSetup({async: false});
		$.ajax({
				type : "GET",
				//async : false,
				timeout: 20000,
				data: {producto: codigo, cantidad: num, istock: stock},
				url : "jsp/b2c/registered/ajxCompruebaCantidadCarro.jsp",
				success : function(data) {					
					var dataResult = $.parseJSON(data);
					if (dataResult.result != "") {
						res = dataResult.result;					
					}
				},
				error : function(data) {}
			});	
		$.ajaxSetup({async: true});
		return res;	
	}
	
	/* Configura el tamaño del lado izquierdo del div categorias (responsive) */
	function openNav() {
	    document.getElementById("categorias").style.width = "360px";
	    document.getElementById("categorias").style.overflow = "auto";
	    document.body.style.overflow = 'hidden';
	}

	/* Configura el tamaño 0 del lado izquierdo del div categorias (responsive) */
	function closeNav() {
	    document.getElementById("categorias").style.width = "0";
	    document.getElementById("categorias").style.overflow = "hidden";
	   	document.body.style.overflow = 'scroll';
	}
	
	/* Fija la barra de navegación cuando se realiza el scroll */
	function fixedNavBar() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky");
	    if (/Mobi/.test(navigator.userAgent)){
	    	/* Elimina sticky cuando llega a la parte superior de la web */
		    if (document.body.scrollTop < 20 || document.documentElement.scrollTop < 20) {
		    	navbar.classList.remove("sticky");
		    }
		    	
		    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		    	 navbar.classList.add("sticky");
		    }
	    }   
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
	
	/*
	* Comprueba el stock y la cantidad de producto seleccionada.
	*
	* f: formulario a validar y enviar
	*/
	function validarCantidadListas(f) {
		var avisoSinStock = "";
		for (i=0; i < f.elements.length; i++) {
			if (f.elements[i].type == 'text' || f.elements[i].type == 'number') {			    
				if (f.elements[i].value.length == 0 || !isNumeric(f.elements[i].value) || f.elements[i].value < 0 ) {
					f.elements[i].focus();
					BootstrapDialog.alert("Deve indicar uma quantidade maior que 0 (zero) ", function(){});
					return;				
				} else {
					if (f.elements[i].disabled == false) {	// entrada habilitada
						var cod = f.elements[i].name;
						cod = cod.substring(cod.indexOf("_") + 1);
						// Creamos input de num con . (viene con _ para que no se dupliquen)
					    var input = document.createElement("input");
					    input.setAttribute("type", "hidden");
					    input.setAttribute("name", "num." + cod);
					    input.setAttribute("id", "num." + cod);
						input.setAttribute("value", "0");
					    f.appendChild(input);
					}
				}

				if (f.elements[i].disabled == false) {
					if(isNumeric(f.elements[i].value) && f.elements[i].value > 0 ){		// Es numérico y mayor que 0, se añadirá al carro
						var cod = f.elements[i].name;
						if (isNumeric(cod.substring(cod.indexOf(".")+1)) || isNumeric(cod.substring(cod.indexOf("_")+1)) || cod.indexOf("_-") != -1) {
							cod = cod.substring(cod.indexOf("_") + 1);
							input.setAttribute("value", document.getElementById('num_' + cod).value);
							f.appendChild(input);
							var stock = document.getElementById('stock.'+cod);
							if(stock.value < 1 && cod.indexOf("_-") > -1){
								avisoSinStock += cod + ", ";
							}
						}
					}
				}
			}
		}
		if (avisoSinStock != "") {
			avisoSinStock = avisoSinStock.substring(0, avisoSinStock.length - 2);
			
				BootstrapDialog.confirm("Para artigos " + avisoSinStock +
						
							" não temos stock"
						
							+ ", adicione o carro que você procura?", function(result) {
					if (result) {
						f.submit();
					} else {
						return;
					}
				});
			
		} else {
			f.submit();
		}
	}	
		
	/*
	* Devuelve el precio que se aplicaría en el carro a un artículo - cantidad
	*
	* cod: código producto
	* valor: cantidad
	*/
	function calcularPrecioProductoCantidad(cod, valor) {
		var precio = 0;
		$.ajaxSetup({async: false});
		$.get("jsp/b2c/ajxProduct3.jsp?codProduct="+cod+"&cantidad="+valor, function(data) {
            if(data != null && data.length > 0){
            	var dataJSON = $.parseJSON(data); 
            	precio = dataJSON.precio;
            }                   
     	});
		$.ajaxSetup({async: true});
	
	 	return precio;
	}
	
	//Busca la equivalencia de un código en la tabla INTXML_REFERENCIAS para un determinado cliente
	function reemplazarCodigoEquivalente(codProduct) {
		var finished, dataReplaced, codEquivalente;
			
		$.ajaxSetup({async: false});
		finished = $.get("jsp/b2c/publi/ajxProductRef.jsp?codProduct=" + codProduct + "&codCliente=" + 19245, function(data){
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
	
	function replaceAll(str, find, replace) {
	  return str.replace(new RegExp(find, 'g'), replace);
	}
	
	//Si el cliente es Hyperburo, reemplaza el código determinado de Hyperburo por el código CLD equivalente 
	function searchFormSend(f){
	
		//Inhabilita etiquetado HTML (inject code)
		f.searchString.value = replaceAll(f.searchString.value, '\\<.*?>', '');
		
		//Evento GA4
		searchB2CGtag(f.searchString.value);
		
		//Evento FBP
		searchB2CFbq(f.searchString.value);
		
		f.submit();	
	}
	
	
	// Countdown
	function getTimeRemaining(endtime) {
	    var aux = new Date(endtime);
	    aux.setHours(23);
	    aux.setMinutes(59);
	    aux.setSeconds(59);
	    const total = Date.parse(aux) - Date.parse(new Date());
	    const seconds = Math.floor((total / 1000) % 60);
	    const minutes = Math.floor((total / 1000 / 60) % 60);
	    const hours =  Math.floor(total / (1000 * 60 * 60));
	    
	    return {
	      total : total,
	      hours : hours,
	      minutes : minutes,
	      seconds : seconds
	    };
	}
	
	function initializeClock(id, endtime, totalCount) {
	    
	    const hoursSpan = $('.hours_'.concat(id));
	    const minutesSpan = $('.minutes_'.concat(id));
	    const secondsSpan = $('.seconds_'.concat(id));
	    
	    const progress = $('#progress_'.concat(id))[0];
	    const progressBar = $('#progressBar_'.concat(id))[0];
	    
	    function updateClock() {
	      const t = getTimeRemaining(endtime);
	    
	      hoursSpan.each(function(){$(this)[0].innerHTML = ('0' + t.hours).slice(-2);})
	      minutesSpan.each(function(){$(this)[0].innerHTML = ('0' + t.minutes).slice(-2);})
	      secondsSpan.each(function(){$(this)[0].innerHTML = ('0' + t.seconds).slice(-2);})
	      
	      if(progress != null && progressBar != null) {
		  var porcetanjeRestante = (100 - (t.total / totalCount)*100).toFixed(2);
		   progress.style.width = porcetanjeRestante < 20 ? 20 + "%" : porcetanjeRestante + "%";
		   progressBar.title =  porcetanjeRestante + "%";
	      }
	      
	      
	      if (t.total <= 0) {
	        clearInterval(timeinterval);
	      }
	    }
	    
	    updateClock();
	    const timeinterval = setInterval(updateClock, 1000);
	}
	
	
//Funcionalidades del resumen de pedido
function printDoneTimeLine(idTimeLineConfirmation) {
	$(idTimeLineConfirmation).html('<i class="fa fa-check"></i>');
	$(idTimeLineConfirmation).next('.tm-text').removeClass('active').addClass('done');
} 
	
// FUNCTIONS	
 function goToStep(step) {
    if (step == 1) {
    	// Este caso no se da ...
    } else if (step == 2) {
    	submitFormularioDireccion();
    } else if (step == 3) {
    	validarFormularioMetodosEnvio();
    } else if (step == 4) {
    	validarFormulario();
    }
}  

function showProducts() {
	$('#rp-divProductos .rp-hide').addClass('rp-show').removeClass('rp-hide');
	$('#rp-divProductos .rp-show-link').hide();
}	

function hideProducts() {
	$('#rp-divProductos .rp-show').addClass('rp-hide').removeClass('rp-show');
	$('#rp-divProductos .rp-show-link').show();
}

function updateCuponesPromocionales(metodo) {
	 	    // Actualiza los códigos promocionales que se muestran al usuario según el método
	 	    // de envío seleccionado
	 	    
	 	    $("#codPromoRegaloDisponible").parent().hide();
	 	    
	 	    var countTodos = $('#codPromoDisponible0 ul li').length;
	 	    var countMetodo = $('#codPromoDisponible' + metodo + ' ul li').length;
	 	    
	 	    if (countTodos > 0 || countMetodo > 0) {
	 	        // Mostrar panel
	 	        $(".divCodPromocional").hide();     	
	 	        if (countTodos > 0) $("#codPromoDisponible0").show();
	 	        if (countMetodo > 0) $("#codPromoDisponible" + metodo).show();
	 	        $("#codPromoDisponible").show();
	 	    } else {
	 	    	// Ocultar panel
	 	    	$(".divCodPromocional").hide();	
	 	    }
	 		
	 	}


function sanitize(s) {
   if (s != null) {
     var str = s.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
     str = str.toLowerCase();
     str = str.replace(/[^0-9a-z ]/gi, '');
     str = str.replace(/\s/g, "-");
     return str;
   } else {
     return "";
   }
}	

//Funciones comumes a los dos tipos de dirección
function showSelect(id, options) {  
    // Borrar el contenido anterior del select
    $('#'+id).empty();
    
    // Añadir el nuevo contenido
    $('#'+id).append($('<option>', {
        value: '',
        text: strSeleccProv
    }));
    for (var i=0; i<options.length; i++) {
        if (options[i].trim().length > 0) {
            $('#'+id).append($('<option>', {                
                  value: options[i].trim(),
                  text: options[i].trim()               
            }));
        }
    }
    
    // Mostrar el select
    $('#'+id).removeClass("hidden");
    $('#'+id).attr("disabled", false); 
    $('#'+id+'_i').addClass("hidden");
    $('#'+id+'_i').attr("disabled", true);  
    $('#'+id+'_i').val(""); 
}

function showInput(id, text) { 
    $('#'+id+'_i').removeClass("hidden");
    $('#'+id+'_i').val(text); 
    $('#'+id+'_i').attr("disabled", false); 
    $('#'+id).addClass("hidden");
    $('#'+id).empty();
    $('#'+id).attr("disabled", true);     
} 	