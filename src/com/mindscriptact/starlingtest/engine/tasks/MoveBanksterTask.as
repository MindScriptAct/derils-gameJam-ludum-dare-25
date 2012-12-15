package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.constants.GameConstants;
import flash.geom.Point;
import flash.ui.Keyboard;
import flash.utils.Dictionary;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MoveBanksterTask extends Task {
	
	[Inject(name="bankster_Position")]
	public var curentPosition:Point;
	
	[Inject(name="keyBoardRegistry")]
	public var keyRegistry:Dictionary
	
	override public function run():void {
		
		if (keyRegistry[Keyboard.LEFT] == true) {
			curentPosition.x -= GameConstants.BANKSTA_MOVE_SPEED;
		}
		if (keyRegistry[Keyboard.RIGHT] == true) {
			curentPosition.x += GameConstants.BANKSTA_MOVE_SPEED;
		}
		if (keyRegistry[Keyboard.UP] == true) {
			curentPosition.y -= GameConstants.BANKSTA_MOVE_SPEED;
		}
		if (keyRegistry[Keyboard.DOWN] == true) {
			curentPosition.y += GameConstants.BANKSTA_MOVE_SPEED;
		}
		
		if (curentPosition.x < 0 + GameConstants.BANKSTA_SIZE) {
			curentPosition.x = 0 + GameConstants.BANKSTA_SIZE;
		}
		if (curentPosition.x > GameConstants.GAME_WIDTH - GameConstants.BANKSTA_SIZE) {
			curentPosition.x = GameConstants.GAME_WIDTH - GameConstants.BANKSTA_SIZE;
		}
		if (curentPosition.y < 0 + GameConstants.BANKSTA_SIZE) {
			curentPosition.y = 0 + GameConstants.BANKSTA_SIZE;
		}
		if (curentPosition.y > GameConstants.GAME_HEIGHT - GameConstants.BANKSTA_SIZE) {
			curentPosition.y = GameConstants.GAME_HEIGHT - GameConstants.BANKSTA_SIZE;
		}
	}

}
}