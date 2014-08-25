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
	//var shuffleMatrix : Array = [];
	var context : CanvasRenderingContext2D = null;
	var canvas : CanvasElement = null;
	var canvasId : String = null;
	var seed : Int = null;
	// HeightPartitionNum
	var height : Int = null;
	// WidthPartitionNum
	var width : Int = null;
  
	public function new(fileName : String, seed : Int, height : Int, width : Int) {
		this.fileName = fileName;
		this.seed = seed;
		this.height = height;
		this.width = width;
	}
	
}