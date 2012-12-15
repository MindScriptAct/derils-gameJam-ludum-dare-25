package com.mindscriptact.starlingtest.engine.tasks {
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
			curentPosition.x -= 10;
		}
		if (keyRegistry[Keyboard.RIGHT] == true) {
			curentPosition.x += 10;
		}
		if (keyRegistry[Keyboard.UP] == true) {
			curentPosition.y -= 10;
		}
		if (keyRegistry[Keyboard.DOWN] == true) {
			curentPosition.y += 10;
		}
	
	}

}
}