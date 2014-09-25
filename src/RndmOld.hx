/**
* Rndm by Grant Skinner. Jan 15, 2008
* Visit www.gskinner.com/blog for documentation, updates and more free code.
*
* Incorporates implementation of the Park Miller (1988) "minimal standard" linear 
* congruential pseudo-random number generator by Michael Baczynski, www.polygonal.de.
* (seed * 16807) % 2147483647
*
*
*
* Copyright (c) 2008 Grant Skinner
* 
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/

// Provides common random functions using a seeded random system. Can be used through static interface or via instantiation.

class RndmOld {
// static interface:
	// NOTE: for usage information, look at the instance methods below.

	static var _instance : RndmOld;
	
	public static var instance( get, null ) : RndmOld;
	static function get_instance() {
		if (_instance == null) { _instance = new Rndm(); }
		return _instance;
	}
	
	// ここのsetterメソッドでシードを設定する
	public static var seed( get, set ) : UInt;
	public static function get_seed() : UInt {
		return instance.internalSeed;
	}
	public static function set_seed( value : UInt ) : UInt {
		return instance.internalSeed = value;
	}
	
	public static var currentSeed( get, null ) : UInt;
	public static function get_currentSeed() : UInt {
		return instance.internalCurrentSeed;
	}
	
	public static function random() : Float {
		return instance._random();
	}
	
	public static function float( min : Float, ?max : Float) : Float {
		max = (max != null) ? max : Math.NaN;
		return instance._float( min, max );
	}
	
	public static function boolean( chance : Float = 0.5 ) : Bool {
		return instance._boolean(chance);
	}
	
	public static function sign( chance : Float = 0.5 ) : Int {
		return instance._sign( chance );
	}
	
	public static function bit( chance : Float = 0.5) : Int {
		return instance._bit( chance );
	}
	
	public static function integer( min : Float, ?max : Float ) : Int {
		max = (max != null) ? max : Math.NaN;
		return instance._integer( min, max );
	}
	
	public static function reset() : Void {
		instance._reset();
	}
	
// constants:
// private properties:
	var _seed : UInt = 0;
	var _currentSeed : UInt = 0;

// public properties:
	
// constructor:
	public function RndmOld( seed : UInt = 1 ) {
		_seed = _currentSeed = seed;
	}
	
// public getter/setters:

	// seed = Math.random()*0xFFFFFF; // sets a random seed
	// seed = 50; // sets a static seed
	public var internalSeed( get, set ) : UInt;
	public function get_internalSeed() : UInt {
		return _seed;
	}
	public function set_internalSeed( value : UInt) : UInt {
		return _seed = _currentSeed = value;
	}
	
	// gets the current seed
	public var internalCurrentSeed( get, null ) : UInt;
	public function get_internalCurrentSeed() : UInt {
		return _currentSeed;
	}

// public methods:
	// random(); // returns a number between 0-1 exclusive.
	public function _random() : Float {
		return ( _currentSeed = (_currentSeed * 16807) % 2147483647) / 0x7FFFFFFF+0.000000000233;
	}
	
	// float(50); // returns a number between 0-50 exclusive
	// float(20,50); // returns a number between 20-50 exclusive
	public function _float( min : Float, ?max : Float ) : Float {
		max = (max != null) ? max : Math.NaN;
		if ( Math.isNaN( max ) ) { max = min; min=0; }
		return random() * ( max - min ) + min;
	}
	
	// boolean(); // returns true or false (50% chance of true)
	// boolean(0.8); // returns true or false (80% chance of true)
	public function _boolean( chance : Float = 0.5 ) : Bool {
		return ( random() < chance );
	}
	
	// sign(); // returns 1 or -1 (50% chance of 1)
	// sign(0.8); // returns 1 or -1 (80% chance of 1)
	public function _sign( chance : Float = 0.5 ) : Int {
		return if( random() < chance ) 1 else -1;
	}
	
	// bit(); // returns 1 or 0 (50% chance of 1)
	// bit(0.8); // returns 1 or 0 (80% chance of 1)
	public function _bit( chance : Float = 0.5 ) : Int {
		return if( random() < chance ) 1 else 0;
	}
	
	// integer(50); // returns an integer between 0-49 inclusive
	// integer(20,50); // returns an integer between 20-49 inclusive
	public function _integer( min : Float, ?max : Float ) : Int {
		max = (max != null) ? max : Math.NaN;
		if ( Math.isNaN( max ) ) { max = min; min=0; }
		// Need to use floor instead of bit shift to work properly with negative values:
		return Math.floor( float( min,max ) );
	}
	
	// reset(); // resets the number series, retaining the same seed
	public function _reset() : Void {
		_seed = _currentSeed;
	}
}