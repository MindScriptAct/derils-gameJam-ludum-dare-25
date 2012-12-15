package com.mindscriptact.starlingUtils.easyShapes {
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EasyCircleImage extends EasyShapeImage {
	
	private var textureCash:Texture;
	private var fillColor:int;
	private var lineColor:int;
	private var radius:int;
	private var lineThickness:Number;
	
	public function EasyCircleImage(radius:int, fillColor:int = 0xFF0000, lineColor:int = 0x0000FF, lineThickness:Number = 0.1) {
		
		this.radius = radius;
		this.lineColor = lineColor;
		this.fillColor = fillColor;
		this.lineThickness = lineThickness;
		
		super(radius * 2, radius * 2, true, 0x0, true);
		
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
		picShape.graphics.drawCircle(radius, radius, radius);
		if (fillColor > 0) {
			picShape.graphics.endFill();
		}
	}
}
}