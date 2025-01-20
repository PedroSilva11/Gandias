

/****************************************/
/******** ELEMENTOS COMUNES *************/
/****************************************/
/*:::::: Fuentes y tamaños para adaptar la familia FuturaNewBook :::::::::: */  
@font-face {
	font-family: FuturaNew;
	src: url("fonts/FuturaNewBook-Reg.eot"); /* IE9 Compat Modes */
  	src: url('fonts/FuturaNewBook-Reg.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
		 url("fonts/FuturaNewBook-Reg.otf") format("opentype");
}

/*:::::: Fuentes y tamaños para adaptar la familia Barlow Condensed en páginas con contenedora y sin contenedora :::::::::: */  
<!-- @font-face { -->
<!-- 	font-family: 'Barlow Condensed'; -->
<!-- 	src: url("fonts/BarlowCondensed/Barlow Condensed Regular 400.ttf"); -->
<!-- } -->

@font-face {
	font-family: 'Poppins';
	src: url("fonts/Poppins/Poppins-Regular.ttf");
}

<!-- @font-face { -->
<!-- 	font-family: 'Lato'; -->
<!-- 	src: url("fonts/Lato/Lato/Lato-Regular.ttf"); -->
<!-- } -->

<!-- @font-face { -->
<!-- 	font-family: 'PT_Sans'; -->
<!-- 	src: url("fonts/PT_Sans/PTSans-Regular.ttf"); -->
<!-- } -->

<!-- @font-face { -->
<!-- 	font-family: 'Nunito'; -->
<!-- 	src: url("fonts/Nunito/static/Nunito-Regular.ttf"); -->
<!-- } -->

<!-- @font-face { -->
<!-- 	font-family: 'Urbanist'; -->
<!-- 	src: url("fonts/Urbanist/static/Urbanist-Regular.ttf"); -->
<!-- } -->

/*::::::::::::: Tipos de Textos :::::::::::::::: */
.texto-spell-enlace {
	color: #1a0dab !important;
}

.texto-spell-enlace:hover {
	text-decoration: underline !important;
}

.texto-negrita {
	font-size: 15px;
	font-weight: bold;
}

.aviso1 {
	font-weight:bold;
}

.texto-normal {
	font-size: 15px;
}

.texto-pequeno {
	font-size: 13px;
}

.textoSugeridoPorBaja {
	font-size: 18px !important;
}

.textoDestacado, .textoDestacado a, .textoDestacado a:link {
	font-weight: bold;
	color: #aa0306;
}

.textoDestacado1, .textoDestacado1 a, .textoDestacado1 a.link {
	font-weight: bold;
	font-size: 11px;
	background-color: #FFF;
	color: #000;
}

.textoDestacado2 {
	font-weight: bold;
	font-size: 11px;
	color: #D34C09;
}

.textoDestacado1 a:hover {
	text-decoration:none;
}

.highlight {
    font-weight: bold;
    color: #000!important;
}

.highlight em {
	color: #db3600;
    font-size: initial;
}

span.stockDisp{
	font-weight: bold;
	color: #538917;
}

span.stockNoDisp{
	font-weight: bold;
	color: #FF0000;
}

span.infoText {
	color:gray;
	font-style:italic;
	font-size: 11px;
}

/*::::::::::::: Títulos :::::::::::::::: */
.textoSubtitular, .textoSubtitular a, .textoSubtitular a:visited {

	font-size: 14px;
	text-align: left;
	font-weight: bold;
	background-color: #FFFFFF;
	text-decoration:none;
}

.textoSubtitular a:hover {
	text-decoration:none;
}

.textoSubcategoria,.textoSubcategoria a, .textoSubcategoria a:hover {

	font-size: 19px;
	font-weight: bold;
	text-align: left;
	background-color: #FFFFFF;
	text-decoration:none;
	text-transform: uppercase;
}

.textoSubcategoriaEscolar {
	font-family: Tahoma, Verdana, "MS Sans Serif";
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	background-color: #FFFFFF;
	text-decoration:none!important;
	text-transform: uppercase;
}	

.fondoSubCategoria {
	background-position: left bottom; 
	background-repeat: repeat-x; 
}

.fondotextoSubtitular{
	background-image: url(../../images/lh_textoSubtitular.gif); 
	background-position: left bottom; 
	background-repeat: repeat-x; 
	padding-left: 0px;
	text-transform: uppercase;
	clear:both;
}

/*::::::::::::: Enlaces :::::::::::::::: */
.enlace-underline {
	text-decoration: underline;
}

a {
    color: #000000;
    text-decoration: none;
}

a:hover {
    color: #000000;
    text-decoration: none;
}

.enlaceBlanco, a:hover.enlaceBlanco, a:visited.enlaceBlanco {
	color: #FFFFFF;
	text-decoration: none;
}

.cursor {
	cursor:pointer;
}

/*::::::::::::: Botones :::::::::::::::: */
#aniadirMult.boton {
	font-size: 13px !important;
	color: #fff;
	border-radius: 0px;
	text-transform: uppercase;
	font-weight: bold;
	cursor: pointer;
	box-shadow: none!important;
}

.boton {
	color: #FFFFFF;
	border: 0 !important;
}

.btn {
	border-radius: 0!important;
}

#divBoton span {
	color: #FFFFFF;
	font-size: 16px;
	line-height: 40px;
}

.marginButton {
	margin-top: 20px
}

.addcart {
	color: #FFF!important;
	width: 157px;
	font-weight: bold;
}

