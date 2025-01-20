if (__isIE) { 
	var event_input="keyup";
} else {
	var event_input="input";
	var _csfinder =  document.getElementById("csfinder");
}

function callAsyncPreSearch() {
	if($(ajaxloading).length > 0) {
		$(ajaxloading).css('display','block');
	}
	var valueSearch = $("#searchString").val();
	var longiSearch=$("#searchString").val().length;
	if(longiSearch >= __MIN_LENGTH_CSFINDER) {
		$.get(__cs+"?s="+__store+"&o=searchEngine_b2c&searchString="+ valueSearch +"&p=6&flagRecursiveTree=S&elementByPage=PS", function(data) {
		if (data.indexOf("1") == 0) {
				closeCSFinder();								            	    	
		} else if (data.indexOf("0") == 0) {
		    createSuggestOptions();
		} else {
			if (__isIE) { 
				//innerHTML problems with IE
				var newdiv = document.createElement("div");
				newdiv.id='csfinder';
				newdiv.innerHTML = data;					
				$('#csfinder').replaceWith(newdiv);
				if($('#csfinder .presrch-row').length > 0) {
					$('#csfinder').css("display","block");
				}
			} else {
				_csfinder.innerHTML = data;

				if($('#csfinder .presrch-row').length > 0) {
					$('#csfinder').css("display","block");
				}
			}
			
			    createSuggestOptions();
			    if($("#categorias-psrch").length == 0 && $("#resultados-psrch").length == 0) {
				$("#sugerencias-header").hide();
			    }

			
				$("body").addClass("modal-open");
				$(".nano").nanoScroller();					
										
					
					$('.infinite-scroll').jscroll({
					    loadingHtml: '<div style="text-align: center; padding:15px;"><img src="images/procesing.gif" style="display: block;margin: 0 auto;"/></div>',
					    padding: 20,
					    nextSelector: 'a.jscroll-next:last',
					    contentSelector: '#injected-content',	
					    callback: function() {							    	
					    	$.get(__cs+"?s="+__store+"&o=searchEngine_b2c&p=6&t=r");
					    	
					    }
	
					});
	
            	$(document).bind("keyup.csfinder", function(e) {
            	    if (e.keyCode == 27) { // escape key maps to keycode 27
            			closeCSFinder();
            	    }					        				            	    
            	});
            	$(document).bind("click.csfinder", function (e)
            			{					        				            			    
            			    //if (!container.is(e.target) // if the target of the click isn't the container...				        				            			   
            			    //&& container.has(e.target).length === 0) // ... nor a descendant of the container
            			    if ( e.target.id !== "searchString" && $(e.target).closest("#csfinder").length === 0)
            			    {
            			    	closeCSFinder();			            			   
            			    }
            			});
			}
			if($(ajaxloading).length > 0) {
				$(ajaxloading).css('display','none');
			}
		});
	} else if(longiSearch > 0){
	    $.get(__cs+"?s="+__store+"&o=searchEngine_b2c&p=9", function(data) {
		if (__isIE) { 
			//innerHTML problems with IE
			var newdiv = document.createElement("div");
			newdiv.id='csfinder';
			newdiv.innerHTML = data;					
			$('#csfinder').replaceWith(newdiv);
			if($('#csfinder .presrch-row').length > 0) {
				$('#csfinder').css("display","block");
			}
		} else {
			_csfinder.innerHTML = data;
		}
		createSuggestOptions();
		
		$('#csfinder').css("display","block");
		
		$("body").addClass("modal-open");
		$("#categorias-psrch").hide();
		$("#resultados-psrch").hide();
		$("#sugerencias-ideas .output").css("max-height", "fit-content");
		$("#sugerencias-header").hide();
	    });
	} else {
	    closeCSFinder();		
	}
}

var ajaxloading = document.getElementById("ajxld");
var timeoutSearchString = null;

document.getElementById("searchString").addEventListener(event_input, onTouchStart, {passive: true});

function onTouchStart(){
	var divTO = $("#searchString").val().length;
	
	if (divTO < 1)
		divTO = 1;
	
	clearTimeout(timeoutSearchString);	

	timeoutSearchString = setTimeout(function () {        
        callAsyncPreSearch();
    }, 2500/divTO);	
 }

function createSuggestOptions(){
    var existIdeasDiv = $('#sugerencias-ideas')[0];
    if(existIdeasDiv != null){
        $(document).ready(function(){
        var idioma = $('#idioma').val();
        
        var ideas = "";
        if(idioma == 'fr_FR') {
    	ideas = "/js/ideas/files/ideafr_FR.txt";
        } else if(idioma == 'pt_PT') {
    	ideas = "/js/ideas/files/ideapt_PT.txt";
        } else if(idioma == 'ca_ES') {
    	ideas = "/js/ideas/files/ideaca_ES.txt";
        } else {
    	ideas = "/js/ideas/files/ideaes_ES.txt";
        }
        
        var myHeaders = new Headers();
        myHeaders.append('Content-Type','text/plain; charset=UTF-8');
        
        fetch(ideas, myHeaders)
            .then(response => response.arrayBuffer())
            .then(text => {
        	const decoder = new TextDecoder('iso-8859-1');
                const textDecode = decoder.decode(text);
                var json = JSON.parse(textDecode.split('=')[1].trim());
                
                $return = [];
                
                function strInArray(str, strArray) {
                for (var j=0; j<strArray.length; j++) {
                  if (strArray[j].toUpperCase().match(str.toUpperCase()) && $return.length < 5) {
                    var $h = strArray[j].replace(str.toUpperCase(), '<strong>'+str.toUpperCase()+'</strong>');
                    $return.push('<li class="prediction-item"><span class="prediction-text">' + $h + '</span></li>');
                  }
                }
              }
                
              $(function(){
                    var $search = $('#searchString').val();
        
                    $return = [];
                    
                    strInArray($search, json);
                    
                    $('.output').html($return);
        
                    if($return.length == 0) {
                	$("#sugerencias-header").hide();
                    }
                    
                    $('#sugerencias-ideas').height($('.output').height());
                    
                    $('.prediction-item').on('click', function(){
                      $text = $(this).find('span').text();
                      $('#searchString').val($text);
        	    	  closeCSFinder();		
        	    	  $('#formSearchEngineContenedora').submit();
                    });
                    
                    $('.prediction-item:first-child').addClass('focus');
                    
              });
            });
        
        document.addEventListener("click", function(){
           $('#csfinder').hide();
        });
        
        });
    }
}
