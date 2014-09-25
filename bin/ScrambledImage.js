(function ($hx_exports) { "use strict";
var FizzBuzz = $hx_exports.FizzBuzz = function() {
};
FizzBuzz.prototype = {
	returnString: function(i) {
		return "Fizz";
	}
};
var HxOverrides = function() { };
HxOverrides.cca = function(s,index) {
	var x = s.charCodeAt(index);
	if(x != x) return undefined;
	return x;
};
var Main = function() { };
Main.main = function() {
	var si = new ScrambledImage("../bin/sample.jpg",{ seed : 1, height : 8, width : 8});
	var f = new FizzBuzz();
	var r = Rndm.integer(10);
};
var Rndm = function() {
	throw "Don't new this Rndm class! You fool";
};
Rndm["float"] = function(min,max) {
	if(max == null) max = 0;
	if(max == 0) {
		max = min;
		min = 0;
	}
	return Rndm.random() * (max - min) + min;
};
Rndm.bool = function(chance) {
	if(chance == null) chance = 0.5;
	return Rndm.random() < chance;
};
Rndm.sign = function(chance) {
	if(chance == null) chance = 0.5;
	if(Rndm.random() < chance) return 1; else return -1;
};
Rndm.bit = function(chance) {
	if(chance == null) chance = 0.5;
	if(Rndm.random() < chance) return 1; else return 0;
};
Rndm.integer = function(minInclusive,maxExclusive) {
	if(maxExclusive == null) maxExclusive = 0;
	var min = minInclusive;
	var max = maxExclusive;
	if(max == 0) {
		max = min;
		min = 0;
	}
	return Math.floor(Rndm["float"](min,max));
};
Rndm.charFromString = function(string) {
	return string.charAt(Rndm.integer(0,string.length));
};
Rndm.generateWordFromTwoSets = function(length,setA,setB) {
	var theWord = "";
	var alt = Rndm.bool();
	var _g = 0;
	while(_g < length) {
		var i = _g++;
		if(alt) theWord += Rndm.charFromString(setA); else theWord += Rndm.charFromString(setB);
		alt = !alt;
	}
	return theWord;
};
Rndm.generateWord = function(length) {
	if(length == null) length = 6;
	return Rndm.generateWordFromTwoSets(length,"aeio","bcdglmnprst");
};
Rndm.generatePassword = function(length,strength) {
	if(strength == null) strength = 0;
	if(length == null) length = 9;
	var vowels = "aeiouy";
	var consonants = "bcdfghjklmnpqrstvwxz";
	if(strength == 0) {
	} else if(strength == 1) {
		consonants += consonants.toUpperCase();
		vowels += vowels.toUpperCase();
	} else if(strength == 2) vowels += "0123456789"; else if(strength == 3) consonants += "!@#$%^&*()"; else if(strength == 4) {
		vowels += "!@#$%^&*()";
		consonants += "0123456789";
	}
	return Rndm.generateWordFromTwoSets(length,vowels,consonants);
};
Rndm.staticDice = function(diceSides,numberOfDice) {
	var value = Rndm.integer(1,diceSides * numberOfDice + 1);
	Rndm.lastStaticDiceRoll = value;
	return value;
};
Rndm.randomizeSeed = function() {
	Rndm.set_seed(new Date().getTime());
};
Rndm.get_seed = function() {
	if(Rndm._seed == 0) Rndm.randomizeSeed();
	return Rndm._seed;
};
Rndm.set_seed = function(value) {
	Rndm._currentSeed = value;
	Rndm._seed = value;
	return value;
};
Rndm.get_currentSeed = function() {
	if(Rndm._currentSeed == 0) Rndm.randomizeSeed();
	return Rndm._currentSeed;
};
Rndm.random = function() {
	if(Rndm.useForNextSeedOnly != 0) {
		var temp = Rndm.useForNextSeedOnly;
		Rndm.useForNextSeedOnly = 0;
		return temp * 16807 % 2147483647 / 2147483647 + 0.000000000233;
	} else return (Rndm._currentSeed = Rndm.get_currentSeed() * 16807 % 2147483647) / 2147483647 + 0.000000000233;
};
Rndm.reset = function() {
	Rndm._currentSeed = Rndm._seed;
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
		var i = Std.parseInt(this.seed);
		Rndm.set_seed(i);
		var array = [];
		var sizeofMatrix = this.height * this.width;
		var _g = 0;
		while(_g < sizeofMatrix) {
			var i1 = _g++;
			array[i1] = i1;
		}
		var i2 = array.length;
		var j;
		var _g1 = 0;
		while(_g1 < sizeofMatrix) {
			var i3 = _g1++;
			var j1 = Math.floor(Rndm["float"](1.0) * (sizeofMatrix - 1 - i3));
			var tmp = array[i3];
			array[i3] = array[j1];
			array[j1] = tmp;
		}
		return array;
	}
};
var Std = function() { };
Std.parseInt = function(x) {
	var v = parseInt(x,10);
	if(v == 0 && (HxOverrides.cca(x,1) == 120 || HxOverrides.cca(x,1) == 88)) v = parseInt(x);
	if(isNaN(v)) return null;
	return v;
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
Rndm.commonVowels = "aeio";
Rndm.allVowels = "aeiouy";
Rndm.commonConsonants = "bcdglmnprst";
Rndm.allConsonants = "bcdfghjklmnpqrstvwxz";
Rndm.floats = "0123456789";
Rndm.symbols = "!@#$%^&*()";
Rndm._seed = 0;
Rndm._currentSeed = 0;
Rndm.useForNextSeedOnly = 0;
Main.main();
})(typeof window != "undefined" ? window : exports);