button.dt-button, div.dt-button, a.dt-button {
    position: relative;
    display: inline-block;
    box-sizing: border-box;
    margin-right: 0.333em;
    margin-bottom: 0.333em;
    padding: 0.5em 1em;
    border: 1px solid #999;
    border-radius: 5px;
    cursor: pointer;
    font-size: 11px;
    font-weight: bold;
    line-height: 1.6em;
    color: black;
    white-space: nowrap;
    overflow: hidden;
    background-color: #e9e9e9;
    background-image: -webkit-linear-gradient(top, white 0%, #e9e9e9 100%);
    background-image: -moz-linear-gradient(top, white 0%, #e9e9e9 100%);
    background-image: -ms-linear-gradient(top, white 0%, #e9e9e9 100%);
    background-image: -o-linear-gradient(top, white 0%, #e9e9e9 100%);
    background-image: linear-gradient(to bottom, white 0%, #e9e9e9 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,StartColorStr='white', EndColorStr='#e9e9e9');
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    text-decoration: none;
    outline: none;
}

.leftNavButton {
	display:inline-block;
	float:left;
	padding:1em;
}
.rightNavButton {
	display:inline-block;
	float:right;
	padding:1em;
}

.btn-img[value=Ampliar], .btn-img[value=Agrandir]{
	background:transparent url(../../images/lupa.png) center center no-repeat;
	text-indent:9999999px;
	overflow:hidden;
	width:30px;
	border:0!important;
	height:30px;
}

 button.slideLeft {
  font-size: 15px;
  background: #fd514c;
  color: #fff;
  border: 0.25rem solid #fd514c;
  padding: 7px 80px;
  position: relative;
  z-index: 1;
  overflow: hidden;
  font-weight: bold;
  width: 100%;
  text-transform: uppercase;
}
button.slideLeft:hover {
  color: #fd514c;
}
button.slideLeft::after {
  content: "";
  background: #ecf0f1;
  position: absolute;
  z-index: -1;
  padding: 0.85em 0.75em;
  display: block;
}
button.slideLeft[class^="slide"]::after {
  transition: all 0.35s;
}
button.slideLeft[class^="slide"]:hover::after {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  transition: all 0.35s;
}
button.slide_from_left::after {
  top: 0;
  bottom: 0;
  left: -100%;
  right: 100%;
}

.btn-img[value=Volver], .btn-img[value=Voltar], .btn-img[value=Retour], .buttom{
	overflow: hidden;
	color: #fff!important;
	border: 0!important;
	font-weight: bold;
	border-radius: 0px!important;
	cursor:pointer;
	
			padding: 6px 10px!important;
		
}

/*::::::::::::: Precios :::::::::::::::: */
.priceSpecialStrike {
	font-size: 21px !important;
	text-decoration: line-through;
}

.precioNeto {
	color: #aa0306;
	font-size: 12px!important;
	font-weight:bold;
}

.precioNeto.detail {
	font-size: 18px !important;
	line-height: 16px;
	font-weight: normal;
}

/*::::::::::::: Desglose Precios :::::::::::::::: */
div .desglose{
	width: 35em;
	background-color: #f3f3f3;
    float: right;
    margin: 5px 0px 5px 0px;
}

.desglose div {
    border-bottom: 2px solid #fff;
    padding: 9px 10px;
    font-family: 'PT Sans Caption', sans-serif;
    font-size: 12px;
    color: #000;
}

.desglose div:hover{
    background-color: #e6e6e6;
}

.desglose div table th {
	font-weight: normal;
	text-align: left;
    padding-left: 10px;
}

.desglose div table th img {
	float: right;
}

.desglose div table td {
    text-align:right;
    width: 22%;
}

.desglose div table.sub tr {
	font-size: 13px;
	font-weight: bold;
}

.desglose div table.sub th {
    text-align: left;
    padding-left: 0px;
   	font-weight: bold;
}

.desglose div table.tot tr {
	color:#aa0306;
	font-size: 20px;
	font-weight: bold;
}

.desglose div table.tot tr>th {	
    text-align: left;
    padding-left: 0px;
   	font-weight: bold;
}

/*::::::::::::: Precios Escalado :::::::::::::::: */
.modalEscalado .descuentoCantidad {
	color:#FFFFFF;
	font-size: 16px;
	padding:10px;
	font-weight:bold;
}

.modalEscalado .unidad {
	font-size: 16px;
	line-height: 25px;
}

/*::::::::::::: Tablas :::::::::::::::: */
table {
	width:100%;
}

.tabla1 {
	font-size:13px;
}

.tabla1 th{
	font:inherit;
	text-align: center!important;
}

.tabla1, .misPedidos {
	width:100%;
	margin-top:5px;
	clear:both;
}

.tabla1 td, .misPedidos td {
	padding:2px;
}

.tabla1.tabla3.pedido td {
	text-align:left;
}

.tabla1 td  {
	text-decoration:none;
	font-size:11px;
}

.misPedidos td a {
	color:#000;
	text-decoration:none;	
}

.tabla1 td a:hover, .misPedidos td a:hover {
	text-decoration:none;
}

/*.tabla1 .tr1Par, .misPedidos .lpar {
	background: #e7e7e7;
} */

.tabla1 img.  {
	cursor:pointer;
}

.tabla1 .th1 a{
	color: #fff;
	
}
.tabla1 .th1 th{
	padding:0px;
}

.tabla1 .th1 a:hover{
	text-decoration:none;
}

.navbar .tabla1 {
	color: #000000!important;
	text-align:left!important;
}

.tabla3 th {
	color: #fff;
	font-weight: bold;
	padding: 10px 1px;
	text-align: left;
}

.tabla1 .tr1Par, .tr2Par {
	border-collapse: collapse;
	font-size: 13px;
	
}
.tabla1 .tr1Impar, .tr2Impar {
	background:white  !important;
	border-collapse: collapse;
	font-size: 13px;
}

.tabla1 .tr2Par:hover,.tr2Impar:hover{
	border-collapse: collapse;
}

.tabla1 tr {
	border-collapse: collapse;
    font-size: 13px;
}
.tabla1 .odd{
    background: white;
}
.tabla1 .even{
    background: #f3f3f3;
}

.t3Negrita {
	padding-bottom: 3px;
	margin-bottom: 5px;
	display: block;
	color: #000;
	font-weight:bold;
	font-size:15px;
	margin-top:10px;
}

.tabla2 {
    padding: 10px;
    border-collapse: initial;
}

.tabla2 td {
	vertical-align:top;
	padding:4px;
	font-size:14px;
}
.tabla2 td:FIRST-CHILD {
	width: 25%;
} 

.tabla2 input[type=radio] {
	vertical-align: text-bottom;
	margin-right: 10px;
}

.tabla2 select.medium {
  width:200px;
}

button:hover {
    box-shadow: 0px 4px 10px #5d5d5d ;
    opacity: 0.9;
}
input[type=button]:hover {
    box-shadow: 0px 4px 10px #5d5d5d ;
    opacity: 0.9;
}


/* Mensajes de aviso para los créditos */
.tabla2 .fp-aviso {
    color: #e13418;
    font-size: larger;
}

.subcat{
	padding-right: 20px;
}

.subcat2{
	padding-right: 10px;
	padding-left: 10px;
}

tr.subcat.th1 {
	font-size:14px;
}

tr.subcat th {
	text-align: center!important;
}

.tbFormFiltrar {
    border: none 1px #CCC;
	border-collapse: collapse;
    color: #666;
    font-size: 12px;
    font-family: Tahoma,Verdana,Arial;
    table-layout: auto;
    text-align: center;
}

.tbFormFiltrar td {
	padding: 0.5em;
	text-align: left;
}

/*::::::::::::: Div Alineación :::::::::::::::: */
div.izquierda {
	float:left;
	width:50%;	
}

div.derecha {
	float:right;
	text-align:right;
	width:50%;
}

/*::::::::::::: Span Tamaños :::::::::::::::: */
span.smaller {
	font-size: 14px;		
	line-height: 25px;
	font-weight: 600;		
	display: block;
	float: left;
	color: #840000;
}

span.toosmaller {
	font-size: 11px;		
	line-height: 25px;
	font-weight: 600;		
	display: block;
	float: left;
	color: #840000;
}

span.smallest {
	font-size: 9px;		
	line-height: 27px;		
	display: block;
	float: left;
	color: #840000;
	padding-left: 5px;
}

span.larger {
	line-height: 19px;
	font-size: 27px;		
	font-weight: 600;					
	display: block;
	float: left;
	color: #840000;		
}

/*::::::::::::: Radio :::::::::::::::: */
.radio-cinco {
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

/*::::::::::::: Select :::::::::::::::: */
select:disabled {	/* Al deshabilitar los select, que aparezcan en gris igual que los input */
   background: #ebebe4!important;
}

/*::::::::::::: Etiquetas :::::::::::::::: */
.etiqueta {
    padding: 8px 10px;
	font:inherit;
    color:#FFF;
    font-size:15px;
    font-weight:bold;
}

/*::::::::::::: Iconos de novedad, oferta, outlet, regalo, promocion, :::::::::::::::: */
/*::::::::::::: minipicking, info para carrusel de inicio y vista cuadricula ::::::::: */ 
span.iconos {
	display:inline-block;
	background: url(../../images/b2c/sprite_iconos_pt.png) no-repeat 0 0; }

div.iconos {
	display:inline-block;
	background: url(../../images/b2c/sprite_iconos_pt.png) no-repeat 0 0; 
}

.iconos.regalo {
	background-position: 0 0;
	width:24px;
	height:24px;
}

.iconos.promo {
	background-position: -24px 0;
	width:24px;
	height:24px;
}

.iconos.novedad {
	background-position: -48px 0;
	width:24px;
	height:24px;
}

.iconos.oferta {
	background-position: -72px 0;
	width:24px;
	height:24px;
}

.iconos.outlet {
	background-position: -96px 0;
	width:48px;
	height:24px;
}

.iconos.outletmini {
	background-position: -144px 0;
	width:24px;
	height:24px;
}

.iconos.lideroffice {
	background-position: -168px 0;
	width:24px;
	height:24px;
}

.iconos.cajaNoNumero {
	background-position: -192px 0;
	width:24px;
	height:24px;
}

.iconos.scale {
	background-position: -216px 0;
	width:24px;
	height:18px;
}

.iconos.info {
	background-position: -240px 0;
	width:18px;
	height:18px;
}

.iconos.umv {
    background-position: -258px -0px;
    width: 23px;
    height: 24px;
}

.iconos.promoEspecial {
	background-position: -282px 0;
	width:24px;
	height:24px;
}

span.infoMinipicking {
	color:gray;
	font-style:italic;
}

/*::::::::::::: Tooltip :::::::::::::::: */
/** Añadir al carro **/
<!-- .cart-tooltip-panel-inner {
	position: absolute !important;
	display: none;
	width: 250px;
	padding: 12px; 
	color: #000;
	background-color: #FFFFFF;
	font-weight: bold; 
	text-align: left;
	position: relative;
	top: 15px;
	z-index: 1;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	text-align: justify;
	font-size: 12px;
	font-family: FuturaNew;
	font-size: 12px!important;
} -->

/*:::::::::::::: Modal footer :::::::::::::::::: */
.modal-dialog .modal-footer {
  margin-top: 30px
}

@media (max-width: 440px) {
	.modal-dialog .modal-footer {
	  margin-top: 70px;
	}
}

/******************************************************/
/************* VECTORES *******************************/
/******************************************************/
/*::::::::::::: Transformación de la imagen a vectorial :::::::::::::::: */
.trsvg {
	visibility: hidden;
}	

/*::::::::::::: Categorias :::::::::::::::: */
@font-face {
  font-family: 'categorias';
  src:  url('fonts/categorias.eot?mhruvo');
  src:  url('fonts/categorias.eot?mhruvo#iefix') format('embedded-opentype'),
    url('fonts/categorias.ttf?mhruvo') format('truetype'),
    url('fonts/categorias.woff?mhruvo') format('woff'),
    url('fonts/categorias.svg?mhruvo#categorias') format('svg');
  font-weight: normal;
  font-style: normal;
}

[class^="cat_"], [class*=" cat_"] {
  /* use !important to prevent issues with browser extensions that change fonts */
  font-family: 'categorias' !important;
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;

  /* Better Font Rendering =========== */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.cat_22:before {
  content: "\e901";
}
.cat_otros:before {
  content: "\e900";
}
.cat_otros2:before {
  content: "\e905";
}
.cat_1:before {
  content: "\e90e";
}
.cat_3:before {
  content: "\e90f";
}
.cat_4:before {
  content: "\e910";
}
.cat_5:before {
  content: "\e911";
}
.cat_6:before {
  content: "\e912";
}
.cat_7:before {
  content: "\e913";
}
.cat_8:before {
  content: "\e914";
}
.cat_10:before {
  content: "\e915";
}
.cat_11:before {
  content: "\e916";
}
.cat_12:before {
  content: "\e917";
}
.cat_13:before {
  content: "\e918";
}
.cat_14:before {
  content: "\e919";
}
.cat_2:before {
  content: "\e91a";
}
.cat_9:before {
  content: "\e91b";
}
.cat_15:before {
  content: "\e91c";
}
.cat_16:before {
  content: "\e91d";
}
.cat_17:before {
  content: "\e91e";
}
.cat_18:before {
  content: "\e91f";
}
.cat_19:before {
  content: "\e920";
}
.cat_20:before {
  content: "\e921";
}
.cat_21:before {
  content: "\e922";
}
.cat_23:before {
  content: "\e954";
}

/*::::::::::::: Iconos RP :::::::::::::::: */
@font-face {
  font-family: 'iconRP';
  src:  url('fonts/iconRP.eot?d9j3r3');
  src:  url('fonts/iconRP.eot?d9j3r3#iefix') format('embedded-opentype'),
    url('fonts/iconRP.ttf?d9j3r3') format('truetype'),
    url('fonts/iconRP.woff?d9j3r3') format('woff'),
    url('fonts/iconRP.svg?d9j3r3#iconRP') format('svg');
  font-weight: normal;
  font-style: normal;
}

[class^="icon-RP-"], [class*=" icon-RP-"] {
  /* use !important to prevent issues with browser extensions that change fonts */
  font-family: 'iconRP' !important;
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;

  /* Better Font Rendering =========== */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.icon-RP-30:before {
  content: "\e90a";
}
.icon-RP-01:before {
  content: "\e900";
}
.icon-RP-02:before {
  content: "\e901";
}
.icon-RP-03:before {
  content: "\e902";
}
.icon-RP-04:before {
  content: "\e903";
}
.icon-RP-05:before {
  content: "\e904";
}
.icon-RP-06:before {
  content: "\e905";
}
.icon-RP-07:before {
  content: "\e906";
}
.icon-RP-08:before {
  content: "\e907";
}
.icon-RP-09:before {
  content: "\e908";
}
.icon-RP-10:before {
  content: "\e909";
}
.icon-RP-11:before {
  content: "\e90e";
}
.icon-RP-12:before {
  content: "\e90f";
}
.icon-RP-13:before {
  content: "\e910";
}
.icon-RP-14:before {
  content: "\e911";
}
.icon-RP-15:before {
  content: "\e912";
}
.icon-RP-16:before {
  content: "\e916";
}
.icon-RP-17:before {
  content: "\e917";
}
.icon-RP-18:before {
  content: "\e918";
}
.icon-RP-19:before {
  content: "\e919";
}
.icon-RP-20:before {
  content: "\e91a";
}
.icon-RP-21:before {
  content: "\e91b";
}
.icon-RP-22:before {
  content: "\e91d";
}
.icon-RP-23:before {
  content: "\e91f";
}
.icon-RP-24:before {
  content: "\e921";
}
.icon-RP-25:before {
  content: "\e923";
}
.icon-RP-26:before {
  content: "\e925";
}
.icon-RP-27:before {
  content: "\e927";
}
.icon-RP-28:before {
  content: "\e928";
}
.icon-RP-29:before {
  content: "\e929";
}

.icon-contact {
	font-size: 20px;
}

.icon-carroRP {
	font-size: 50px;
}

.icon-carro {
	font-size: 21px!important;
	color: grey;
}

.icon-carro-lista-espera {
	margin-left: 0px!important;
	vertical-align: middle;
}

.icon-carro-contenedora {
	font-size: 20px;
	vertical-align: text-bottom;
}

/*******************************************************/
/************* CONTENEDORA *****************************/
/*******************************************************/

/*::::::::::::: Redes sociales :::::::::::::::: */
div.redes_sociales a {
	color: #000;
	text-decoration:none;
}

div.redes_sociales i {
	margin-left: 5px;
}

div.redes_sociales .fab, div.redes_sociales .fa-brands  {font-size: 36px !important;}

div.redes_sociales .svgRedSocial {
	width: 32px;
	height: 32px;
	margin-left: 5px;
	vertical-align: text-bottom;
	display: inline-block;
}

#footer1Section .svgRedSocial {
	width: 2.5rem;
	height: 2.5rem;
	margin: 0px 0px 0px 10px;
	vertical-align: top;
	display: inline-block;
}

.fa-facebook, .fa-facebook-square {color: #3b5998}
.fa-twitter, .fa-twitter-square {color: #00aced}
.fa-google-plus, .fa-google-plus-square {color: #dd4b39}
.fa-youtube, .fa-youtube-play, .fa-youtube-square {color: #bb0000}
.fa-tumblr, .fa-tumblr-square {color: #32506d}
.fa-vine {color: #00bf8f}
.fa-flickr {color: #ff0084}
.fa-vimeo-square {color: #aad450}
.fa-pinterest, .fa-pinterest-square {color: #cb2027}
.fa-linkedin, .fa-linkedin-square {color: #007bb6}
.fa-instagram {color: #517fa4;}
.fa-spotify {color: #1ED760;}

#redes_sociales a {
	color: transparent;
	text-decoration:none;
}

/*::::::::::::: Alta de clientes :::::::::::::::: */
.alta-reg {
	color: #FFFFFF;
	text-decoration: underline;
	margin-right: 10px;
}

a:hover.alta-reg  {
	color: #FFFFFF;
}

/*::::::::::::: Perfil :::::::::::::: */

#dataC1 .negrita1 {
	background: url(../../images/lineCart.jpg) repeat-x 0 bottom;
	padding-bottom: 3px;
	margin-bottom: 10px;
	display: block;
	color: #000;
	font-weight:bold;
	font-size:13px;
	margin-top:15px;
}

@media screen and (max-width: 767px) {
	#dataC1 input {
		width: 100% !important;
	}
	
	#dataC1 .comparar_input{
		width: 22px !important;
	}
	
	/*Proceso pedido */
	#formDirecciones #dataC1 select{
		width: 100% !important;
	}
	
	#formDirecciones #dataC1 #radioDirFac.radio{
		margin-left: 0px !important;
	}
	
	#formDirecciones #dataC1 #radioDirFac.radio > label{
		width: 50%;
	}
	
	#dataC1 input #botonBuscarEnv{
		margin-bottom: 5px;
		padding: 6px 3px !important;
	}
	
	#formPago #dataC1 #codPromocionalIni,#formPago #dataC1 #canjearCodProm {
	    width: 30% !important;
	}
	
	div .desglose{
		float: left;
		width: 100%;
	}
	
	.addressResp .cart-item #pic {
		padding: 0;
	}
	
	.productHabitualesResp .cart-item #pic {
		padding: 0;
	}
}
	

/*::::::::::::: Logo :::::::::::::::: */

#div_logo {
	width:245px;
	height:81px;
}

/*::::::::::::: Política de devoluciones :::::::::::::::: */
a.pd_tooltip {
	cursor: pointer;
}

a.pd_tooltip div {
	display:none; 
	z-index:1999; 
	position: absolute; 
	top: -285px;
	left: 0;
	right: 0;
	width: 400px; 
	padding: 12px; 
	border: 3px solid #000; 
	background-color: #FFF;
	color: #333333; 
	font-size: 13px; 
	font-weight: normal; 
	text-align: justify;
	margin-left:auto;
	margin-right:auto;
}

@media screen and (max-width: 767px) {
	a.pd_tooltip div {
		left: auto;
		width: auto;
		top: auto;
	}
}

/*::::::::::::: Flecha hacia arriba :::::::::::::::: */

span.arrow_up {
	font-size: 35px;
}

#haciaArriba {
		text-align:center;
		position:fixed;
		bottom:10px;
		right:10px;
		cursor:pointer;
		text-decoration:none;
}

/* Chatra */
#chatra.chatra--pos-right{
 	right: 71px !important;
}



/*::::::::::::: Pedido Rápido :::::::::::::::: */

#quickOrder .modal-header .close{margin-top:0;}
#quickOrder #btnAddCart{margin-top:20px; border:0; border-radius: 0; text-transform:uppercase; color:#fff;}
#quickOrder .modal-dialog{
	
			width:374px;
		
	margin-top:0px;
	top:2px;
	right:0px;
	position:absolute;
}
#quickOrder .modal-title{text-transform:uppercase;}
#quickOrder .modal-dialog .modal-content{border-radius:0; border:0;}
#quickOrder .modal-dialog .modal-content .modal-header{text-align: center;}
#quickOrder .modal-dialog .modal-content .modal-body .info-addProduct{text-align: center; display: block;}
#quickOrder .modal-dialog .modal-content .modal-body .info-addProduct img{width: 42px; height: 42px;}
#quickOrder .modal-dialog .modal-content .modal-body .info-addProduct span{display: block; font-weight: bold;}
#quickOrder .form-addProduct{margin-top:20px;}
#quickOrder .form-addProduct input{border:0; border-radius:0; box-shadow:none; border-bottom:#e9e9e9 2px solid; padding-left:5px;}
#quickOrder .modal-dialog .modal-content .modal-body .last-orders h5{text-transform:uppercase; color:#e96f2b; border-bottom: #dedede 1px solid; padding-top: 25px; padding-bottom: 5px; margin-bottom: 0;}
#quickOrder .modal-dialog .modal-content .modal-body .last-orders .order{display: block; border-bottom: #dedede 1px solid; padding-top: 5px;}
#quickOrder .modal-dialog .modal-content .modal-body .last-orders .order .order-info{width: 50%; display: inline-block;}
#quickOrder .modal-dialog .modal-content .modal-body .last-orders .order .order-info label{font-weight: normal;}
#quickOrder .modal-dialog .modal-content .modal-body .last-orders .order .order-info label:first-letter{text-transform:uppercase;}
.quick-order img { width:19px; height:19px; border:0; vertical-align:text-bottom; }

.modal-header{
	background-color: #fd514c;
}

/*::::::::::::: Cookies :::::::::::::::: */

#divcookie.hide  {
    display:none;
}


button[class^="grow"]::after {
  transition: all 0.3s ease;
}
button[class^="grow"]:hover::after {
  transition: all 0.3s ease-out;
}
button.grow_box::after {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  transform: scale(0, 0);
}
button.grow_box:hover::after {
  transform: scale(1, 1);
}
button.buttoncookie {
  font-size: 20px;
  background: #fd514c;
  color: #fff;
  border: 2px solid white;
  padding: 10px 30px;
  margin: 10px;
  position: relative;
  z-index: 1;
  overflow: hidden;
}
button.buttoncookie:hover {
  color:black;
}
button.buttoncookie::after {
  content: "";
  background: #ecf0f1;
  position: absolute;
  z-index: -1;
  padding: 0.85em 0.75em;
  display: block;
}


/*******************************************************/
/************* CONTENEDORAFILTRO ***********************/
/*******************************************************/


/*::::::::::::: Categorías :::::::::::::::: */


.ver-mas-subcat-trigger,.ver-mas-cat-trigger {
	cursor: pointer;
}

.ver-mas-subtipo-trigger,.ver-mas-tipo-trigger {
	cursor: pointer;
}


/*::::::::::::: Importar Pedido Excel :::::::::::::::: */
div.panelXlsx,p.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: #ddd;
	border: solid 1px #fff;										
}

p.flip{
    background-position: center;
	background-image: url(../../images/b2c/pt_PT/pedido_Excel_gif.gif);
	background-repeat: no-repeat;
	height: 60px;
	margin-bottom: 7px;
}
 
div.panelXlsx {
	widht: 50%;
	height: 100%;
	display: none;
}


/*******************************************************/
/************* CONTENEDORACONTENIDOPROPIO **************/
/*******************************************************/
/*::::::::::::: Mis Productos Favoritos flotante por defecto :::::::::::::::: */ 
#bloqueMisFavoritos{
	position: relative;
    float: left;
    left: 175px;
    margin-bottom: -24px;        
    top: -18px;
}

#botonMisProductosFavoritos {
	position: relative !important;
	left: 0px;
	top: 0px;
	
}

