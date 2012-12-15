package com.mindscriptact.starlingUtils.easySprites {
import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EasyBackgroundSprite extends Sprite {
	
	public function EasyBackgroundSprite(texture:Texture, columns:int = 1, rows:int = 1) {
		
		for (var i:int = 0; i < columns; i++) {
			for (var j:int = 0; j < rows; j++) {
				var bgImage:Image = new Image(texture);
				bgImage.x = bgImage.width * i;
				bgImage.y = bgImage.height * j;
				this.addChild(bgImage);
			}
		}
	}

}
}