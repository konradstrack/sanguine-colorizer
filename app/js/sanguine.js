function bindColor(fromInput, toElement, property) {
	var colorInput = $(fromInput);
	$(toElement).css(property, colorInput.val());

	colorInput.change(function() {
		$(toElement).css(property, colorInput.val());
	});
}

function bindLighterColor(fromInput, toElement, property) {
	var colorInput = $(fromInput);

	var lighterColorStr = tinycolor(colorInput.val()).lighten(10).toString();
	$(toElement).css(property, lighterColorStr);

	colorInput.change(function() {
		var lighterColorStr = tinycolor(colorInput.val()).lighten(10).toString();
		$(toElement).css(property, lighterColorStr);
	});
}

function bindDarkerColor(fromInput, toElement, property) {
	var colorInput = $(fromInput);

	var lighterColorStr = tinycolor(colorInput.val()).darken(16).toString();
	$(toElement).css(property, lighterColorStr);

	colorInput.change(function() {
		var lighterColorStr = tinycolor(colorInput.val()).darken(16).toString();
		$(toElement).css(property, lighterColorStr);
	});
}

function constructLinearGradient(fromColor, toColor) {
	return 'linear-gradient(to bottom, ' + fromColor + ' 0%, ' + toColor + ' 100%)';
}

function applyGradients(baseColor, toElement, toLighterElement) {
	var firstColor = tinycolor(baseColor);

	var firstColorStr = baseColor;
	var secondColorStr = tinycolor(baseColor).darken(2).toString();

	$(toElement).css('background', constructLinearGradient(firstColorStr, secondColorStr));

	var lighterFirstColorStr = tinycolor(baseColor).lighten(10).toString();
	var lighterSecondColorStr = firstColor.lighten(2).toString();

	$(toLighterElement).css('background', constructLinearGradient(lighterFirstColorStr, lighterSecondColorStr));
}

function bindGradient(fromInput, toElement, toLighterElement) {
	var colorInput = $(fromInput);

	applyGradients(colorInput.val(), toElement, toLighterElement);
	colorInput.change(function() {
		applyGradients(colorInput.val(), toElement, toLighterElement);
	});
}
