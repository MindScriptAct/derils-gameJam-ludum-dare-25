package com.mindscriptact.starlingUtils.easyShapes {
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class EasySquareImage extends EasyShapeImage {
	
	private var textureCash:Texture;
	private var fillColor:int;
	private var lineColor:int;
	private var size:int;
	private var lineThickness:Number;
	
	public function EasySquareImage(size:int, fillColor:int = 0xFF0000, lineColor:int = 0x0000FF, lineThickness:Number = 0.1) {
		
		this.size = size;
		this.lineColor = lineColor;
		this.fillColor = fillColor;
		this.lineThickness = lineThickness;
		
		super(size + 2 + lineThickness, size + 2 + lineThickness, true, 0x0, true);
		
		if (!textureCash) {
			textureCash = texture;
		}
	}
	
	override protected function provideTexture():Texture {
		return textureCash;
	}
	
	override protected function drawShape():void {
		if (fillColor > 0) {
			picShape.graphics.beginFill(fillColor);
		}
		if (lineColor > 0) {
			picShape.graphics.lineStyle(lineThickness, lineColor);
		}
		picShape.graphics.drawRect(1 + lineThickness / 2, 1 + lineThickness / 2, size, size);
		if (fillColor > 0) {
			picShape.graphics.endFill();
		}
	}
}
}