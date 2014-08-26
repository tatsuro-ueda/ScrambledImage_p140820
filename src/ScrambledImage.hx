package ;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

/**
 * ...
 * @author Tatsuro Ueda
 */
@:expose( "ScrambledImage" )
class ScrambledImage{

	var fileName : String = null;
	var shuffleMatrix : Array<Array<Int>> = [];
	var context : CanvasRenderingContext2D = null;
	var canvas : CanvasElement = null;
	var canvasId : String = null;
	var seed : Int = null;
	// HeightPartitionNum
	var height : Int = null;
	// WidthPartitionNum
	var width : Int = null;
  
	public function new( fileName : String, params : Dynamic ) {
		this.fileName = fileName;
		this.seed = params.seed;
		this.height = params.height;
		this.width = params.width;
		this.canvasId = params.canvasIdString;
		this.shuffleMatrix = 
			[
				[0]
			];
	}
	
	public function getShuffleArray_() {
		var r = new Random( this.seed );
		var array = [];
		var sizeofMatrix : Int = this.height * this.width;
		
		// At first, make a[] list as [1, 2, 3..., (sizeof_matrix - 1)]
		for ( i in 0...sizeofMatrix ) {
			array[ i ] = i;
		}
		
		// Then, randomize a[] list by Fisher–Yates shuffle algorithm
		for ( i in 0...sizeofMatrix ) {
			var j = Math.floor( r.float() * ( i + 1 ) );
			var tmp : Int = array[ i ];
			array[ i ] = array [ j ];
			array[ j ] = tmp;
		}
		
		return array;
	}
}