package com.mindscriptact.starlingUtils.easyShapes {
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EasySquareImage extends EasyRectangeImage {
	
	public function EasySquareImage(size:int, fillColor:int = 0xFF0000, lineColor:int = 0x0000FF, lineThickness:Number = 0.1, center:Boolean = true) {
		super(size, size, fillColor, lineColor, lineThickness, center);
	}

}
}