(function ($hx_exports) { "use strict";
var FizzBuzz = $hx_exports.FizzBuzz = function() {
};
FizzBuzz.prototype = {
	returnString: function(i) {
		return "Fizz";
	}
};
var Main = function() { };
Main.main = function() {
	var si = new ScrambledImage("../bin/sample.jpg",1,8,8);
	var f = new FizzBuzz();
};
var ScrambledImage = $hx_exports.ScrambledImage = function(fileName,seed,height,width) {
	this.width = null;
	this.height = null;
	this.seed = null;
	this.canvasId = null;
	this.canvas = null;
	this.context = null;
	this.fileName = null;
	this.fileName = fileName;
	this.seed = seed;
	this.height = height;
	this.width = width;
};
Main.main();
})(typeof window != "undefined" ? window : exports);