#misProductosFavoritosFlotante {
	display: none;		
    left: -200px;
    position: absolute;
    top: 25px !important;
	width: 780px;
	z-index:9999;
}

#misProductosFavoritosFlotanteContenido {
	overflow:auto;
	max-height: 400px;
	min-height: 200px;
}

#xFavoritesCierre  {
	background-color: #ffffff!important;
}

#xFavoritesCierre span {
	cursor: pointer;
}

/******************************************************/
/************* SEARCHENGINE ***************************/
/******************************************************/

#informacionPVP,  {
	font-weight:bold;
	font-size:12px;
	color: #aa0306;
	margin-top:4px;
}

#txtRefEncontradas {
	font-size:15px;
	margin-top:5px;
	margin-bottom:5px;
	display:block;
}

.ordenActual-no-cursor {
	font-weight: bold;
	color: grey;
	text-align: right;
	margin: 1px;
}

.ordenActual {
	font-size:15px;
	font-weight:bold;
}

.etqComparar {
	cursor:pointer;
}

.cuadriculaEngine{
	left: -29%;
	left: -22%;
}

/******************************************************/
/************* SEARCHENGINECUADRICULA *****************/
/******************************************************/
.featured-items-cuadricula-wrapper .featured-product-cuadricula-codref {
	font-size: 13px;
}

.cuadricula_wrapper {text-align:start; float: none; position: relative; top: auto; right: auto; bottom: auto; left: 0px; margin: 10px 0 0 20px; padding-bottom: 6px; overflow:hidden;}

#featured-items-cuadricula {padding: 0 0 10px 0; text-align: left; float: none; top: 0px; left: 0px; margin: 0px;}
#featured-items-cuadricula .slide {width: 215px; float:left; margin: 10px 10px 10px 10px; /*height: 290px;*/ padding:0 0 0 0; position:relative;background-color:#FFFFFF; border-radius:3px; /*box-shadow: 4px 4px 10px #999;*/}

