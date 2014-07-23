function addToColor(color, component) {
	var rgb = color.toRgb();
	rgb.r += component;
	rgb.g += component;
	rgb.b += component;

	return tinycolor(rgb);
}

function bindColor(fromInput, toElement, property, lightenBy) {
	var colorInput = $(fromInput);

	var colorStr = addToColor(tinycolor(colorInput.val()), lightenBy).toString();
	$(toElement).css(property, colorStr);

	colorInput.change(function() {
		var colorStr = addToColor(tinycolor(colorInput.val()), lightenBy).toString();
		$(toElement).css(property, colorStr);
	});
}

function constructLinearGradient(fromColor, toColor) {
	return 'linear-gradient(to bottom, ' + fromColor + ' 0%, ' + toColor + ' 100%)';
}

function applyGradients(baseColor, toElement, toLighterElement) {
	var firstColor = tinycolor(baseColor);

	var firstColorStr = baseColor;
	var secondColorStr = addToColor(firstColor, -0x0B).toString();

	$(toElement).css('background', constructLinearGradient(firstColorStr, secondColorStr));

	var lighterFirstColor = addToColor(firstColor, 0x13);

	var lighterFirstColorStr = lighterFirstColor.toString();
	var lighterSecondColorStr = addToColor(lighterFirstColor, 0x0E).toString();

	$(toLighterElement).css('background', constructLinearGradient(lighterFirstColorStr, lighterSecondColorStr));
}

function bindGradient(fromInput, toElement, toLighterElement) {
	var colorInput = $(fromInput);

	applyGradients(colorInput.val(), toElement, toLighterElement);
	colorInput.change(function() {
		applyGradients(colorInput.val(), toElement, toLighterElement);
	});
}
