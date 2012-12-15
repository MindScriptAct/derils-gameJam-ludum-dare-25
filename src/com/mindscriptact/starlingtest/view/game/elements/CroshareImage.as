package com.mindscriptact.starlingtest.view.game.elements {
import com.mindscriptact.starlingUtils.easyShapes.EasyShapeImage;
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class CroshareImage extends EasyShapeImage {
	static private var textureCash:Texture;
	
	public function CroshareImage() {
		super(10, 10, true, 0x0, true);
		
		if (!textureCash) {
			textureCash = texture;
		}
	}
	
	override protected function provideTexture():Texture {
		return textureCash;
	}
	
	override protected function drawShape():void {
		picShape.graphics.lineStyle(0.1, 0xFF0000);
		picShape.graphics.moveTo(0, 5);
		picShape.graphics.lineTo(10, 5);
		picShape.graphics.moveTo(5, 0);
		picShape.graphics.lineTo(5, 10);
	}

}
}