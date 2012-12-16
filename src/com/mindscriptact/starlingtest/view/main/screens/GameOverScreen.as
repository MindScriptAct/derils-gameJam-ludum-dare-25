package com.mindscriptact.starlingtest.view.main.screens {
import com.mindscriptact.starlingtest.constants.GameConstants;
import flash.display.Shape;
import flash.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameOverScreen extends Sprite {
	
	public function GameOverScreen() {
		var rectangle:Shape = new Shape();
		rectangle.graphics.beginFill(0xFF0000);
		rectangle.graphics.drawRect(0, 0, GameConstants.GAME_WIDTH, GameConstants.GAME_HEIGHT);
		rectangle.graphics.endFill();
		this.addChild(rectangle);
	}

}
}