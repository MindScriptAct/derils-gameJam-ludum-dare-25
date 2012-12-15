package com.mindscriptact.starlingUtils.easyShapes {
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EasyRectangeImage extends EasyShapeImage {
	
	private var textureCash:Texture;
	private var fillColor:int;
	private var lineColor:int;
	
	private var rectWidth:int;
	private var rectHeight:int;
	
	private var lineThickness:Number;
	
	public function EasyRectangeImage(width:int, height:int, fillColor:int = 0xFF0000, lineColor:int = 0x0000FF, lineThickness:Number = 0.1, center:Boolean = false) {
		this.rectWidth = width;
		this.rectHeight = height;
		
		this.lineColor = lineColor;
		this.fillColor = fillColor;
		this.lineThickness = lineThickness;
		
		super(width + lineThickness, height + lineThickness, true, 0x0, center);
		
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
		picShape.graphics.drawRect(1 + lineThickness / 2, 1 + lineThickness / 2, rectWidth, rectHeight);
		if (fillColor > 0) {
			picShape.graphics.endFill();
		}
	}
}
}