.featured-items-cuadricula-wrapper .featured-product-cuadricula-image {display: block; margin: 10px auto 10px auto; width:165px; height: 128px; transform: scale(1); opacity: 1; }
.featured-items-cuadricula-wrapper .featured-product-cuadricula-image:hover {display: block; margin: 10px auto 10px auto; width:165px; height: 128px; transform: scale(1.05); opacity: 0.8; }
.featured-items-cuadricula-wrapper .featured-product-cuadricula-codref {font-size: 12px; margin: 15px auto auto auto; padding: 0 0; text-align:left; line-height: 13px; display: block; height:12px; width:175px; overflow:hidden; }
.featured-items-cuadricula-wrapper .featured-product-cuadricula-comparar {font-size: 12px; margin: 5px auto auto auto; padding: 0 0; text-align:left; line-height: 13px; display: block; height:12px; width:175px; overflow:hidden; }
.featured-product-cuadricula-comparar.etqComparar img {vertical-align:top}
.featured-items-cuadricula-wrapper .featured-product-cuadricula-iconos {font-size: 12px; margin: 10px auto auto auto; padding: 0 0; text-align:right; line-height: 12px; display: block; height:/*36px*/25px; width:175px; overflow:hidden; }
.featured-items-cuadricula-wrapper .featured-product-cuadricula-iconos.max {width:207px;}
.featured-items-cuadricula-wrapper .featured-product-cuadricula-descripcion {font-size: 13px; margin: 10px auto 15px auto; padding: 0 0; font-weight:bold; color:grey; text-align:left; line-height: 13px; display: block; height:25px; width:175px; overflow:hidden; }
.featured-items-cuadricula-wrapper .brand-wrapper {padding: 5px 0 3px 0; height: 48px;}
.featured-items-cuadricula-wrapper .featured-product-cuadricula-marca {margin: 0px auto 0px auto; text-align:left; line-height: 13px; display: block; width:175px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;}
.featured-items-cuadricula-wrapper .featured-product-cuadricula-marca > b {text-transform:uppercase; cursor:pointer;}
.featured-items-cuadricula-wrapper .inside .price {margin: 0px auto 10px auto; font-weight:bold; color:#7F1E57; font-size: 30px; right:17px; text-align:left; height:40px; width:175px; padding: 0; display: block; }
.featured-items-cuadricula-wrapper .inside .priceScale {margin: 0px auto 10px auto; font-weight:bold; color:#7F1E57; font-size: 30px; right:17px; text-align:left; height:40px; width:175px; display:block; }
.featured-items-cuadricula-wrapper .inside .priceScale a {font-weight:bold; color:#7F1E57; font-size: 25px; }
.featured-items-cuadricula-wrapper .inside .priceScale .desde {margin: 0px auto 10px auto; font-weight:bold; color:#7F1E57; font-size: 15px; text-align:left; }
.featured-items-cuadricula-wrapper .inside .comprueba {margin: 22px auto 10px auto; font-weight:bold; color:#7F1E57; font-size: 15px; line-height:12px; text-align:left; height:18px; width:175px; display:block; }
.taxes {font-size: 20px;}
@media screen and (max-width:1279px) {
	.taxes {font-size: 10px;}
}
.oldPrice {
    color: #646464;
    font-size: 75%;
    font-weight: bold;
}

.div-segundoPrecio {
    width: 100%;
}

.segundoPrecio {
    font-size: 60% !important;
}

.featured-items-cuadricula-wrapper .featured-product-cuadricula-descripcion {
	color: #000000 !important;
	margin-bottom: 0 !important;
}

.featured-product-cuadricula-iconos span.iconos {
	margin-left:8px;
}

.lineCuadricula {
	height:2px;
	width:100%;
	float:left;
	margin: 5px;
}

/*******************************************************/
/************* VIEWCART ********************************/
/*******************************************************/

.vercarro {
	margin: 5px 0px 40px 0px;
}

#totalCarro {
	clear:both;
	background:#e7e7e7;
	text-align:right;
	
		height:50px;
	
}

#totalCarro .canonTotal { 
	left:10px;
	position:absolute;
	text-align:left;
	font-size:11px;
}

#ordenadoPor {
	float:left;
	font-size:15px;
}

#ordenadoPor #ordenado {
	font-weight:bold;
}

#ordenadoPor a {
	font-size: 15px;
}

a.pd_tooltip div.peligrosidad.viewcart {
	left: 50px;
    top: 255px;
}

/*******************************************************/
/************* ACCPEDIDO *******************************/
/*******************************************************/

/*::::::::::::: Timeline :::::::::::::::: */
.col-xs-1.timeline-state {white-space:nowrap}

.row.timeline {
	margin-left:0px!important;
	margin-right:0px!important;
	line-height: 0;
}

.timeline-line {
	width: 100%;
}

.timeline-line.right {
	background: #B8B8B8;
	height: 1px;
}

.timeline-cart {
	font-size:22px;
	line-height:2;
}	

.timeline-state.future {
	color: #B8B8B8!important;
}

.timeline-state.select {
	font-weight: bold;
}

.timeline-state.enlace {
	cursor: pointer;
}

.timeline-state {
	font-size: 19.5px;
}

.timeline-state-both {
	padding-left: 0px;
}

/*::::::::::::: Importes :::::::::::::::: */
.subtotal {
	font-weight:bold;
	font-size:12px!important;
}

/*::::::::::::: PayPal :::::::::::::::: */
.paypalTop {
	background-color: #002F73;
	color: #f3f3f3;
	margin:3px;
	font-size:20px;
	font-weight:bold;
}

.paypalBody {
	border:1px solid #ccc;
	background-color: #f3f3f3;
	color:#002F73;
	margin:3px;
}

/*::::::::::::: Tpv :::::::::::::::: */
div#modalAbrirTpv{
	padding-left:10px;
	padding-right:10px;
}

div#modalAbrirTpv .payment{
	padding-bottom: 30px;
}

div#modalAbrirTpv .payment .tpv-info{
	display: inline; width: 50%; max-width: 75%;
	padding: 0; font-size: small;
}

div.tpv-info {
	float: right;
	text-align: right;
	padding-top: 5px;
	text-transform: capitalize;
}

/*::::::::::::: Editar Dirección - Paso Intermedio :::::::::::::::: */
.displayAddressUL { /* BEGIN direcciones ul y li */
	list-style-type: none;
	padding-left: 0;
	color: inherit;
	vertical-align: baseline !important;
}

.displayAddressUL .displayAddressLI {
	word-wrap: break-word;
	margin: 0;
}

.displayAddressUL .displayNameLI {
	font-size: large;
	line-height: 22px;
}

/*::::::::::::: Datos de cliente - Paso Final :::::::::::::::: */
.enlacePanel {
	color: #FFFFFF!important;
}

.panel.desplegable {
	margin-bottom: 0px!important;
}

.panel.desplegable .panel-heading {
	padding-top: 1px!important;
	padding-bottom: 1px!important;
	border-top-right-radius: 0px!important;
	border-top-left-radius: 0px!important;
}

/*******************************************************/
/************* LOGIN, REGISTER *************************/
/*******************************************************/

.login-box {
    display: block;
    border-radius: 4px;
    border: 1px #ddd solid;
    background-color: #fff;
}

.login-box label[for=titulo] {
	font-size: 24px;
}

.login-box input[type=text], .login-box input[type=password], .login-box select {
    margin-bottom: 10px;
}

.login-box select.login {
    width: 100%;
    height: 27px;
}

.login-box .login-box-inner {
    border-radius: 4px;
    position: relative;
    padding: 14px 18px;
}

.login-box .buttom, .login-box input, .login-box .login-divider {
	width: 100%;
}

.register3 input, .register3 select {
	margin-top: -8px;
}


	.register3 input, .register3 select {
		margin-top: -8px;
	}


.login-box .login-divider {
	width: 100%;
    text-align: center;
    top: 2px;
    padding-top: 1px;
    margin-bottom: 14px;
    line-height: 2;
    border-bottom: 1px solid grey;
}


.login-new-account {
	background-color: 
	grey!important;	
}

.login-foot {
	height: 44px;
	margin-top: 30px;
	padding: 0px!important;
    background: -webkit-linear-gradient(to bottom,rgba(0,0,0,.14),rgba(0,0,0,.03) 3px,transparent);
    background: linear-gradient(to bottom,rgba(0,0,0,.14),rgba(0,0,0,.03) 3px,transparent);
    z-index: 0;
    zoom: 1;
}	

.login-foot:after {
    display: block;
    width: 100%;
    height: 44px;
    background-color: transparent;
    background: -webkit-linear-gradient(to right,#fff,rgba(255,255,255,0),#fff);
    background: linear-gradient(to right,#fff,rgba(255,255,255,0),#fff);
    z-index: 1;
    content: "";
}

.login-foot .enlace {
	color: #0066c0;
	font-size: 13px;
}

.login-box .dataTables_length label, .login-box .dataTables_filter label {
	margin-bottom: 10px!important;
	text-align: left;
}

.login-box .dataTables_length input, .login-box .dataTables_filter input {
	width: 50%;
	font-family: inherit;
    font-size: 12px;
    line-height: inherit;
    border: 1px solid #CCCCCC;
    color: #666666;
    padding: 3px 5px;
    margin-bottom: 10px;
}

/*::::::::::::: Validation jquery para Registro Completo :::::::::::::::: */

label.required::before {
	content: '*';
	margin-right: 4px;
	color: red;
}
label.error {
	color: red;
	font-size: 0.8em;
	margin-top: -6;
}
input[aria-required=true] {
	border-color: red;
	outline: 0;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(233,102,110,.6);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(233,102,110,.6);
}
input[aria-invalid=false] {
	border-color: grey;
	outline: 0;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(160,160,160,.6);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(160,160,160,.6);
}
select[aria-required=true] {
	border-color: red;
	outline: 0;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(233,102,110,.6);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(233,102,110,.6);
}
select[aria-invalid=false] {
	border-color: grey;
	outline: 0;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(160,160,160,.6);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(160,160,160,.6);
}

/*******************************************************/
/************* CONTACT *********************************/
/*******************************************************/

#formContact div {
	width:100%;	
	float:left;
	margin:10px;
}

#textoCondiciones {
	width: 100% !important;
	padding-right: 15px;
	padding-bottom: 15px;
	padding-top: 15px;
}

#botonContacto {
	background-color: #fd514c;
	color: white;
}

#formContact label {
	width:78px;
	float:left;
	font-weight:bold;
}
#formContact .campoInput {
	width:100%;
	border: 0;
	box-shadow: inset #ccc 0 0 5px;
	border-radius: 0px;
	background: #f5f6f6;
	float:left;
}

@media screen and (max-width: 767px) and (max-aspect-ratio: 13/9) {
	#formContact div {
		width:310px;	
		float:left;
		margin:10px;
	}
	
	#formContact label {
		width:77px;
		float:left;
		font-weight:bold;
	}
	#formContact .campoInput {
		width:230px;
		border: 0;
		box-shadow: inset #ccc 0 0 5px;
		border-radius: 5px;
		background: #f5f6f6;
		float:left;
	}
}

@media screen and (max-width: 767px) and (min-aspect-ratio: 13/9) {
	#formContact .campoInput {
		width:450px;
	}
	
	#formContact div {
		width:530px;
	}
	
	.imagenes_personalizadas .servicio_maximo_horas {
  		top: -12px;
  		left: -310px;
	}
	
	.imagenes_personalizadas .servicio_maximo2_horas {
		top: 6px;
  		left: -364px;
  		font-size: 10px;
	}
	
	.imagenes_personalizadas .portes_gratis {
		top: 36px;
    	left: 200px;
	}
	
	.imagenes_personalizadas .portes_recargo {
		top: 128px;
    	left: 193px;
	}
	
	.imagenes_personalizadas .portes_recargo2 {
		top: 143px;
    	left: 200px;
	}
}


/*#datosContacto {
	clear: both;
}*/

