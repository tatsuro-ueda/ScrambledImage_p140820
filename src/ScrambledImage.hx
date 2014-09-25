package ;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import Rndm;

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
	var seed : String = null;
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
		var i = Std.parseInt( this.seed );
		//var r = new Rndm( i );
		Rndm.seed = i; ///ここがおかしい？？？
		var array = [];
		var sizeofMatrix : Int = this.height * this.width;
		
		// At first, make array[] list as [0, 1, 2, 3..., (sizeof_matrix - 1)]
		for ( i in 0...sizeofMatrix ) {
			array[ i ] = i;
		}
		
		/*
		// Then, randomize array[] list by Fisher–Yates shuffle algorithm
		// for cell_i in [(sizeofMatrix - 1)..1]
		for ( i in (sizeofMatrix - 1)...-1 ) {
			//var j = Math.floor( r.float() * ( i + 1 ) );
			var j : Int = Rndm.integer( i + 1 );
			trace( j );
			var tmp : Int = array[ i ];
			array[ i ] = array [ j ];
			array[ j ] = tmp;
		}
		*/
		
		var i:Int = array.length;
		var j:Int;
		for ( i in 0...sizeofMatrix ) {
			var j = Math.floor( Rndm.float( 1.0 ) * ((sizeofMatrix - 1) - i) );
			var tmp = array[i];
			array[i] = array[j];
			array[j] = tmp;
		}
		
		return array;
	}
}