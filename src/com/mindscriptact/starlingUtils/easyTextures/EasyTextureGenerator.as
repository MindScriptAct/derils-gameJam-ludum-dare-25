package com.mindscriptact.starlingUtils.easyTextures {
import flash.display.BitmapData;
import flash.display.Shape;
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EasyTextureGenerator {
	
	static public function rectangle(width:int, height:int, fillColor:int = 0xFF0000, lineColor:int = 0x0000FF, lineThickness:Number = 0.1):Texture {
		
		var bitmapData:BitmapData = new BitmapData(width + lineThickness, height + lineThickness, true, 0x0);
		
		var picShape:Shape = new Shape();
		
		if (fillColor > 0) {
			picShape.graphics.beginFill(fillColor);
		}
		if (lineColor > 0) {
			picShape.graphics.lineStyle(lineThickness, lineColor);
		}
		picShape.graphics.drawRect(1 + lineThickness / 2, 1 + lineThickness / 2, width, height);
		if (fillColor > 0) {
			picShape.graphics.endFill();
		}
		
		bitmapData.draw(picShape);
		
		return Texture.fromBitmapData(bitmapData)
	}

}
}