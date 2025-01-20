
$.getTooltipTopRight = function(){
	$('.jqTooltip').tooltipster({
		animation: 'fade',
		delay: 200,
		theme: 'tooltipster-borderless',
		maxWidth: 600,
		side: ['top', 'right']
	});
}

$.getTooltipBottomRight = function(){
	$('.jqTooltip').tooltipster({
		animation: 'fade',
		delay: 200,
		theme: 'tooltipster-borderless',
		maxWidth: 600,
		side: ['bottom', 'right']
	});
}

$.getTooltipBottomRightNoWidth = function(){
	$('.jqTooltip').tooltipster({
		animation: 'fade',
		delay: 200,
		theme: 'tooltipster-borderless',
		side: ['bottom', 'right']
	});
}

$.getCustomTooltip = function(selector, animation, theme, maxWidth, firstSide, secondSide){
	$(selector).tooltipster({
		animation: animation,
		delay: 200,
		theme: theme,
		maxWidth: maxWidth,
		side: [firstSide, secondSide]
	});
}

$.getTooltipBottomAndLeft = function(){
	$('.jqTooltip').tooltipster({
		   animation: 'fade',
		   delay: 200,
		   theme: 'tooltipster-borderless',
		   maxWidth: 700,
		   side: ['bottom'],
		  functionPosition: function(instance, helper, position){
		        position.coord.bottom += 0;
		        position.coord.left += 250;
		        return position;
		    }
		});
}

$.getTooltipBottomRightB2B = function(){
	$('.jqTooltip').tooltipster({
		animation: 'fade',
		delay: 100,
		theme: 'tooltipster-csp',
		maxWidth: 600,
		side: ['bottom', 'right']
	});
}

$.getTooltipBottomRightB2Bred = function(){
	$('.jqTooltipRed').tooltipster({
		animation: 'fade',
		delay: 100,
		theme: 'tooltipster-csp-red',
		maxWidth: 600,
		side: ['bottom', 'right']
	});
}