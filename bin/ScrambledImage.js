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
	var si = new ScrambledImage("../bin/sample.jpg",{ seed : 1, height : 8, width : 8});
	var f = new FizzBuzz();
};
var Random = function(seed) {
	if(seed == null) seed = 1;
	this.seed = seed;
};
Random.prototype = {
	'int': function() {
		return (this.seed = this.seed * 16807 % 2147483647) & 1073741823;
	}
	,'float': function() {
		return ((this.seed = this.seed * 16807 % 2147483647) & 1073741823) / 1073741823.0;
	}
};
var ScrambledImage = $hx_exports.ScrambledImage = function(fileName,params) {
	this.width = null;
	this.height = null;
	this.seed = null;
	this.canvasId = null;
	this.canvas = null;
	this.context = null;
	this.shuffleMatrix = [];
	this.fileName = null;
	this.fileName = fileName;
	this.seed = params.seed;
	this.height = params.height;
	this.width = params.width;
	this.canvasId = params.canvasIdString;
	this.shuffleMatrix = [[0]];
};
ScrambledImage.prototype = {
	getShuffleArray_: function() {
		var r = new Random(this.seed);
		var array = [];
		var sizeofMatrix = this.height * this.width;
		var _g = 0;
		while(_g < sizeofMatrix) {
			var i = _g++;
			array[i] = i;
		}
		var _g1 = 0;
		while(_g1 < sizeofMatrix) {
			var i1 = _g1++;
			var j = Math.floor(((r.seed = r.seed * 16807 % 2147483647) & 1073741823) / 1073741823.0 * (i1 + 1));
			var tmp = array[i1];
			array[i1] = array[j];
			array[j] = tmp;
		}
		return array;
	}
};
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i1) {
	return isNaN(i1);
};
Main.main();
})(typeof window != "undefined" ? window : exports);