/*******************************************************/
/************* PRODUCT *********************************/
/*******************************************************/

.pathCatego {
	font-size:11px;
	color:#333;
}

.pathCatego a {
	color:#333;
	text-decoration:none;
}

.pathCatego a:hover {
	text-decoration:underline;
}

#fListProd .marca {padding: 0;}
#fListProd .marca > b {text-transform:uppercase; cursor:pointer;}

/*::::::::::::: Iconos de peligrosidad :::::::::::::::: */
a.pd_tooltip div.peligrosidad {
	left:0px;
	top:350px;
}

/*::::::::::::: Comparación :::::::::::::::: */
.divComparar1 {
	width:100%; 
	text-align:center;
	display:block;
}

.lnk {
	margin: -5px 0 10px 0;
}

.divComparar2 {

    margin: 10px auto; 
	text-align:left;
}

div #etqComparar {
	cursor:pointer;
	font-size:12px;

}

.botonComparar{
	width: auto !important;
    font-size: 12px !important;
    cursor: pointer !important;
    border-radius: 5px !important;
    border: 1px solid;
    padding: 5px;
    color: #1f80e8;
    background: transparent;
}

#okComparar {
	vertical-align:middle;
}

#enlaceComparar {
	width: 65%; 
	margin: 0px auto; 
	text-align:center;
}

#enlaceComparar a {
	cursor:pointer;
	font-size:11px;
	display:inline-block;
	text-decoration:underline;
	color:#000000;
}

.comparar_carro img {
	vertical-align:initial;
}

table.comparacionProductos {
	display: table;
	font-size:12px;
	border: 1px solid #c6c6c6;
	border-collapse: separate;
	-moz-border-radius: 6px;
	border-radius: 6px;
}	

table.comparacionProductos td {
	padding: 10px;
	border-bottom: 1px solid #a0a0a0;
	text-transform: capitalize;
}

table.comparacionProductos td.propiedad {
	font-size:14px;
	font-weight:bold;
	background-color: #f5f5f5;
}

table.comparacionProductos td.propiedad2 {
	font-size:14px;
	font-weight:bold;
	color:#FFF;
	text-transform: none;
}

table.comparacionProductos td.descripcion {
	text-transform: uppercase;
	font-size:11px;
	vertical-align:top;
}

table.comparacionProductos td.propiedadLogistica {
	font-size:12px;
	font-weight:bold;
	background-color: #f5f5f5;
	border-left: 1px solid #a0a0a0;
}

table.comparacionProductos td.precioNeto {
	font-size:15px;
	font-weight:bold;
}

table.comparacionProductos td a.image img{
	width:75%;
}

.comparar_input {
	width:22px;
	vertical-align:text-bottom;
}

.comparar_updown {
	vertical-align:top;
	display:inline-grid;
}

.comparar_carro {
	margin-left:8px;
	vertical-align:top;
}

/*::::::::::::: Cuadro de precio :::::::::::::::: */
div.panelDesplegable {
	padding: 7px;
	border: 2px solid #bebebe;
	width: 180px;
    margin: 0 auto;
	border-radius: 0px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	-o-border-radius: 0px;
}

div.panelDesplegableVisible {
	color: #333;
	font-size: 11px;
}

div.panelDesplegableVisible span.precio {
	margin: 0;
 	padding: 0;
 	font-size: 18px;
 	font-weight: bold;
}

div.panelDesplegableVisible span.mejorPrecio{
	color:  #F66319;
	font-weight: bold;
}

div.panelDesplegableVisible span.precioUnidad{
	color:  grey;
	font-weight: bold;
	left:-5px;
	top:23px;
	position:relative;
	font-size:13px;
}

div.panelDesplegable table th {
	padding: 2px;
	font-size: 10px;
}

div.panelDesplegable table th a.boton {
	display: block;
	float: right;
	text-decoration: none !important;
}

div.panelDesplegable table td {
	padding: 3px 0 3px 0;
}

div.panelDesplegable table td.unidad {
	text-align: left;
	font-size: 12px !important;
}

div.panelDesplegable table td.precio {
	text-align: right;
	font-size: 12px !important;
	font-weight: bold;
	color: #666;
}

div.panelDesplegable .inputCantidadCarro {
	font-size: 13px !important;
	font-weight:bold;
	color:#000 !important;
	width: 63px;
}

#div_precioEspecial {
	position:relative;
}

.price.light-smaller {		
	top: -22px;
	left: -3px;
	z-index: 9;
}

.price.light span.larger, .price.light span.smaller, .price.light-smaller span.smaller, .price.light span.toosmaller {
	color: #db3600;
}

.price.dark {
	top: -7px;
	left: 2px;
	z-index: 8;
}

.price.dark-smaller {
	top: -21px;
	left: -2px;
	z-index: 8;
}

.priceSpecial {
	font-size: 21px !important;
	background-color: #000;
	color:#FED438;
	margin-left:1px;
	padding:1px;
}

.white-gradient {
	background: #fcfcf9;
	background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZjZmNmOSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNlYWU5ZTEiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);	
	background: -moz-linear-gradient(top, #fcfcf9 0%, #eae9e1 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fcfcf9), color-stop(100%,#eae9e1));
	background: -webkit-linear-gradient(top, #fcfcf9 0%,#eae9e1 100%);
	background: -o-linear-gradient(top, #fcfcf9 0%,#eae9e1 100%);
	background: -ms-linear-gradient(top, #fcfcf9 0%,#eae9e1 100%);
	background: linear-gradient(top, #fcfcf9 0%,#eae9e1 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fcfcf9', endColorstr='#eae9e1',GradientType=0 );
}

.divSugeridoPorBaja {
	margin: 20px 0px;
}

.codigoSugeridoPorBaja {
	color: #aa0306!important;
	border:1px solid #aa0306;
	padding:5px;
}

.textoSugeridoPorBaja {
	color: #aa0306;
	font-weight: bold;
	font-size: 14px;
}

/*::::::::::::: Producto Emergente (Ficha ampliada) :::::::::::::::: */
#modalImagenProducto {
	text-align: center!important;
	margin: 20px 0!important;
}

/*::::::::::::: Compartir redes sociales :::::::::::::::: */
#compartirRedesSociales {
	margin-top:15px;
	margin-bottom:15px;
	text-align: center;
}

#mostrarCompartirMail {
	 text-align: left;
}

/*::::::::::::: ¿Te ayudamos? (Ficha ampliada) :::::::::::::*/
#modalAyuda {
	margin:15px 15px 15px 15px;
}

#modalAyuda input {
	border:1px solid #CCCCCC; 
	padding:3px 5px;
}

/*::::::::::::: Descuento por umv :::::::::::::::: */
.pkg-discount {
    background-color: #f6f6f61f;
    border: 1px solid #eaeaea;
    width: 98%;
    padding: 10px 0px 1px 10px;
    margin: -10px 0 10px;
    border-radius: 5px;
    box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
}

.pkg-discount p{
    font-weight: bold;
}

.pkg-discount p.infoPrecioUMV, .pkg-discount p.infoUnidad{
	font-size: 15px;
}

.pkg-discount span{
    color: #aa0306;
    font-size: 12px!important;
    font-weight: bold;
}

.pkg-discount span.rotate{
	position: absolute;
    top: 45px;
    width: 100%;
    left: 0;
    white-space: nowrap;
}

.pkg-discount .icon{
	height:40px;
	width:40px;
	background:url('../../images/b2c/package.png');
	position:relative;
	float:right;
	margin: -7px 10px 0px 0px;
	cursor:pointer;
}
.pkg-discount .icon .count{
	position: absolute;
	top: 0px;
	right: -5px;
	background-color: #f00;
	width: 14px;
	height: 14px;
	color: #fff;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
	border-bottom-left-radius: 8px;
	text-align: center;
	font-size: 10px;
	font-weight: bold;
	line-height: 15px;
	border: 0px solid #fff;
}

/*******************************************************/
/************* PRODUCT1SUG *****************************/
/*******************************************************/

.titulo-carousel-top {
	background-position: left bottom; 
	margin-bottom:10px;
	display:block;
	font-size:16px;
}

.precio-carousel-top {
	margin: 0px auto 10px auto;
	font-weight:bold;
	color:#7F1E57;
	font-size: 15px;
	right:17px;
	text-align:left;
	height:40px;
	width:175px;
	padding: 0;
	display: block;
}

.suma-carousel-top {
	text-align: center;
	font-size: 12px;
	margin-top: 50px;
	position: relative;
	color: #C8C8C8;
}

