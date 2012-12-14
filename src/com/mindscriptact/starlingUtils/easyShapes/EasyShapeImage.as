package com.mindscriptact.starlingUtils.easyShapes {
import flash.display.BitmapData;
import flash.display.Shape;
import starling.display.Image;
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class EasyShapeImage extends Image {
	
	protected var picShape:Shape;
	
	public function EasyShapeImage(width:int = 100, height:int = 100, transparent:Boolean = true, fillColor:uint = 0x0, center:Boolean = false) {
		
		var texture:Texture = provideTexture();
		if (!texture) {
			
			var bitmapData:BitmapData = provideBitmapData();
			if (!bitmapData) {
				bitmapData = new BitmapData(width, height, transparent, fillColor);
			}
			
			picShape = new Shape();
			
			drawShape();
			
			bitmapData.draw(picShape);
			
			texture = Texture.fromBitmapData(bitmapData);
		}
		

		
		super(texture);
		
		if (center) {
			this.pivotX = width >> 1;
			this.pivotY = height >> 1;
		}
	}
	
	/**
	 * ovedire this, to return your own bitmap data.
	 */
	protected function provideBitmapData():BitmapData {
		return null;
	}
	
	/**
	 * ovedire this, to return your own texture
	 */
	protected function provideTexture():Texture {
		return null;
	}
	
	/**
	 * ovedire this, and draw into picShape
	 */
	protected function drawShape():void {
		// for overide
	}

}
}