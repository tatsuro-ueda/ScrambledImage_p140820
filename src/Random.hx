package;

/**
 * Adapted from Nicolas Cannasse code.
 *
 * @author Franco Ponticelli
 * @author Nicolas Cannasse
 */

class Random
{
	public var seed : Int;
	
	public function new(seed = 1)
	{
		this.seed = seed;
	}
	
	public inline function int() : Int
	{
		return (seed = (seed * 16807) % 0x7FFFFFFF) & 0x3FFFFFFF;
	}

	public inline function float() : Float
	{
		return int() / 1073741823.0; // divided by 2^30-1
	}
}