.linea-degradado-top {
    display:block;
    border:none;
    color:white;
    height:1px;
    background:black;
	background: -webkit-gradient(radial, 50% 50%, 0, 50% 50%, 500, from(#e6e6e6), to(#fff));
    margin-top: 20px;
    margin-bottom: 20px;
}

.title-product-carousel-sugeridos {
	font-size: 11px; font-weight:bold; color:grey; margin: 10px auto 0 auto; padding: 0 0; text-align:left; line-height: 13px; display: block; height:25px; width:145px; text-transform:uppercase; overflow:hidden; 
}

.title-product-carousel-sugeridos {
	font-size: 13px;
    font-weight: bold;
    color: grey;
    margin: 10px auto 0 auto;
    padding: 0 0;
    text-align: left;
    line-height: 13px;
    display: block;
    height: 25px;
    width: 175px;
    text-transform: uppercase;
    overflow: hidden;
}

.aniadirAmbos-carrusel {
	position:relative; 
}

.imgPeq-carrusel img{
	width: 144px !important;
	heigth: 110px !important;		
}

.precio-carousel-top {margin: 0px auto 10px auto; font-weight:bold; color:#7F1E57; font-size: 15px; right:17px; text-align:left; height:40px; width:145px; display:block; }
.precio-carousel-top .desde {margin: 0px auto 10px auto; font-weight:bold; color:#7F1E57; font-size: 12px; text-align:left; }
.comprueba {margin: 22px auto 10px auto; font-weight:bold; color:#7F1E57; font-size: 15px; line-height:12px; text-align:right; display:block; }

/*******************************************************/
/************* LSTORDER **********************************/
/*******************************************************/

#det_pedido img.cc{
	position:absolute;
	top:1px;
	right:2px;
}

.estiloResaltarCelda {
	background-color: #FFCC99;
}

.infoComandes {
	display: block;
	/*border: 2px solid;
	border-width: 0.4px 5px 3px 0.4px;*/
	padding-left: 20px;
	padding-right: 10px;
}

/*******************************************************/
/************* HEADERALBARAN ***************************/
/*******************************************************/

span.camion-tracking {
	background-image: url(../../images/camion_trans.png);
	background-repeat: no-repeat transparent;
	display: inline-block;
	width:75px;		
	height:40px;
	float: left;
}


/*******************************************************/
/************* SCHOOLLIST ******************************/
/*******************************************************/

select option.information {
	background-color: #d1ecf1;
	font-weight: bold;
	text-transform: uppercase;
}
.disabled-row {
	background-color: #ccc !important;
}

.mapSchool {
	height: 400px;
}

.num {
	border-image: initial; 
	background:#000000; 
	padding-left:3px; 
	margin-right:3px;
}

@media screen and (max-width: 767px) {
	form#fListProd #dataC1.productDesktop {
		display: none;
	}
	
	form#fListProd div.addressResp {
		display: block;
	}
}

@media screen and (max-width: 767px) and (max-aspect-ratio: 13/9) {
	.mapSchool {
		width: 340px; 
		height: 250px;
	}
}

@media screen and (max-width: 767px) and (min-aspect-ratio: 13/9) {
	.mapSchool {
		width: 540px; 
		height: 275px;
	}
	
	#promoAltas .modal-dialog .modal-content {
	    width: auto !important;
	}
}

/*******************************************************/
/************* SEGENVIOS *******************************/
/*******************************************************/

.carousel-caption {
    top: 72%; 
}

.tableHeader {
	color:white;
	min-height:30px;
	padding-top: 5px;
	background-color:#fd514c; 
}

.tableHeader1 {
	background-color:lavender; /**lavenderblush **/
	min-height:30px;
	padding-top: 5px;
	overflow:hidden;
    white-space:nowrap;
    text-overflow: ellipsis;
}

.botonSeg {
	color: #000;
	text-align: center;
    width: 85%;
    height: 30px;
    margin-left: 50px;
    border-radius: 5px;
    cursor: pointer;
    box-shadow: none!important;
    background: #fff url(../../images/buttom-white.png) bottom center repeat-x;
    font-weight: bold;
}

.puntoSlide{ 
	margin-bottom:5px;
}

.textoPanel{
	font-size: 13px;
    font-weight: bold;
    color: grey;
    line-height: 13px;
    display: block;
    text-transform: uppercase;
}

/*******************************************************/
/************* ADAPTACION A RESPONSIVE *****************/
/*******************************************************/



/*Adaptacion buscador contenedora responsive */

		.orderDesktop {
			display: block;
		}
		
		.orderResponsive {
			display: none;
		}
		
		#itemDesktop {
			display: block;
		}
		
		#itemDesktop input {
		    background-color: #FFFFFF;
		    color: #000000;
		    width: 280px;
		    height: 21px;
		    line-height: 12px;
		}
		
		#itemResponsive {
			display: none;
		}
		
		.productDesktop {
			display: block;
		}
		
		.productResponsive {
			display: none;
		}
		
		.addressResp {
			display: none;
		}
		
		.addressDesk {
			display: block;
		}
		
		.pedidoResp {
			width: auto;
		}
		
		.cuadriculaResp {
				display: block;
				text-decoration:none;
		}
		
		.productHabitualesResp {
			display: none;
		}
		
		.productHabitualesRespC1{
			display: none;
		}
	

/* ================= */
/* VIEWCART1 DESKTOP */
/* ================= */
#viewcart1-container1 {

		padding-left: 1rem;
		margin-top: 10px;
	
}

/*::::::::::::: CABECERA :::::::::::::::: */
#vc1c1-cabecera{
	padding: 0px;
}
#vc1c1-cabeceraSubtitulo{
	clear: both;
	margin-top:20px;
}
#vc1c1-fondoSubCategoria {
	 border-bottom: 1px solid #fd514c;
	 color: #fd514c;
}


/*::::::::::::: ORDENACION :::::::::::::::: */
#vc1c1-ordenacion{
    display: flex;
    padding: 0 0 5px 0;
    margin-top:5px;
}

#vc1c1-ordenacion #ordenadoPor .ordenActual a{
	color: #fd514c;
}

/*::::::::::::: COMUNES TABLAS :::::::::::::::: */
#viewcart1-container1 .csp-table-row {
	display: table-row;
}

#viewcart1-container1 .csp-flex-row:hover {
	font-size:12px;
}

#viewcart1-container1 .csp-flex-row.csp-table-header {
	font-size: 14px;
	display: table-row !important;
}

#viewcart1-container1 .csp-flex-row.csp-table-header > div{
	padding:0px;
	display: table-cell;
	vertical-align: middle;
}

#viewcart1-container1 .csp-flex-row > div {
	
			padding:2px;
		
}


#viewcart1-container1 .v1c1-lineasubcat{
	padding: 0px;
}

#vc1c1-vercarro {
	margin: 5px 0;
}

/* ===================== */
/* TABLE VIEWCART 		 */
/* ===================== */
#viewcart1-container1 #vc1c1-datosCarro{
	padding: 0px;
}

#viewcart1-container1 #vc1c1-datosCarro .line.csp-table-row {
	background: white !important;
}

/* ===================== */
/* TABLE VIEWCART HEADER */
/* ===================== */
#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .imagen-header-product{
	width: 7.2%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .codigo-header-product{
	text-align: center;
	width: 6.13%;
}
#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .referencia-header-product{
	text-align: center;
	width: 7.3%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .descripcion-header-product{
	text-align:center;
	width: 19.71%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .umv-header-product{
	text-align: center;
	width: 3.67%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .stock-header-product{
	text-align: center;
	width: 4.37%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .cantidad-header-product{
  	width: 6.35%;

}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .tarifa-header-product{
	text-align: center;
	width: 5.53%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .descuento-header-product{
	text-align: center;
	width: 2.44%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .neto-header-product{
	text-align: center;
	width: 5.53%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .iva-header-product{
	text-align: center;
	width: 2.44%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .pvp-header-product{
	text-align: center;
	width: 5.97%;
}
#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .uve-header-product{
  	text-align: center;
  	width: 3.5%;
}
#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .subtotal-header-product{
	text-align: center;
	width: 6.11%;
}

#viewcart1-container1 #vc1c1-datosCarro .csp-flex-row .borrar-header-product{
	text-align: center;
	width: 3.25%;
}

/* ====================== */
/* TABLE VIEWCART COLUMN */
/* ===================== */
#viewcart1-container1 #vc1c1-datosCarro .line.csp-flex-row.csp-table-row > div{
	
			display:table-cell;
			vertical-align: top;
			font-size: 14px !important;
			border-bottom: 1px solid grey;
				
}

#viewcart1-container1 #vc1c1-datosCarro	.imagen-product{
	
			width: 7.2%;
			
}

/*#viewcart1-container1 #vc1c1-datosCarro	.imagen-product #pic a.p1:hover .large{
	left: auto;
}*/

#viewcart1-container1 #vc1c1-datosCarro .codigo-product{
	
			width: 6.13%;
			text-align: center;
				
}

#viewcart1-container1 #vc1c1-datosCarro .codigo-product .v1c1-iconoPromoEspecial{
		
				margin: 5px 0;
			
}

#viewcart1-container1 #vc1c1-datosCarro .referencia-product{
	
			text-align: center;
			width: 7.3%;
			white-space: nowrap;
			
}

#viewcart1-container1 #vc1c1-datosCarro .referencia-product a{
	
			/*float:left;
			width: 100%;*/
		
}

#viewcart1-container1 #vc1c1-datosCarro .referencia-product .v1c1-multiField {
	display: table;
	margin: 0 auto;
}

#viewcart1-container1 #vc1c1-datosCarro .referencia-product .unidades{
 	
			font-size:11px;
	 		font-weight:bold;
	 		color:#002F73;
	 		margin-top:5px;
	 		margin-left:3px;
			
}

#viewcart1-container1 #vc1c1-datosCarro .referencia-product .csp-table{
    
			display:table;
			margin: 5px 15px;
			float: left;
			position: relative;
		    left: 10%;
			
}

#viewcart1-container1 #vc1c1-datosCarro .referencia-product .csp-row{
	
			display:table-row;
		
	
}

#viewcart1-container1 #vc1c1-datosCarro	.referencia-product .csp-row > div{
	display: table-cell;
}

#viewcart1-container1 #vc1c1-datosCarro .referencia-product .csp-row .v1c1-unidades{
	
			vertical-align: bottom;
			
}

#viewcart1-container1 #vc1c1-datosCarro .descripcion-product{
	
			width: 19.71%;
			
}

#viewcart1-container1 #vc1c1-datosCarro .descripcion-product > span {
	float:left;
}

#viewcart1-container1 #vc1c1-datosCarro .descripcion-product .v1c1peligro-tooltip{
	float:left;
}

#viewcart1-container1 #vc1c1-datosCarro .descripcion-product .v1c1peligro-tooltip .v1c1-peligrosidad > span{
	float: left;
    width: 100%;
    text-align: left;
    
    	font-size: 14px;
        
}

#viewcart1-container1 #vc1c1-datosCarro	.descripcion-product .v1c1-textoDestacado2{
	float:left;
	width: 100%;
	font-size: 14px;	
}

#viewcart1-container1 #vc1c1-datosCarro .umv-product{
	text-align: center;
	width: 3.67%;
	display: table-cell !important;
}

#viewcart1-container1 #vc1c1-datosCarro	.stock-product{
	
			text-align: center;
			width: 4.37%;
			
}

#viewcart1-container1 #vc1c1-datosCarro .cantidad-product{
	
			width: 6.35%;
			display: table-cell !important;
			
}

#viewcart1-container1 #vc1c1-datosCarro .cantidad-product .cantidad-product-input{
    display: inline-flex;
    margin-right: 4px;
    float: left;
}

#viewcart1-container1 #vc1c1-datosCarro .cantidad-product .cantidad-arrow{
	display: table-cell;
    position: relative;
	display: grid;
}

#viewcart1-container1 #vc1c1-datosCarro .tarifa-product{
	text-align: center;
	width: 5.53%;
	white-space: nowrap;
	display: table-cell !important;
}

#viewcart1-container1 #vc1c1-datosCarro .descuento-product{
	text-align: center;
	width: 2.44%;
	white-space: nowrap;
	display: table-cell !important;
}

#viewcart1-container1 #vc1c1-datosCarro .neto-product{
	text-align: center;
	width: 5.53%;
	white-space: nowrap;
	display: table-cell !important;
}

#viewcart1-container1 #vc1c1-datosCarro .iva-product{
	text-align: center;
	width: 2.44%;
	white-space: nowrap;
	display: table-cell !important;
}

#viewcart1-container1 #vc1c1-datosCarro	.pvp-product{
	
			text-align: center;
			width: 5.97%;
			white-space: nowrap;
			
}

#viewcart1-container1 #vc1c1-datosCarro .uve-product{
  	text-align: center;
  	display: table-cell !important;
  	width: 3.5%;
}

#viewcart1-container1 #vc1c1-datosCarro .subtotal-product{
	
			text-align: center;
			width: 6.11%;
			white-space: nowrap;
		
}

#viewcart1-container1 #vc1c1-datosCarro .borrar-product{
	
			text-align: center;
			width: 3.25%;
			white-space: nowrap;
			
}

#viewcart1-container1 #vc1c1-datosCarro	.borrar-product .v1c1-imgBorrar{
	width:17px;
	height:17px;
}

/* ============================== */
/* TABLE PRODUCTOS NO DISPONIBLES */
/* ============================== */
#viewcart1-container1 #v1c1-noDisponible-prod .csp-table-header{
	display: flex !important;
    flex-direction: row;
    
}

#viewcart1-container1 #v1c1-noDisponible-prod .line.csp-flex-row {
	display: flex;
    flex-direction: row;
    
			font-size: 14px;
    		border-bottom: 1px solid grey;
   			background: white;
		
	    
}
/* ===================================== */
/* TABLE PRODUCTOS NO DISPONIBLES HEADER */
/* ===================================== */
#viewcart1-container1 #v1c1-noDisponible-prod .v1c1-cod-noDisponible-header-prod{	
	
			width: 10%;
			margin-left:2px;
			
}

#viewcart1-container1 #v1c1-noDisponible-prod .v1c1-ref-noDisponible-header-prod{
	
			width: 12%;
			
}

#viewcart1-container1 #v1c1-noDisponible-prod .v1c1-des-noDisponible-header-prod{
	
			width: 78%;
			text-align:center;
			
}

/* ===================================== */
/* TABLE PRODUCTOS NO DISPONIBLES COLUMN */
/* ===================================== */
#viewcart1-container1 #v1c1-noDisponible-prod .v1c1-cod-noDisponible-prod{
	
			width: 10%;
		
}

#viewcart1-container1 #v1c1-noDisponible-prod .v1c1-ref-noDisponible-prod{
	
			width: 12%;
		
}

#viewcart1-container1 #v1c1-noDisponible-prod .v1c1-des-noDisponible-prod{
	
			width: 78%;
		
}



/* ============== */
/* TABLE REGALOS */
/* ============== */
#viewcart1-container1 #vc1c1-datosLstRegalos .csp-table-header{
	
			display: flex;
			flex-direction: row;
			
}

#viewcart1-container1 #vc1c1-datosLstRegalos .line.csp-flex-row {
	flex-direction: row;
	background: white !important;
	
	

	

}

#viewcart1-container1 #vc1c1-datosLstRegalos .line.csp-flex-row > div{	
	
			display:table-cell;
			vertical-align: top;
			font-size: 14px !important;
			border-bottom: 1px solid grey;
		
}

/* ==================== */
/* TABLE REGALOS HEADER */
/* ==================== */
#viewcart1-container1 .csp-flex-row .radioBtn-header-regalo{
	width: 5.03%;
}

#viewcart1-container1 .csp-flex-row .imagen-header-regalo{
	width: 6%;
}

#viewcart1-container1 .csp-flex-row .codigo-header-regalo{
	width: 11.57%;
	text-align: center;
}

#viewcart1-container1 .csp-flex-row .referencia-header-regalo{
	width: 8.42%;
	text-align: center;
}

#viewcart1-container1 .csp-flex-row .descripcion-header-regalo{
	width: 21.74%;
	text-align: center;
}

#viewcart1-container1 .csp-flex-row .stock-header-regalo{
	width: 12.33%;
	text-align: center;
}

#viewcart1-container1 .csp-flex-row .cantidad-header-regalo{
	width: 4.81%;
}

#viewcart1-container1 .csp-flex-row .precio-header-regalo{
	width: 12.3%;
	text-align: center;
}

/* ==================== */
/* TABLE REGALOS COLUMN */
/* ==================== */
#viewcart1-container1 .csp-flex-row .radioBtn-regalo{
	
			width: 5.03%;
		

}

#viewcart1-container1 .csp-flex-row .radioBtn-regalo-desktop{
	display: table-cell !important;
	vertical-align: middle !important;
	text-align: center;
}


#viewcart1-container1 .csp-flex-row .imagen-regalo{
	
			width: 6%;
		
}

#viewcart1-container1 .csp-flex-row .codigo-regalo{
	
			width: 11.57%;
			text-align: center;
		
}

#viewcart1-container1 .csp-flex-row .referencia-regalo{
	
			width: 8.42%;
			text-align: center;
		
}

#viewcart1-container1 .csp-flex-row .descripcion-regalo{
	
			width: 21.74%;
		
}

#viewcart1-container1 .csp-flex-row .stock-regalo{
	
			width: 12.33%;
			text-align: center;
		
}

#viewcart1-container1 .csp-flex-row .cantidad-regalo{
	
			width: 4.81%;
		
}

#viewcart1-container1 .csp-flex-row .precio-regalo{
	
			width: 12.3%;
			text-align: center;
		
}

#viewcart1-container1 .v1c1-lineasubcatinf{
	margin-bottom:40px;
}

#viewcart1-container1 .v1c1-lineasubcatinfregalos{
	margin-bottom:20px;
}

#viewcart1-container1 .v1c1-msjCarritoVacio {
	margin-top:15px;
}

#viewcart1-container1 .v1c1-msjCarritoVacio span{
	font-weight: bold;
}

/*::::::::::::: BOTONERA :::::::::::::::: */
#viewcart1-container1 .vc1c1-btnAccionesDown{
	 margin: 20px 0;
}

#vc1c1-btnAcciones.vc1c1-btnAccionesUp,#vc1c1-btnAcciones.vc1c1-btnAccionesDown{
	display: flex;
    flex-direction: row;
    float: left;
    justify-content: flex-end;
  	
			width: 100%;
		
}

#vc1c1-btnAcciones .vc1c1-BtnIva{
	
			/*margin-right: 20px;*/
			 margin: auto;
			
}



#vc1c1-btnAcciones .vc1c1-BtnIva .orderDesktop{
	
			width:auto;
			
}

#vc1c1-btnAcciones .vc1c1-BtnProcesar{
 	
			order: 4;
			
}

#vc1c1-btnAcciones .vc1c1-BtnProcesar input{
    background-color: #f4d078 !important;
    border-color: #f4d078;
    color: black;
   	background: -webkit-linear-gradient(top,#f7dfa5,#f0c14b);
    background: linear-gradient(to bottom,#f7dfa5,#f0c14b);
    text-transform: uppercase;
        
	    width: 360px;
    	line-height: 2;
    
}

#vc1c1-btnAcciones .vc1c1-BtnProcesar input:hover{
	background: #f1c861;
    background: -webkit-linear-gradient(top,#f5d78e,#eeb933);
    background: linear-gradient(to bottom,#f5d78e,#eeb933)
}



#vc1c1-btnAcciones .vc1c1-BtnRecalcular{	
    
			order: 2;
    		margin-right: 5px;
			
}



#vc1c1-btnAcciones .vc1c1-BtnImprimir{
	
			order: 3;
			flex:2;
			
}





#vc1c1-btnAcciones .vc1c1-BtnImprimir input.pdf-down, #vc1c1-btnAcciones .vc1c1-BtnImprimir input.pdf-down:active{
	background-image: url(../../images/b2c/svg/printer1.svg);
	background-repeat: no-repeat;
	background-position: left;
	background-position-y: 6px;	
	padding-left: 25px !important;
	
			background-position-x: 5px;
			background-size: 16px 16px;
			
}

/* ================= */
/* VIEWCART1 MOBILE  */
/* ================= */


/* Boton comparacion productos*/
#otraComparacion{
	float: right;
}


/* ================ */
/* CONSULTA PEDIDOS */
/* ================ */

@media screen and (max-width: 767px) {
	#dataC1.listOrderDiv #datatable-orders_wrapper.dataTables_wrapper table#datatable-orders {
		width: 100% !important;
	}
}

/* =============================================================== */
/* MOBILE SIDEBAR 
/* =============================================================== */

@media screen and (max-width: 767px) {
    #wrapper {  
       display: flex;       
       flex-direction: column; 
    }
    #filtros { 
       order: 1; 
    }
    #contenido { 
       order: 2; 
       padding: 0 0 !important;
    }  
}

/* =============================================================== */
/*  COMPARACION PRODUCTOS 
/* =============================================================== */
	#vaciarComparacion{
		margin: 0 0 10px;
	}
	
@media screen and (max-width: 767px) {

	table.comparacionProductos td {
		padding: 5px;
	}
	
	table.comparacionProductos td.precioNeto{
		white-space: nowrap;
	}
	
	table.comparacionProductos td a.image img{
		width:75%;
	}
	
	.comparacionProductos .precioNeto .taxes{
		float:left;
		width:100%;
	}
	
	#vaciarComparacion{
		margin: 0 0 10px;
	}
	
	#otraComparacion{
		float: left;
    	margin: 10px 0;
	}
}

/* =============================================================== */
/*  PAGINA USUARIO REGISTRADO
/* =============================================================== */

	#dataC1 #reg input {
		padding: 3px 5px;
	}
	
	#dataC1 #reg select#provincia,#dataC1 #reg select#pais, #dataC1 #reg #idioma, #dataC1 #reg #carroAbandonado {
		padding: 3px 5px;
		
				width: 203px !important;
			
		
	}
	
	#dataC1 #reg .inputPedido input {
		width: 379px;
	}
	
/* =============================================================== */
/*  PAGINA MIS PEDIDOS
/* =============================================================== */	
	#dataC1 select#status {
		padding: 3px 5px;
	}
	
/* =============================================================== */
/*  PAGINA MIS PEDIDOS SUPERVISADOS
/* =============================================================== */			
	#formSupervisedOrders1 select#orderStatus {
		padding: 3px 5px;
	}
	
/* =============================================================== */
/*  PAGINA RECUPERAR PEDIDOS
/* =============================================================== */
	#recPed.aviso1 .tabla1 td,#recPed.aviso1 .tabla1 th {
		font-size: 15px;
	}
	
/* =============================================================== */
/*  PAGINA LISTA PRODUCTOS HABITUALES
/* =============================================================== */
	#fListProd .tabla1 .tr1Impar, #fListProd .tabla1 .tr1Par {
		  border-bottom: 1px solid grey; 
	}
	
	#fListProd .tabla1 .lstusualImagen {
		width: 150px;
	}
	
	#fListProd .tabla1 .lstusualCod {
		width: 100px;
	}
	
	#fListProd .tabla1 .lstusualDescripcion {
		width: 320px;
	}
	
	#fListProd .tabla1 .lstusualUmv {
		width: 60px;
	}
	
	#fListProd .tabla1 .lstusualStock {
		width: 60px;
	}
	
	#fListProd .tabla1 .lstusualTarifa {
		width: 80px;
	}
	
	#fListProd .tabla1 .lstusualDescuento {
		width: 80px;
	}
	
	#fListProd .tabla1 .lstusualPvp {
		width: 80px;
	}
	
	#fListProd .tabla1 .lstusualIva {
		width: 60px;
	}
	
	#fListProd .tabla1 .lstusualCantidad {
		width: 60px;
	}
	
	#fListProd .tabla1 .lstusualFlechas {
		width: 30px;
	}
	
	#fListProd .tabla1 .lstusualCarro {
		width: 40px;
	}
	
	#fListProd .tabla1 .multiField {
		display: table;
		margin: 0 auto;
	}

/* =============================================================== */
/*  PAGINA EDITAR DIRECCION
/* =============================================================== */

	#formDirecciones #dataC1 input {
		padding: 3px 5px;
	}
	
	#formDirecciones #dataC1 select#provincia_env,#formDirecciones #dataC1 select#pais_env { 
		padding: 3px 5px;
	}
	
	#formDirecciones #dataC1 input#direccion_env, #formDirecciones #dataC1 input#destinatario_env{
		width: 379px;
	}
	
/* =============================================================== */
/*  TABLA CARRITO FLOTANTE
/* =============================================================== */
	#contenidoCarroflotante .carritoFlotanteRef {
		text-align: center;
		word-break: break-all;
	}

/*Colorbox*/

/*
    ColorBox Core Style:
    The following CSS is consistent between example themes and should not be altered.
*/
#colorbox, #cboxOverlay, #cboxWrapper{position:absolute; top:0; left:0; z-index:9999; overflow:hidden;}
#cboxOverlay{position:fixed; width:100%; height:100%;}
#cboxMiddleLeft, #cboxBottomLeft{clear:left;}
#cboxContent{position:relative;}
#cboxLoadedContent{overflow:auto;}
#cboxTitle{margin:0;}
#cboxLoadingOverlay, #cboxLoadingGraphic{position:absolute; top:0; left:0; width:100%; height:100%;}
#cboxPrevious, #cboxNext, #cboxClose, #cboxSlideshow{cursor:pointer;}
.cboxPhoto{float:left; margin:auto; border:0; display:block;}
.cboxIframe{width:100%; height:100%; display:block; border:0;}

/* 
    User Style:
    Change the following styles to modify the appearance of ColorBox.  They are
    ordered & tabbed in a way that represents the nesting of the generated HTML.
*/
#cboxOverlay{background:#b0b1b3;}
#colorbox{}
    #cboxTopLeft{width:25px; height:25px; background:none!important;}
    #cboxTopCenter{height:25px; background:none!important;}
    #cboxTopRight{width:25px; height:25px; background:none!important;}
    #cboxBottomLeft{width:25px; height:25px; background:none!important;}
    #cboxBottomCenter{height:25px; background:none!important;}
    #cboxBottomRight{width:25px; height:25px; background:none!important;}
    #cboxMiddleLeft{width:17px; background:none!important;}
    #cboxMiddleRight{width:25px; background:none!important;}
    #cboxContent{background:#fff; overflow:hidden;}
        .cboxIframe{background:#fff;}
        #cboxError{padding:50px; border:1px solid #ccc;}
        #cboxLoadedContent{margin-bottom:20px;}
        #cboxTitle{position:absolute; padding:10px 0; bottom:0px; left:0; text-align:left!important; width:100%; color:#fff!important;}
        #cboxCurrent{position:absolute; bottom:0px; left:100px; color:#999;}
        #cboxSlideshow{position:absolute; bottom:0px; right:42px; color:#444;}
        #cboxPrevious{position:absolute; bottom:0px; left:0; color:#444;}
        #cboxNext{position:absolute; bottom:0px; left:63px; color:#444;}
        #cboxLoadingOverlay{background:#fff url(../../images/loading.gif) no-repeat 5px 5px;}
        
         /*Aspa, tomado del ejemplo2. Next, previos etc deberia tomarse de ahÂ­ tambien*/
        #cboxClose{z-index: 999; text-indent:-9999px; width:20px!important; height:20px!important; position:absolute; top: 5px!important; right: 8px!important; background:url(../../images/b2c/svg/cerrar1.svg) no-repeat 0 0!important;}
        #cboxClose{background-position:-50px 0px; right:0;}
        #cboxClose:hover{background-position:-50px -25px;}       
        /*#cboxClose{position:absolute; bottom:0; right:0; display:block; color:#444;}*/

/*
  The following fixes a problem where IE7 and IE8 replace a PNG's alpha transparency with a black fill
  when an alpha filter (opacity change) is set on the element or ancestor element.  This style is not applied to or needed in IE9.
  See: http://jacklmoore.com/notes/ie-transparency-problems/
*/
.cboxIE #cboxTopLeft,
.cboxIE #cboxTopCenter,
.cboxIE #cboxTopRight,
.cboxIE #cboxBottomLeft,
.cboxIE #cboxBottomCenter,
.cboxIE #cboxBottomRight,
.cboxIE #cboxMiddleLeft,
.cboxIE #cboxMiddleRight {
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#00FFFFFF,endColorstr=#00FFFFFF);
}

#cboxTitle div{
	width: 100%!important;
	margin: 0pt auto!important;
	text-align: center!important;
	font-weight: normal!important;
	font-family: arial!important;
	font-size: 12px!important;
}
/*
  The following provides PNG transparency support for IE6
  Feel free to remove this and the /ie6/ directory if you have dropped IE6 support.
*/
.cboxIE6 #cboxTopLeft{background:none!important;}
.cboxIE6 #cboxTopCenter{background:none!important;}
.cboxIE6 #cboxTopRight{background:none!important;}
.cboxIE6 #cboxBottomLeft{background:none!important;}
.cboxIE6 #cboxBottomCenter{background:none!important;}
.cboxIE6 #cboxBottomRight{background:none!important;}
.cboxIE6 #cboxMiddleLeft{background:none!important;}
.cboxIE6 #cboxMiddleRight{background:none!important;}

.cboxIE6 #cboxTopLeft,
.cboxIE6 #cboxTopCenter,
.cboxIE6 #cboxTopRight,
.cboxIE6 #cboxBottomLeft,
.cboxIE6 #cboxBottomCenter,
.cboxIE6 #cboxBottomRight,
.cboxIE6 #cboxMiddleLeft,
.cboxIE6 #cboxMiddleRight {
    _behavior: expression(this.src = this.src ? this.src : this.currentStyle.backgroundImage.split('"')[1], this.style.background = "none", this.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src=" + this.src + ", sizingMethod='scale')");
}

.ac1-contenido-disti3-width {
	width:66.66666667% !important
}

@media screen and (max-width: 767px) {
	
	.ac1-contenido-disti3-width { 
		width:100% !important
	}
	
	.ac1-contenido-disti3-auto-mobile {
		width:auto !important
	}
	
}

@media (min-width: 768px) and (max-width: 1024px) { 
	.ac1-contenido-disti3-width { 
			width:100% !important
		}
}

.margin-top-40 {
	margin-top: 40px;
}

.margin-top-20 {
	margin-top: 20px;
}

.margin-top-5 {
	margin-top: 5px;
}

.padding-left-5 {
	padding-left: 5px;
}

/* PANEL GESTION DE COOKIES */
.ovcookie {
/*  background: rgba(0,0,0,0.70);
    position: fixed;*/
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 3000;
}

.msgcookie {
    display: block;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background: #FFF;
    color: black;
    z-index: 3001;
    padding: 0;
    box-shadow: 0 0 10px rgb(0 0 0 / 30%);
}

.msgcookie h2 {
    background: #f1f1f1;
    text-align: right;
    font-size: 36px;
    padding: 10px 20px;
    font-weight: 400 !important;
    margin-bottom: 15px;
    margin-top: 0px;
}

.msgcookie p {
    padding: 0;
    text-align: justify;
    font-size: 19px;
    line-height: 120%;
    margin: 0 20px 15px 20px;
}

.cookiebotones {
    display: inline;
    float: left;
    width: 100%;
    padding: 20px 20px 15px 0;
    text-align: center;
}

.botonaceptar {
    font-size: 20px;
    display: inline-block;
    background: #00953a;
    color: #FFF !important;
    text-decoration: none;
    font-weight: 700;
    font-weight: 700;
    line-height: 45px;
    padding: 3px 20px;
    text-decoration: none !important;
    text-transform: uppercase;
    border: 0;
    border-radius: 5px;
    cursor: pointer;
}

/* The container */
.containerCheckbox {
  display: block;
  position: relative;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 18px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  margin-right: 13px;
}

/* Hide the browser's default checkbox */
.containerCheckbox input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: relative;
  top: 0px;
  padding-right: 22px;
  margin-right: 6px;
  height: 23px;
  width: 23px;
  background-color: #eee;
  border-radius: 5px;
}

/* On mouse-over, add a grey background color */
.containerCheckbox:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.containerCheckbox input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.containerCheckbox input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.containerCheckbox .checkmark:after {
  left: 8px;
  top: 3px;
  width: 7px;
  height: 12px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

@media (min-width: 1400px){
	.col-xl-1 {
	    width: 8.3%;
	}
	.col-xl-2 {
	    width: 16.6%;
	}
	.col-xl-3 {
	    width: 24.9%;
	}
	.col-xl-4 {
	    width: 33.1%;
	}
	.col-xl-5 {
	    width: 41.4%;
	}
	.col-xl-6 {
	    width: 50%;
	}
	.col-xl-7 {
	    width: 58.3%;
	}
	.col-xl-8 {
	    width: 64.6%;
	}
	.col-xl-9 {
	    width: 72.9%;
	}
	.col-xl-10 {
	    width: 81.2%;
	}
	.col-xl-11 {
	    width: 89.5%;
	}
	.col-xl-12 {
	    width: 100%;
	}
}

.containerAccordion{
	border: 2px solid #dadbdb;
	background: #ffffff;
	padding: 3px;
}

.accordion {
  color: #666666 !important;
  cursor: pointer;
  padding: 18px;
  width: -webkit-fill-available;
  border: none;
  text-align: center;
  outline: none;
  font-size: 20px;
  transition: 0.4s;
  font-weight: bold;
  background: white;
}

.activeAccordion, .accordion:hover {
  color: black !important;
}

.accordion:before {
  color: #777;
  font-weight: bold;
  float: left;
  margin-left: 5px;
}

.activeAccordion:before {
}

.panelAccordion {
  padding: 0px 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}

#compartirRedesSociales .compartir-link{
	position: relative;
	top: 2px;
	color: #337ab7;
	cursor:pointer;
}

/* Nuevo diseño cookies */

.ovcookie .msgcookie, #divcookie div, #divcookie a{
	/*padding: 15px !important;*/
}
	
.enlacecookie {
	text-decoration: underline!important;
	font-weight: normal !important;
	padding: 0px 0px 0px 10px !important;
}

#btnAceptar, #btnRechazar, #btnConfiguracion{
	border-radius: 3px;
	text-transform: uppercase;
}

abbr[data-original-title], abbr[title] {
	text-decoration: none;
	border-bottom: none;
	cursor: pointer;
}

@media (max-width:1199.98px) {
	#c3_fixed_slider {
	   display: none !important;
	}
}

@media screen and (min-width:451px) and (max-width:1022px){
		
	div#wrapper {
		width: 100%;
	}
	.msgcookie h2 {
		font-size: 25px;
	}
	.msgcookie p{
		font-size: 15px;
	}
	.cookiebotones button{
		font-size: 15px;
	}
		
}
	
@media screen and (max-width: 650px){
	
	.cookiebotones{
		display: flex;
		flex-direction: column;
		padding: 0 0 50px 0;
		
	}
	.cookiebotones button{
		margin: .2rem 0;
	}
}

@media screen and (max-width:450px){
	
	div#wrapper {
		width: 100%;
	}
	.msgcookie h2 {
		font-size: 20px;
	}
	.msgcookie p{
		font-size: 12px;
	}
	.cookiebotones button{
		font-size: 12px;
	}
}
